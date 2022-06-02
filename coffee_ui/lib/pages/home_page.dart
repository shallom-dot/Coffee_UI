import 'package:coffee_ui/utilities/coffee_tile.dart';
import 'package:coffee_ui/utilities/coffee_type.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Espresso',
      false,
    ],
    [
      'Barista',
      false,
    ],
    [
      'Caffeine',
      false,
    ],
    [
      'Prabhat',
      false,
    ]
  ];
  void coffeeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user), label: 'Account'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Find the best coffee for you',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.orange,
                    hintText: 'Find your coffee....',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700))),
              ),
            ),

            const SizedBox(
              height: 25.0,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 50,
              child: ListView.builder(
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          coffeeSelected(index);
                        });
                  }),
            ),
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(
                  coffeeImagePath: 'assets/images/img1.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '4.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/img2.jpg',
                  coffeeName: 'Espereso',
                  coffeePrice: '3.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/img3.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '5.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/img4.jpg',
                  coffeeName: 'Caffeien',
                  coffeePrice: '4.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/img44.jpg',
                  coffeeName: 'Prabhat',
                  coffeePrice: '3.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/img1.jpg',
                  coffeeName: 'Milqqy',
                  coffeePrice: '3.60',
                ),
              ],
            ))
          ],
        ));
  }
}
