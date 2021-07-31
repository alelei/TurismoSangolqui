import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turismosangolqui/src/models/ReservationUser_models.dart';
import 'package:turismosangolqui/src/models/Reservation_models.dart';
import 'package:turismosangolqui/src/services/reservationsUser_service.dart';
import 'package:turismosangolqui/src/utils/format_datetime.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';

DateTime selectedDate = DateTime.now();

class ReservationForm extends StatefulWidget {
   final formKey = GlobalKey<FormState>();
  ReservationForm({Key? key, required this.reservation}) : super(key: key);
  final Reservation reservation;

// Option 2
  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  String dropdownValue = 'Uno';
  final formKey = GlobalKey<FormState>();

  DateTime selected2Date = DateTime.now();

  ReservationUserService _serviceReservation = new ReservationUserService();
  //Un objeto del modelo a enviar
  late ReservationUser _reservation;
  late File _image;
  late double _a = 0;
  bool _onSaving = false;
  bool _imageSelected = false;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _reservation = new ReservationUser.create(
      "",
      "",
      "",
      "Uno",
      "Uno",
      DateTime.now(),
      DateTime.now(),
      '',
      "",
      "",
    );
    _loadFecha();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Standard.appBar(context, Text('Atras')),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Standard.getBackground(context),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 25.0),
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                _showImage(),
                                Container(
                                  width: 325.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Tooltip(
                                        message: "Tomar foto",
                                        child: ElevatedButton(
                                          onPressed: _takeImage,
                                          child: Icon(Icons.camera_alt),
                                          style: Standard.buttonStandardStyle(
                                              context),
                                        ),
                                      ),
                                      Tooltip(
                                        message: "Buscar foto",
                                        child: ElevatedButton(
                                          onPressed: _pickImage,
                                          child: Icon(Icons.image),
                                          style: Standard.buttonStandardStyle(
                                              context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Standard.titleToForm(context, "Registro de Reserva",
                                TextAlign.center),
                            _form()
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        )));
  }

  _form() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      width: size.width * .85,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Theme.of(context).dividerColor)),
      child: Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _inputName(),
                _inputChilds(),
                _inputAdults(),
                _inputFechaentrada(),
                _inputFechaSalida(),
                _inputDays(),
                _buttons(),
              ],
            ),
          )),
    ));
  }

  _inputName() {
    return TextFormField(
        initialValue: widget.reservation.name,
        enabled: false,
        onSaved: (value) {
          _reservation.name = widget.reservation.name;
          _reservation.photo = widget.reservation.photo;
          _reservation.pago = widget.reservation.photo;
          _reservation.price = widget.reservation.price;

          _reservation.description = 'Allex';
        },
        textAlign: TextAlign.start,
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un nombre con al menos 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Nombre de la Reserva"),
        maxLength: 35);
  }

  _inputDays() {
    return Text(
      FormatTime.getAge(_reservation.fecha_ingreso, _reservation.fecha_Salida) +
          ' '
              'dias',
    );
  }

  _inputChilds() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Número de Ninos'),
        DropdownButton<String>(
          value: _reservation.number_childrens,
          icon: const Icon(Icons.expand_more),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Theme.of(context).accentColor,
          ),
          onChanged: (String? newValue5) {
            setState(() {
              _reservation.number_childrens = newValue5!;
            });
          },
          items: <String>['Uno', 'Dos', 'Tres', 'Cuatro']
              .map<DropdownMenuItem<String>>((String? value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value!),
            );
          }).toList(),
        ),
      ],
    );
  }

  _inputAdults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Número de Adultos'),
        DropdownButton<String>(
          value: _reservation.number_adults,
          icon: const Icon(Icons.expand_more),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue2) {
            setState(() {
              _reservation.number_adults = newValue2!;
            });
          },
          items: <String>["Uno", "2"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  _inputFechaentrada() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fecha de Entrada",
              style: Theme.of(context).textTheme.subtitle1),
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

  _inputFechaSalida() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fecha de Salida", style: Theme.of(context).textTheme.subtitle1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "${_reservation.fecha_Salida.toLocal()}".split(' ')[0],
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () => _selectDate2(context), // Refer step 3
                    child: Text(
                      'Escoger Fecha',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
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
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _reservation.fecha_ingreso = selectedDate;
        _reservation.fecha_Salida = selectedDate;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _reservation.fecha_ingreso, // Refer step 1
      firstDate: _reservation.fecha_ingreso.toUtc(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selected2Date)
      setState(() {
        selected2Date = picked;
        _reservation.fecha_Salida = selected2Date;
        _reservation.days = FormatTime.getAge(
            _reservation.fecha_ingreso, _reservation.fecha_Salida);
      });
  }

  _buttons() {
    return _onSaving
        ? Center(
            child: Container(
                height: 50.0,
                width: 50.0,
                child: Center(child: CircularProgressIndicator())),
          )
        : Center(
            child: Tooltip(
              message: "Guardar",
              child: ElevatedButton(
                onPressed: () {
                  _sendForm();
                  _onSaving = true;
                  setState(() {});
                },
                child: Icon(Icons.save),
                style: Standard.buttonStandardStyle(context),
              ),
            ),
          );
  }

  _sendForm() async {
    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState!.save();
    if (_imageSelected) {
      _reservation.photo = await _serviceReservation.uploadImage(_image);
    }
    
    //Llamamos al servicio para guardar el reporte
    _serviceReservation.sendReservationUser(_reservation).then((value) {
      formKey.currentState!.reset();
      Navigator.pop(context);
    });
  }

  _showImage() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).canvasColor),
      child: ClipOval(
          child: _imageSelected == false
              ? Image.asset(
                  "assets/images/user.png",
                  fit: BoxFit.fitHeight,
                )
              : Image.file(_image)),
    );
  }

  _loadFecha() {
    _reservation.fecha_ingreso = _reservation.fecha_ingreso;
  }

  _takeImage() {
    _selectImage(ImageSource.camera);
  }

  _pickImage() {
    _selectImage(ImageSource.gallery);
  }

  Future _selectImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imageSelected = true;
    } else {
      print('No image selected.');
      _imageSelected = false;
    }
    setState(() {});
  }
}
