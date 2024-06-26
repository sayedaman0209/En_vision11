import 'package:envision11/Pages/homeNav.dart';
import 'package:envision11/Pages/more.dart';
import 'package:envision11/Pages/mycontest.dart';
import 'package:envision11/Pages/profile.dart';

import 'package:flutter/material.dart';

import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  static const List<Widget> _pages = <Widget>[
    HomeNav(),
    Mycontest(),
    Profile(),
    More(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: _pages.elementAt(index),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black87,
          showUnselectedLabels: true,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(ZondIcons.trophy), label: 'My Contest'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'My Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps_outlined), label: 'More'),
          ]),
    ));
  }
}
 





// DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           backgroundColor: Colors.white.withOpacity(.9),
//           appBar: AppBar(
//             foregroundColor: Colors.white,
//             bottom: const TabBar(
//               indicatorColor: Colors.white,
//               indicatorWeight: 5,
//               indicatorSize: TabBarIndicatorSize.tab,
//               labelPadding: EdgeInsets.all(10),
//               labelStyle: TextStyle(fontSize: 18),
//               labelColor: Colors.white,
//               unselectedLabelColor: Colors.white,
//               tabs: [Text('Cricket'), Text('Trading')],
//             ),
//             automaticallyImplyLeading: false,
//             backgroundColor: const Color.fromARGB(255, 180, 10, 58),
//             title: Row(children: [
//               ClipOval(
//                 child:
//                     Lottie.asset('assets/animations/cricket.json', height: 40),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               const Text('Envision 11'),
//             ]),
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: CircleAvatar(
//                   child: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.account_balance_wallet_rounded)),
//                 ),
//               ),
//             ],
//           ),
//           body: TabBarView(children: [
//             Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(top: 20, bottom: 10),
//                   child: Text(
//                     'Upcoming Matches',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     itemCount: data.length,
//                     itemBuilder: (context, index) => Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 5),
//                           child: GestureDetector(
//                             onTap: () {
//                               log('Sayed');
//                             },
//                             child: Card(
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 20),
//                                 child: Column(
//                                   children: [
//                                     const Text('Indian T20 League'),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 20),
//                                           child: Row(
//                                             children: [
//                                               const CircleAvatar(
//                                                   child: Icon(Icons.person)),
//                                               const SizedBox(width: 10),
//                                               Text(data[index][0])
//                                             ],
//                                           ),
//                                         ),
//                                         Column(
//                                           children: [
//                                             Text(data[index][2]),
//                                             Text(data[index][3]),
//                                           ],
//                                         ),
//                                         Row(
//                                           children: [
//                                             Text(data[index][1]),
//                                             const SizedBox(width: 10),
//                                             const CircleAvatar(
//                                                 child: Icon(Icons.person)),
//                                           ],
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const Center(
//               child: Text('Data'),
//             )
//           ]),
//           bottomNavigationBar: BottomNavigationBar( currentIndex:index,
//               selectedItemColor: Colors.black,
//               unselectedItemColor: Colors.black87,
//               showUnselectedLabels: true,
//               onTap: (value) { 
//                 setState(() {
//                   index=value;
//                 });
//               },
//               items: const [
//                 BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//                 BottomNavigationBarItem(
//                     icon: Icon(ZondIcons.trophy), label: 'My Contest'),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.person), label: 'My Profile'),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.apps_outlined), label: 'More'),
//               ]),
//         ),
//       ),