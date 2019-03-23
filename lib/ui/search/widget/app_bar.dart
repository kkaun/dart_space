import 'package:dart_space/util/theme_data.dart';
import 'package:flutter/material.dart';


class DailyInfoAppBar extends StatelessWidget {

  DailyInfoAppBar({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        elevation: 4.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
             icon: Icon(
               Icons.calendar_today,
               color: Colors.black,),
             tooltip: 'Open Calendar',
             onPressed: () => _selectDate(context),
          ),
        ],
        title: Hero(
          child: Material(
            color: Colors.transparent,
            child: Text(
              "NASA Daily Info",
              style: TextStyle(
                color: CustomThemeData.secondaryColor,
                fontSize: 22.0,
              ),
            ),
          ),
          tag: "title1",
          transitionOnUserGestures: true,
        ),
      );
  }
  
  Future _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1995, 6, 17),
        lastDate: DateTime.now()
    );
    //if(picked != null) setState(() => _value = picked.toString());  //SET DATE AS EVENT!?
  }

}
