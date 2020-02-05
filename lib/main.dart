import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main () => runApp(MaterialApp(
  home: HomePage(),
)) ;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String formattedTime='Pick your time' ;
  static DateTime selectedDate = DateTime.now();
  static var formatter = new DateFormat('dd-MM-yyyy');
  var formatted= formatter.format(selectedDate);

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('TimePicker'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0,),
            RaisedButton(onPressed: (){
              _selectDate(context);
            },
              child: Text('Pick your Date'),

            ),
            SizedBox(height: 10.0,),

            RaisedButton(onPressed: (){
              _selectTime(context);

            },
              child: Text('Pick time'),

            ),
            SizedBox(height: 20.0,),


            Text(formatted.toString()),
            SizedBox(height: 20.0,),

            Text(formattedTime.toString()),



          ],
        ),
      ),
    );
  }

  Future<DatePickerMode> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        formatted = formatter.format(picked);
      });
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {

    final TimeOfDay  pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),


    );
    TimeOfDay selectedTime = TimeOfDay.now();

    if (pickedTime != null && pickedTime != selectedTime)

      setState(() {

        selectedTime = pickedTime;
        MaterialLocalizations localizations = MaterialLocalizations.of(context);
        formattedTime = localizations.formatTimeOfDay(selectedTime, alwaysUse24HourFormat: false);

        print('ll $selectedTime');

      });

  } 


}
