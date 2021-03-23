// import 'package:flutter/material.dart';
//
// class SecondScreen extends StatefulWidget {
//   @override
//   _SecondScreenState createState() => _SecondScreenState();
// }
//
// class _SecondScreenState extends State<SecondScreen> {
//
//   int _n = 0;
//
//   void add() {
//     setState(() {
//       _n++;
//     });
//   }
//
//   void minus() {
//     setState(() {
//       if (_n != 0)
//         _n--;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  new Container(
//       child: new Center(
//         child: new Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             new FloatingActionButton(
//               onPressed: add,
//               child: new Icon(Icons.add, color: Colors.black,),
//               backgroundColor: Colors.white,),
//
//             new Text('$_n',
//                 style: new TextStyle(fontSize: 60.0)),
//
//             new FloatingActionButton(
//               onPressed: minus,
//               child: new Icon(
//                   const IconData(0xe15b, fontFamily: 'MaterialIcons'),
//                   color: Colors.black),
//               backgroundColor: Colors.white,),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:online_shopping_app/FirstScreen.dart';
import 'package:online_shopping_app/cart_page.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _n = 0;

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (context) =>FirstScreen (),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.card_travel,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(height: 250, child: Image(image: AssetImage(""))),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Orange",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "4.60/kg",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.local_fire_department_outlined,
                              color: Colors.deepOrange,
                            ),
                            Text(
                              "33 Calories",
                              style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_outlined,
                              color: Colors.yellow,
                            ),
                            Text(
                              "4.9(2645 reviews)",
                              style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "4.9(2645 reviews)ldvgdibcgdvbxc gfiuvvvvvcb cxbhc 4.9(2645 reviews)ldvgdibcgdvbxc gfiuvvvvvcb cxbhc",
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: minus,
                                  child: Container(
                                    height: 22,
                                    width: 22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.redAccent,
                                    ),
                                    child: Icon(
                                      Icons.minimize,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('$_n kg',
                                    style: new TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black)),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: add,
                                  child: Container(
                                    height: 22,
                                    width: 22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.redAccent,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery time",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.lock_clock,size: 20,),
                                SizedBox(width: 5,),
                                Text(
                                  "20-30 min",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>MyCart (),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orangeAccent,
                          boxShadow: [BoxShadow(
                            offset: Offset(0,7),

                            blurRadius: 1,
                            color: Colors.orangeAccent,
                          )]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.card_travel,
                              color: Colors.deepOrange,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
