import 'package:intl/intl.dart';

class FormatTime {
  static String getAge(DateTime entradaDate, DateTime salidaDate) {
    try {
      var difference = salidaDate.difference(entradaDate).inDays;

      return "$difference";
    } on Exception catch (e) {
      print("Exception No Time To Match $e");
      return "--:--";
    }
  }

  static String getAgeBirthDate(DateTime entrada, DateTime sal) {
    try {
      String birth = DateFormat.yMMMd().format(entrada);
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - entrada.year;
      int month1 = currentDate.month;
      int month2 = entrada.month;
      if (month2 > month1) {
        age--;
      } else if (month1 == month2) {
        int day1 = currentDate.day;
        int day2 = entrada.day;
        if (day2 > day1) {
          age--;
        }
      }
      return "$birth | $age años";
    } on Exception catch (e) {
      print("Exception No Time To Match $e");
      return "--:--";
    }
  }

  static String getDateToSave(DateTime dateTime) {
    DateFormat format = new DateFormat("yyyy-MM-dd HH:mm:ssz");
    String result = format.format(dateTime);
    return result;
  }
}
