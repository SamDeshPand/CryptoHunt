import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

final list=<String>["bitcoin","ethereum","litecoin"];

class Coins{

   String? name;
   String? price;
   String? image;
  Coins(name,price,image){
    this.name=name;
    this.price=price;
    this.image=image;
  }
}

class Getcrypto {
      final Base="https://api.coingecko.com/api/v3/coins/";
      Future<List<Coins>> getlist() async{
            final coinlist=<Coins>[];
            for(int i=0;i<list.length;i++)
            {
              String url=list.elementAt(i);
              dynamic resp=await http.get(Uri.parse("$Base/$url"));
              Map<String, dynamic> responseData = json.decode(resp.body);
              coinlist.add(Coins(responseData['name'],responseData['market_data']['current_price']['usd'].toString(),responseData['image']['thumb']));
            }
            return coinlist;
      }
       
      
}


