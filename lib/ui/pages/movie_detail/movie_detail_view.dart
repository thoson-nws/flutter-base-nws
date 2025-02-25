import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'movie_detail_logic.dart';
import 'movie_detail_state.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final MovieDetailLogic logic = Get.put(MovieDetailLogic());
  final MovieDetailState state = Get.find<MovieDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          tem1(),
          tem2(),
          Text("${state.temp2.value}"),
          TextButton(
            onPressed: () {
              state.temp1.value += 1;
            },
            child: const Text("aaaa"),
          ),
          TextButton(
            onPressed: () {
              state.temp2.value += 1;
            },
            child: const Text("bbbb"),
          ),
        ],
      ),
    );
  }

  Widget tem1() {
    return Obx(() {
      return Text("${state.temp1.value}");
    });
  }

  Widget tem2() {
    return Obx(() {
      return Text("${state.temp2.value}");
    });
  }

  @override
  void dispose() {
    Get.delete<MovieDetailLogic>();
    super.dispose();
  }
}
