import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_page_control.dart';
import '../widgets/coin_box.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomePageControl controller =
      Get.put<HomePageControl>(HomePageControl());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("Cryptocurrency")),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<HomePageControl>(
          builder: (_) {
            return RefreshIndicator(
              onRefresh: () async {
                controller.fatsedata();
              },
              child: ListView.separated(
                itemCount: controller.coin.length,
                itemBuilder: (BuildContext context, int index) {
                  return CoinBox(
                    width: width,
                    height: height,
                    img: controller.coin[index].image,
                    price: controller.coin[index].currentPrice.toString(),
                    name: controller.coin[index].name,
                    priceChangePercentage24h:
                        controller.coin[index].priceChangePercentage24H,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
