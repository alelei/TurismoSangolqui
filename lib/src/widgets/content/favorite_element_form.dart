import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismosangolqui/src/models/Place_models.dart';
import 'package:turismosangolqui/src/models/favorite_element_model.dart';
import 'package:turismosangolqui/src/providers/fisio_elements_provider.dart';
import 'package:turismosangolqui/src/services/places_service.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';

DateTime selectedDate = DateTime.now();

class FavoriteElementForm extends StatefulWidget {
  FavoriteElementForm({Key? key}) : super(key: key);

  @override
  _FavoriteElementFormState createState() => _FavoriteElementFormState();
}

class _FavoriteElementFormState extends State<FavoriteElementForm> {
  PlaceService _serviceTypePlace = new PlaceService();
  List<Place> _types = [];
//Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();

  //Un objeto del modelo a enviar
  late FavoriteElement _element;
  bool _onSaving = false;
  DateTime _selectedDate = DateTime.now();

  List<String> _typesElement = ['Activo', 'Inactivo'];
  String _typeValue = "";

  @override
  void initState() {
    super.initState();
    _loadTypePlaces();
    _typeValue = _typesElement.elementAt(0);
    _element = FavoriteElement.create('Parque Central', '', _selectedDate);
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
                    children: [
                      _inputPlace(),
                      _inputFecha(),
                      _inputComent(),
                      _buttons()
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  _inputPlace() {
    return DropdownButton<String>(
      value: _element.place_name,
      icon: const Icon(Icons.expand_more),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      underline: Container(
        height: 2,
        color: Theme.of(context).dividerColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          _element.place_name = newValue!;
        });
      },
      items: _types.map<DropdownMenuItem<String>>((Place value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name!),
        );
      }).toList(),
    );
  }

  _inputFecha() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fecha de Visita", style: Theme.of(context).textTheme.subtitle1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () => _selectDate(context), // Refer step 3
                    child: Text(
                      'Escoger Fecha',
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Theme.of(context).primaryColor.withBlue(200),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  _inputComent() {
    return TextFormField(
        initialValue: _element.coment,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.coment = value.toString();
        },
        validator: (value) {
          if (value!.length < 4) {
            return "Debe ingresar un comentario del Lugar";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Comentario"),
        maxLength: 255,
        maxLines: 4);
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
    fisioProvider
        .addElement(_element.place_name, _element.coment, _element.fecha)
        .then((value) {
      _element = value;
      formKey.currentState!.reset();
      _onSaving = false;
      setState(() {});
    });
  }

  _loadTypePlaces() {
    _serviceTypePlace.getPlaces().then((value) {
      _types = value;
      setState(() {});
    });
  }
}
