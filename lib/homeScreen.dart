import 'dart:convert';

import 'package:coronavirus/tabs/countyPage.dart';
import 'package:coronavirus/tabs/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;
  Map worldData;
  List countryData;

  fetchWorldWideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  fetchCountryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
    _tabController=TabController(initialIndex: 0,length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 TRACKER',),
        leading: IconButton(icon: Icon(Icons.info_outline,color: Colors.white,), onPressed: (){
          return showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Developed by'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Ahmed Shaat'),
                      Text('ahmed2001.mohe.ps@gmail.com'),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
      body:TabBarView(
        children:[
          WorldwidePanel(worldData: worldData,),
          CountryPage(),
        ],
          controller: _tabController,
        ),
      bottomNavigationBar: Material(

        color: Colors.blueGrey.shade900,
        child: TabBar(tabs: [
          Tab(
            child: Text('Global'),
          ),
          Tab(
            child: Text('Local'),
          ),

        ],
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}
