import 'package:flutter/material.dart';
import 'cryptodata.dart';

class Cryptos extends StatelessWidget {
  const Cryptos({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title: Text("CRYPTO HUNT"),),
        body:Container(
          child: FutureBuilder(
            future: Getcrypto().getlist(),
            builder:(BuildContext context,AsyncSnapshot snapshot) {return ListView.builder(itemCount:snapshot.data.length,
            itemBuilder:  (BuildContext context, int index) {
                return Container(
                  decoration:BoxDecoration(border:Border.all(color:Colors.black)),
            height: 50,
            child: Center(child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                Image.network('${snapshot.data[index].image}'),
                Text('${snapshot.data[index].name}'),
                Text('${snapshot.data[index].price}'),
              ],
            )),
                );
              },);},
          ),
        )
      ),
    );
}
}