import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismosangolqui/src/models/favorite_element_model.dart';
import 'package:turismosangolqui/src/providers/fisio_elements_provider.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';

class FavoriteElementForm extends StatefulWidget {
  FavoriteElementForm({Key? key}) : super(key: key);

  @override
  _FavoriteElementFormState createState() => _FavoriteElementFormState();
}

class _FavoriteElementFormState extends State<FavoriteElementForm> {
//Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();

  //Un objeto del modelo a enviar
  late FavoriteElement _element;
  bool _onSaving = false;
  List<String> _typesElement = ['Activo', 'Inactivo'];
  String _typeValue = "";

  @override
  void initState() {
    super.initState();
    _typeValue = _typesElement.elementAt(0);
    _element = FavoriteElement.create("", _typeValue == "Activo");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            width: size.width * .80,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Theme.of(context).dividerColor)),
            child: Form(
                key: formKey,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 32.0, horizontal: 14.0),
                  child: Column(
                    children: [_inputName(), _inputActive(), _buttons()],
                  ),
                )),
          )
        ],
      ),
    );
  }

  _inputName() {
    return TextFormField(
        initialValue: _element.name,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.name = value.toString();
        },
        validator: (value) {
          if (value!.length < 5) {
            return "Debe ingresar una descripción con al menos 5 caracteres";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Nombre"),
        maxLength: 255,
        maxLines: 4);
  }

  Widget _inputActive() {
    return Column(
        children: _typesElement
            .map((e) => ListTile(
                  title: Text(e),
                  leading: Radio(
                    value: e,
                    groupValue: _typeValue,
                    onChanged: (String? value) {
                      _typeValue = value.toString();
                      _element.active = _typeValue == "Activo";
                      setState(() {});
                    },
                  ),
                ))
            .toList());
  }

  _buttons() {
    return _onSaving
        ? Container(
            height: 50.0,
            width: 50.0,
            child: Center(child: CircularProgressIndicator()))
        : Tooltip(
            message: "Guardar",
            child: ElevatedButton(
              onPressed: () {
                _sendForm();
              },
              child: Icon(Icons.save),
              style: Standard.buttonStandardStyle(context),
            ),
          );
  }

  _sendForm() {
    if (!formKey.currentState!.validate()) return;
    _onSaving = true;
    setState(() {});

    formKey.currentState!.save();

    final fisioProvider =
        Provider.of<FisioElementProvider>(context, listen: false);
    fisioProvider.addElement(_element.name, _element.active).then((value) {
      _element = value;
      formKey.currentState!.reset();
      _onSaving = false;
      setState(() {});
    });
  }
}
