import 'package:flutter/material.dart';
import 'package:test3/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  onButtonTap() async {
    final url = Uri.parse(
        'https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}');
    launchUrl(url);
  }

  final String webtoonId;
  final WebtoonEpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
            color: Colors.amber[300], borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 25,
          ),
          child: Row(children: [
            Text(
              episode.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const Icon(Icons.chevron_right_rounded)
          ]),
        ),
      ),
    );
  }
}
