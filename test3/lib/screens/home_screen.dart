import 'package:flutter/material.dart';
import 'package:test3/models/webtoon_model.dart';
import 'package:test3/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebToons() async {
    webtoons = await ApiService.getTodays();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waitForWebToons();
  }

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
      body: const Row(),
    );
  }
}
