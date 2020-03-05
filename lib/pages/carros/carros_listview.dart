import 'package:bisu/pages/carros/carro_page.dart';
import 'package:bisu/pages/carros/carros.dart';
import 'package:bisu/pages/carros/carros_api.dart';
import 'package:bisu/utils/alert.dart';
import 'package:bisu/utils/nav.dart';
import 'package:flutter/material.dart';
class CarroListView extends StatefulWidget {
  String tipo;
  CarroListView(this.tipo);

  @override
  _CarroListViewState createState() => _CarroListViewState();
}

class _CarroListViewState extends State<CarroListView> with AutomaticKeepAliveClientMixin <CarroListView> {

  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();

  }

  _body(){
    return _CarsFuture();
  }

  FutureBuilder<List<Carro>> _CarsFuture() {
    Future<List<Carro>> future = CarrosApi.getCarros(widget.tipo);
    return FutureBuilder (
      future: future,
      builder: (context, snapshot) {
        if (! snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        List<Carro> carros = snapshot.data;
        return _ListViewCars(carros);
      },

    );
  }
}

_ListViewCars(List<Carro> carros) =>

    Container(
    padding: EdgeInsets.all(16),
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: carros != null ? carros.length: 0,
        itemBuilder: (context, index){
          Carro c = carros[index];
          return GestureDetector(
            onTap: ()=> (_CarroDetals(context, c))
            ,
            child: Card(
              
              color: Colors.white,
              child: Container(

                padding: EdgeInsets.all(5),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      c.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/classicos/Cadillac_Deville_Convertible.png",
                     fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.all(12),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(16)
                        ),
                           ),

                    ),
                Column(

                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                         c.nome,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),

                        ),
                        ButtonBarTheme(
                          data: ButtonBarTheme.of(context),
                          child: ButtonBar(
                            children: <Widget>[
                              IconButton(icon: Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              ),onPressed: ()=>alert(context, "ADD FAVORITE") ),
                              IconButton(icon: Icon(
                                Icons.shopping_basket,
                                color: Colors.redAccent,
                              ),onPressed: () => _CarroDetals(context, c)),
                                                  ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

            ),
          );
        }),

  );

  _CarroDetals(context,Carro c) {
    push(context, CarroPage(c));
  }






