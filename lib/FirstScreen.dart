import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_app/category_data.dart';
import 'package:online_shopping_app/details_page.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // int _selectedIndex = 0;
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  String category = "grocery";
  String indx = " ";
  String name = " ";

  List<Categories> categories = List();
  bool _fetching = true;

  void getHttp() async {
    setState(() {
      _fetching = true;
    });
    try {
      Response response = await Dio()
          .get("http://aparna.pythonanywhere.com/categories/?format=json");
      setState(() {
        categories = categoriesFromJson(jsonEncode(response.data));
        _fetching = false;
      });
    } catch (e) {
      setState(() {
        _fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hey Rakib",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Stack(
                    children: [
                      Container(
                        child: Icon(
                          Icons.notifications_rounded,
                          color: Colors.deepOrange,
                          size: 25,
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 3,
                        child: Container(
                          child: Icon(
                            Icons.circle,
                            color: Colors.yellow,
                            size: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "What do you like to find",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          //   prefix: Icon(Icons.search,color: Colors.black,),
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                      //  padding: EdgeInsets.only(right: 20),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          // color: Colors.grey[300],
                          gradient: LinearGradient(
                              colors: [Colors.redAccent, Colors.orangeAccent])),
                      child: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Categories",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                primary: false,
                itemCount: categories.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Categories todo = categories[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        category = todo.categoryName[index];
                      });
                    },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: category == todo.categoryName[index]
                            ? Color(0xFFF17E69)
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " ${todo.categoryName}",
                            style: TextStyle(
                                color: category == todo.categoryName[index]
                                    ? Colors.white
                                    : Colors.grey[700],
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                  // name: todo.name,
                  // image: todo.image,
                  // breed: todo.breed,
                  // distance: "${todo.distance}",
                  // age: "${todo.age}",
                  // sex: "${todo.sex}",
                  // description: todo.description,
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sell all",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Expanded(
              child: Container(
                //height: 150,
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(),
                      ),
                    );
                  },
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    itemCount: 10,
                    // itemCount: listTodos.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // PetsData todo = listTodos[index];
                      return TopOfTheWeek(



                      // name: todo.name,
                          // image: todo.image,
                          // breed: todo.breed,
                          // distance: "${todo.distance}",
                          // age: "${todo.age}",
                          // sex: "${todo.sex}",
                          // description: todo.description,
                          );
                    },

                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                  ),
                ),
              ),
            ),

            // Expanded(
            //   child: Container(
            //     color: Colors.white,
            //     child:
            //     categories == null ?
            //     Container(
            //       child: CircularProgressIndicator(),
            //     ):
            //     Container(
            //       padding: EdgeInsets.only(right: 23, left: 23),
            //       child: ListView.separated(
            //         itemCount: categories.length,
            //         primary: false,
            //         shrinkWrap: true,
            //         //itemCount: 50,
            //         //itemCount: listDoctors.length,
            //         itemBuilder: (context, index) {
            //
            //           Categories todo = categories[index];
            //           return InkWell(
            //             onTap: (){
            //               setState(() {
            //                 name = todo.productName;
            //               });
            //             },
            //             child: PopularItems(
            //               name:todo.productName,
            //               image: todo.imageUrl,
            //             price: todo.productPrice,
            //               nm: name,
            //             ),
            //           );
            //         },
            //         separatorBuilder: (context, index) {
            //           return SizedBox(
            //             height: 22,
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),

      //    bottomNavigationBar: Container(
      //      decoration: BoxDecoration(
      //        borderRadius: BorderRadius.only(
      //          topRight: Radius.circular(40),
      //          topLeft: Radius.circular(40),
      //          // bottomRight: Radius.circular(40),
      //          //  bottomLeft: Radius.circular(40),
      //        ),
      //        boxShadow: <BoxShadow>[
      //          BoxShadow(
      //              color: Colors.grey[300],
      //              blurRadius: 15.0,
      //              offset: Offset(0.0, 0.75)
      //          )
      //        ],
      //      ),
      //      child: ClipRRect(
      //  borderRadius: BorderRadius.only(
      //  topRight: Radius.circular(40),
      //  topLeft: Radius.circular(40),
      //   // bottomRight: Radius.circular(40),
      //   //  bottomLeft: Radius.circular(40),
      //  ),
      //        child:    SizedBox(
      //          height: 60,
      //          child: BottomNavigationBar(
      //      items: const <BottomNavigationBarItem>[
      //      BottomNavigationBarItem(
      //            icon: Icon(Icons.home),
      //      label: 'Home',
      //      //backgroundColor: Colors.red,
      //  ),
      //  BottomNavigationBarItem(
      //  icon: Icon(Icons.business),
      //
      //  label: "hai",
      //  //backgroundColor: Colors.green,
      //  ),
      //  BottomNavigationBarItem(
      //  icon: Icon(Icons.school),
      //  label: 'School',
      //  //backgroundColor: Colors.purple,
      //  ),
      //  BottomNavigationBarItem(
      //  icon: Icon(Icons.settings),
      //  label: 'Settings',
      // // backgroundColor: Colors.pink,
      //  ),
      //  ],
      //  currentIndex: _selectedIndex,
      //  selectedItemColor: Colors.amber[800],
      //  onTap: _onItemTapped,
      //  ),
      //        ),
      //  ),
      //    ),
    );
  }
}

class PopularItems extends StatefulWidget {
  const PopularItems({this.name, this.image, this.price, this.nm});

  final String name;
  final String image;
  final int price;
  final String nm;

  @override
  _PopularItemsState createState() => _PopularItemsState();
}

class _PopularItemsState extends State<PopularItems> {
  bool liked = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 160,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      // color: Colors.grey[300],
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
                      )),
                  //color: Colors.grey[300],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      child: IconButton(
                    icon: Icon(
                      liked ? Icons.favorite : Icons.favorite_border,
                      size: 25,
                      color: liked ? Color(0xFFF17E69) : Color(0xFFF17E69),
                    ),
                    onPressed: () => _pressed(),
                  )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department_outlined,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "33 Calories",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.orangeAccent[200]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${widget.price}",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
        // Row(
        //   children: [
        //     Text("Fruits",style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 12,
        //     ),)
        //   ],
        // ),
        );
  }
}

class TopOfTheWeek extends StatefulWidget {
  @override
  _TopOfTheWeekState createState() => _TopOfTheWeekState();
}

class _TopOfTheWeekState extends State<TopOfTheWeek> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      // width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          // Text("Fruits",style: TextStyle(
          //   color: Colors.black,
          //   fontSize: 12,
          // ),)
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fresh Orange",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "33 Calories",
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orangeAccent[200]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "4.60",
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
