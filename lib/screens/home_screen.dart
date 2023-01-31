//import 'package:details/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dino_printing/screens/signin_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  Widget _UserDetails(
      {required Color color, required String image, required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menu({required String image, required String name, required GestureDetector button
      //required VoidCallback onCustomButtonPressed,
      //required ElevatedButton button
      }) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _Setting(
      {required Color color,
      required String title,
      required BoxBorder border,
      required TextStyle textStyle}) {
    return Container(
      height: 45,
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 20),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(7), border: border),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('Dino Printing',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            //selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
      body: Container(
          height: 700,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: ListView(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: SizedBox(
                  height: 150,
                  child: _UserDetails(
                      color: Theme.of(context).colorScheme.secondary,
                      image: 'assets/dino.png',
                      title: 'Hi There! Welcome'),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: const [
                    Text(
                      'Menu',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              GridView.count(
                  crossAxisCount: 2,
                  children: [
                    MyMenu(),
                    MyMenu(),
                    MyMenu(),
                    MyMenu(),
                  ],
                ),
        
              ElevatedButton(
                child: const Text("Logout"),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Text(
                        'APA LAGI NI',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _Setting(
                              title: 'Weekly',
                              color: Colors.white,
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              textStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          _Setting(
                              title: 'Daily',
                              color: Colors.white,
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              textStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          _Setting(
                              title: 'Month',
                              color: Colors.white,
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              textStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          _Setting(
                              title: 'Year',
                              color: Colors.white,
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              textStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class MyMenu extends StatelessWidget{
  const MyMenu({super.key});

  @override
  Widget build(BuildContext context) {
  return Card(
                      margin: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          
                        },
                        splashColor: Colors.pink,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(Icons.home, size: 70,),
                              Text('Home', style: new TextStyle(fontSize: 17),)
                            ],
                          )
                        )
                      ),
                    );
}
}
/*ElevatedButton.icon(
                icon: const Icon(Icons.reorder),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.firstScreen);
                },
                label: const Text('Order Form'),
              ),*/