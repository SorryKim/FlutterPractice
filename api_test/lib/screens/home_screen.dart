import 'package:flutter/material.dart';
import '../models/route.dart';
import '../services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<RouteModel>> routes = ApiService.getRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 65,
        centerTitle: true,
        title: const Text(
          '등산로!!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.white,
        elevation: 5,
      ),
      body: FutureBuilder(
          future: routes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 65,
                  ),
                  Expanded(child: makeList(snapshot)),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  ListView makeList(AsyncSnapshot<List<RouteModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var route = snapshot.data![index];
        return Text('구간거리: ${route.sec_len} 상행속도: ${route.up_min} ');
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 50,
      ),
    );
  }
}
