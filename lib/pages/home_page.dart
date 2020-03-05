import 'package:bisu/pages/carros/carros_api.dart';
import 'package:bisu/pages/carros/carros_listview.dart';
import 'package:bisu/widgets/draw_list.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with  SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: (
             AppBar(title: Text("Pet & Me"),
           actions: <Widget>[
         IconButton(icon: Icon(Icons.favorite,
           color: Colors.white,), onPressed: (){}),
         IconButton(icon: Icon(Icons.shopping_basket,
         color: Colors.white,), onPressed: null)

           ],

           bottom: TabBar(tabs: <Widget>[
             Tab(
               icon: Icon(Icons.pets
               ),
             ),
             Tab(
               icon: Icon(
                 Icons.event,
               ),
             ),
             Tab(icon: Icon(
               Icons.home,
             ),
             )],),
        )
      ),
      body: TabBarView(children : [
        CarroListView(TipoCarro.classicos),
        CarroListView(TipoCarro.esportivos),
        CarroListView(TipoCarro.luxo),
      ]),
          drawer: DrawerList (),
        ),
    );
  }
}

