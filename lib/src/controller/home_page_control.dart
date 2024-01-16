// ignore_for_file: empty_catches

import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import '../model/coin_model.dart';
import 'package:http/http.dart' as http;

class HomePageControl extends GetxController {
  List<Coin> coin = [];
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    fatsedata();
    timer = Timer.periodic(const Duration(seconds: 15), (Timer t) => fatsedata());
  }

  fatsedata() async {
    try {
      if (coin.isNotEmpty) {
        coin.clear();
      }
      var response = await http.get(Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en"));
      (json.decode(response.body)).forEach((element) {
        coin.add(Coin.fromJson(element));
      });
      update();
    } catch (e) {
    }
  }
}
