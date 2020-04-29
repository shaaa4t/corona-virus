import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);
  static String quote =
      "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less.";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: worldData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          :  Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey[100],
                  child: Text(
                    quote,
                    style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                    ),
                      textAlign: TextAlign.center
                  ),
                ),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
                  children: <Widget>[
                    StatusPanel(
                      title: 'CONFIRMED',
                      panelColor: Colors.red[100],
                      textColor: Colors.red,
                      count: worldData['cases'].toString(),
                    ),
                    StatusPanel(
                      title: 'ACTIVE',
                      panelColor: Colors.blue[100],
                      textColor: Colors.blue[900],
                      count: worldData['active'].toString(),
                    ),
                    StatusPanel(
                      title: 'RECOVERED',
                      panelColor: Colors.green[100],
                      textColor: Colors.green,
                      count: worldData['recovered'].toString(),
                    ),
                    StatusPanel(
                      title: 'DEATHS',
                      panelColor: Colors.grey[400],
                      textColor: Colors.grey[900],
                      count: worldData['deaths'].toString(),
                    ),
                    StatusPanel(
                      title: 'TODAY CASES',
                      panelColor: Colors.brown[300],
                      textColor: Colors.brown[900],
                      count: worldData['todayCases'].toString(),
                    ),
                    StatusPanel(
                      title: 'AFFECTED COUNTRIES',
                      panelColor: Colors.amber[300],
                      textColor: Colors.amber[900],
                      count: worldData['affectedCountries'].toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      height: 80,width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: textColor),),Text(count,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: textColor),)],
      ),
    );
  }
}