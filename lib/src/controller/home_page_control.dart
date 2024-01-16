// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:get/get.dart';
import '../model/coin_model.dart';
import 'package:http/http.dart' as http;

class HomePageControl extends GetxController {
  List<Coin> coin = [];

  @override
  void onInit() {
    super.onInit();
    fatsedata();
  }

  fatsedata() async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en"));
      (json.decode(response.body)).forEach((element) {
        coin.add(Coin.fromJson(element));
      });
      update();
    } catch (e) {}
  }
}
