import 'package:flutter/material.dart';
import 'package:dart_space/util/gradients.dart';
import 'package:dart_space/ui/search/widget/app_bar.dart';

class DailyInfoPage extends StatefulWidget {
  @override
  _DailyInfoPageState createState() => _DailyInfoPageState();
}

class _DailyInfoPageState extends State<DailyInfoPage> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: DailyInfoAppBar().build(context),
      body: PageView.builder(
        itemBuilder: (context, position) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'TEXT1',
                              //WordData.greData[position].wordTitle,
                              style: TextStyle(color: Colors.white, fontSize: 30.0),
                            ),
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     _speakWord(WordData.greData[position].wordTitle);
                          //   },
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Icon(Icons.volume_up, color: Colors.white,),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'TEXT2',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: gradients[position % gradients.length],
                ),
              ),
            ],
          );
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }

}