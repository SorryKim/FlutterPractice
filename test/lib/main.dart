import 'package:flutter/material.dart';
import 'package:test/widgets/button.dart';
import 'package:test/widgets/MyCard.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 230, 141, 24),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Hello 재성!',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              Text(
                                'Welcome back!',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                          height: 120,
                          child: Text(
                            ' \$ 반갑습니다!!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 30,
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            text: '확인',
                            backgroundColor: Colors.lightBlue,
                            textColor: Colors.black,
                          ),
                          Button(
                            text: '아니오',
                            backgroundColor: Colors.lightGreenAccent,
                            textColor: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Wallets',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'View all',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const MyCard(
                        name: 'Euro',
                        code: 'EUR',
                        amount: '6 248',
                        icon: Icons.euro_outlined,
                        isInverted: false,
                      ),
                      Transform.translate(
                        offset: const Offset(0, -100),
                        child: const MyCard(
                          name: 'BitCoin',
                          code: 'BTC',
                          amount: '9 734',
                          icon: Icons.currency_bitcoin,
                          isInverted: true,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -200),
                        child: const MyCard(
                          name: 'Dollar',
                          code: 'USD',
                          amount: '426',
                          icon: Icons.attach_money_outlined,
                          isInverted: false,
                        ),
                      ),
                    ]),
              ),
            )));
  }
}
