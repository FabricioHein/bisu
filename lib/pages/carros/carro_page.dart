import 'package:bisu/pages/carros/carros.dart';
import 'package:bisu/widgets/app_button.dart';
import 'package:flutter/material.dart';
class  CarroPage extends StatelessWidget {
  Carro carro;

  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
        actions: <Widget>[
          IconButton(icon:
          Icon(Icons.place), onPressed: () {},
          ),
          IconButton(icon:
          Icon(Icons.videocam), onPressed: () {},
          ),
          PopupMenuButton <String>(
            onSelected: (String value) => _OnClickPoupoupMenu(value),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "Editar", child: Text("Editar"),)
              ];
            },)
        ],
      ),
      body: _body(),
    )
    ;
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(16),
        child: ListView(children: <Widget>[
          Image.network(carro.urlFoto),

          Text(
            carro.tipo,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 25),
          ),
          Text(
            carro.descricao,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 25),
          ),

          ButtonBar(
            children: <Widget>[
              IconButton(icon: Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ), onPressed: () {}),
              IconButton(icon: Icon(
                Icons.info_outline,
                color: Colors.redAccent,
              ), onPressed: () {},
              )
            ],
          ),
          AppButton(
            "Buy",
            onPressed: () {},
          ),

        ]));
  }

  _OnClickPoupoupMenu(value) {
    switch (value) {
      case "Editar":
        print("Editar !!");
        break;
    }
  }
}