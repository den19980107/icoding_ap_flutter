import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:icoding_ap/api/index.dart';
import 'package:icoding_ap/models/Class.dart';
import 'package:icoding_ap/pages/home/classList.dart';
import 'package:icoding_ap/widgets/drawer.dart';
import 'package:icoding_ap/widgets/text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Class>> _getAllClasses() async {
    var response = await ClassRoute().getAllClasses();
    var classes = response.data;
    print(classes.length);
    return classes;
  }

  @override
  Widget build(BuildContext context) {
    List<String> carouselPciture = [
      "assets/image/hahow圖片1.jpg",
      "assets/image/hahow圖片2.jpg",
      "assets/image/hahow圖片3.png",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('所有課程'),
      ),
      drawer: CustomDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: CarouselSlider(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                height: 200.0,
                items: carouselPciture.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TitleText("所有課程"),
            ClassList(_getAllClasses()),
          ],
        ),
      ),
    );
  }
}
