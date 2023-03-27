import 'package:flutter/material.dart';
import 'package:test3/models/webtoon_model.dart';
import 'package:test3/widgets/webtoon_widget.dart';
import 'package:test3/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodays();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 65,
        centerTitle: true,
        title: const Text(
          '오늘의 웹툰!',
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
          future: webtoons,
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

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 50,
      ),
    );
  }
}
