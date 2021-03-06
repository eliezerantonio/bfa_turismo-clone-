import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Row(
        children: [
          IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              }),
          Spacer(),
          IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {}),
          Stack(
            children: [
              IconButton(
                  icon: Icon(FontAwesomeIcons.shoppingBag), onPressed: () {}),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.ellipsisV, size: 15),
            onPressed: () {},
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image:
                      DecorationImage(image: AssetImage("assets/user.jpeg"))),
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}
