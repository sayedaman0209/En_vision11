import 'package:envision11/Pages/api.dart';
import 'package:envision11/Pages/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:envision11/Pages/detailpage.dart';
import 'package:flutter/material.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  late Future<void> fetchRecipe;

  @override
  void initState() {
    fetchRecipe = cricketMatches();
    super.initState();
  }
  // const [data,setData]setSta
  // Future<void> fetchRecipes() async {
  //   const String url =
  //       'https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent';
  //   Map<String, String> headers = {
  //     'X-RapidAPI-Key': 'f4120967dcmsh79914ebbc314f67p177772jsnc978e7c0cdfc',
  //     'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
  //   };
  //   var data;
  //   var dataList;
  //   try {
  //     http.Response response = await http.get(Uri.parse(url), headers: headers);
  //     if (response.statusCode == 200) {
  //       data = json.decode(response.body);
  //       dataList = data.entries.toList();
  //       log(dataList.toString());
  //     } else {
  //       log('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     log('Error: $error');
  //   }
  // }

  // List data = [
  //   ['DEL', 'MUM', '12h 43m', '3:30 PM'],
  //   ['KKR', 'LSG', 'Today', '7:30 PM'],
  //   ['RCB', 'CSK', 'Today', '3:30 PM'],
  //   ['PBKS', 'GT', 'Tomorrow', '3:30 PM'],
  //   ['RR', 'SRH', 'Tomorrow', '7:30 PM']
  // ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.9),
        appBar: AppBar(
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.all(10),
            labelStyle: TextStyle(fontSize: 18),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [Text('Cricket'), Text('Trading')],
          ),
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

        // body:TabBarView(children: [
        //   Column(
        //     children: [
        //       const Padding(
        //         padding: EdgeInsets.only(top: 20, bottom: 10),
        //         child: Text(
        //           'Upcoming Matches',
        //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //       Expanded(
        //         child: FutureBuilder(
        //           future: fetchRecipe,
        //           builder: (context, snapshot) {
        //             if (snapshot.hasData) {
        //               //      return snapshot;
        //             }
        //             return CircularProgressIndicator();
        //           },
        //         ),
        // child: ListView.builder(
        //   physics: const AlwaysScrollableScrollPhysics(),
        //   itemCount: ,
        //   itemBuilder: (context, index) => Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.symmetric(
        //             horizontal: 10, vertical: 5),
        //         child: GestureDetector(
        //           onTap: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => Detail(
        //                     firstteamname: data[index][0],
        //                     secondteamname: data[index][1],
        //                     time: data[index][2],
        //                   ),
        //                 ));
        //           },
        //           child: Card(
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(vertical: 20),
        //               child: Column(
        //                 children: [
        //                   const Text('Indian T20 League'),
        //                   Row(
        //                     mainAxisAlignment:
        //                         MainAxisAlignment.spaceAround,
        //                     children: [
        //                       Padding(
        //                         padding: const EdgeInsets.symmetric(
        //                             vertical: 20),
        //                         child: Row(
        //                           children: [
        //                             const CircleAvatar(
        //                                 child: Icon(Icons.person)),
        //                             const SizedBox(width: 10),
        //                             Text(data[index][0])
        //                           ],
        //                         ),
        //                       ),
        //                       Column(
        //                         children: [
        //                           Text(data[index][2]),
        //                           Text(data[index][3]),
        //                         ],
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(data[index][1]),
        //                           const SizedBox(width: 10),
        //                           const CircleAvatar(
        //                               child: Icon(Icons.person)),
        //                         ],
        //                       )
        //                     ],
        //                   )
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
