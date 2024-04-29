import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Mycontest extends StatefulWidget {
  const Mycontest({super.key});

  @override
  State<Mycontest> createState() => _MycontestState();
}

class _MycontestState extends State<Mycontest> {
  List data = [
    ['DEL', 'MUM', '12h 43m', '3:30 PM'],
    ['KKR', 'LSG', 'Today', '7:30 PM'],
    ['RCB', 'CSK', 'Today', '3:30 PM'],
    ['PBKS', 'GT', 'Tomorrow', '3:30 PM'],
    ['RR', 'SRH', 'Tomorrow', '7:30 PM']
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      appBar: AppBar(
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 180, 10, 58),
        title: Row(children: [
          ClipOval(
            child: Lottie.asset('assets/animations/cricket.json', height: 40),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text('Envision 11'),
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_balance_wallet_rounded)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              'Upcoming Matches',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        log('Sayed');
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              const Text('Indian T20 League'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                            child: Icon(Icons.person)),
                                        const SizedBox(width: 10),
                                        Text(data[index][0])
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(data[index][2]),
                                      Text(data[index][3]),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(data[index][1]),
                                      const SizedBox(width: 10),
                                      const CircleAvatar(
                                          child: Icon(Icons.person)),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
