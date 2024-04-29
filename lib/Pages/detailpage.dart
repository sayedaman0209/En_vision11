import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Detail extends StatefulWidget {
  const Detail(
      {super.key,
      required this.firstteamname,
      required this.secondteamname,
      required this.time});
  final String firstteamname;
  final String secondteamname;
  final String time;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List rupee = [
    ["100", "50"],
    ["50", "25"],
    ["44", "20"],
    ["60", "30"],
    ["30", "15"]
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 180, 70, 58),
            automaticallyImplyLeading: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.firstteamname} VS ${widget.secondteamname}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  widget.time,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {},
                    child: const Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet_rounded,
                              size: 18,
                              color: Colors.black,
                            ),
                            Text('  ₹10')
                          ],
                        ),
                      ),
                    ),
                  )),
            ]),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "7:4 Player",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(20),
                      // color: Color.fromARGB(255, 112, 4, 4),
                    ),
                    height: 40,
                    width: 400,
                    child: const Center(child: Text('Create Private Contest')),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Mini Grand League',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 8, left: 8, top: 20, bottom: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Prize Pool',
                            ),
                            Text(
                              'Entry',
                            ),
                          ],
                        ),
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '₹7 Lakhs',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Card(
                                color: Color.fromARGB(255, 183, 100, 79),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  child: Text(
                                    '₹7',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ]),
                        const Text('200000 Spots'),
                        Card(
                          color: Colors.brown[100],
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [Text('Single'), Text('Guaranteed')],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Low Entry Contest',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: rupee.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 2,
                              top: 20,
                              left: 8,
                              right: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Prize Pool',
                                    ),
                                    Text(
                                      'Entry',
                                    ),
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        //
                                        '₹${rupee[index][0]}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Card(
                                        color: const Color.fromARGB(
                                            255, 183, 100, 79),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Text(
                                            '₹${rupee[index][1]}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]),
                                const Text('3 Spots'),
                                Card(
                                  color: Colors.brown[100],
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Single'),
                                        Text('Guaranteed')
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(ZondIcons.trophy), label: 'My Contest'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.groups_sharp), label: 'My Team'),
            ]),
      ),
    );
  }
}
