import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App Prototype',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Open Sans',
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<CategoryIcon> menuDatas = [
    CategoryIcon(label: '전체', icon: Icons.lunch_dining_sharp),
    CategoryIcon(label: '할인가게', icon: Icons.lunch_dining_sharp),
    CategoryIcon(label: '치킨', icon: Icons.lunch_dining_sharp),
    CategoryIcon(label: '피자', icon: Icons.lunch_dining_sharp),
    CategoryIcon(label: '디저트', icon: Icons.lunch_dining_sharp),
    CategoryIcon(label: '분식', icon: Icons.lunch_dining_sharp),
    CategoryIcon(label: '한식', icon: Icons.lunch_dining_sharp),
    CategoryIcon(label: '중식', icon: Icons.lunch_dining_sharp),
    CategoryIcon(label: '일식', icon: Icons.lunch_dining_sharp),
    CategoryIcon(label: '햄버거', icon: Icons.lunch_dining_sharp),
  ];

  final List<Map<String, dynamic>> itemDatas = [
    {'title': '자담치킨', 'prize': 10000},
    {'title': '하림치킨', 'prize': 10000},
    {'title': '굽네치킨', 'prize': 10000},
    {'title': '통천치킨', 'prize': 10000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHOPPING'),
        actions: [
          // Add icons or buttons here
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.grey[300],
                width: double.infinity,
                height: 200,
                // Add your main image or placeholder here
              ),
              SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                crossAxisCount: 5,
                childAspectRatio: (1 / 1.1),
                children: menuDatas,
              ),
              Container(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemDatas.length,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 16,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(
                      title: itemDatas[index]['title'],
                      price: itemDatas[index]['prize'],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final double boxSize = 70;

  const CategoryIcon({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: boxSize,
          height: boxSize,
          child: Icon(
            icon,
            size: boxSize - 5,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final int price;
  final double boxSize = 180;

  const ProductItem({Key? key, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxSize,
      height: boxSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.grey[300],
            width: boxSize,
            height: boxSize,
            // Add your product image or placeholder here
          ),
          SizedBox(
            width: boxSize - 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 3),
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                Text(price.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
