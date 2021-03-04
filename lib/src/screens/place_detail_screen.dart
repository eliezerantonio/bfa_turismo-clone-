import 'package:bfa_turismo/src/componets/point_custom.dart';
import 'package:bfa_turismo/src/componets/text_top_widget.dart';
import 'package:bfa_turismo/src/componets/triangle_custom.dart';
import 'package:bfa_turismo/src/models/place.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  PlaceDetailScreen({Key key, @required this.place});
  var place = Place();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          "images/logo.png",
          width: 100,
        ),
      ),
      body: Container(
        height: 180,
        width: double.infinity,
        padding: EdgeInsets.all(1),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      place.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  TriangleCustom(
                    edge: Edge.LEFT,
                    height: 300,
                    opacity: 0.3,
                    width: 2000,
                    alignmentGeometry: Alignment.topLeft,
                    colorNum: 100,
                  ),
                  PointCustom(
                    alignmentGeometry: Alignment.centerLeft,
                    height: 180,
                    numSize: 100,
                    width: 190,
                    opacity: 1.0,
                    edge: Edge.RIGHT,
                  ),
                  TriangleCustom(
                    edge: Edge.RIGHT,
                    height: 100,
                    opacity: 0.6,
                    width: 150,
                    alignmentGeometry: Alignment.centerLeft,
                    colorNum: 300,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextTopWidget(
                            color: Colors.grey[500],
                            fontSize: 14,
                            text: "BFA Turismo",
                          ),
                          Container(
                            width: 190,
                            child: TextTopWidget(
                              color: Colors.orange[800],
                              fontSize: 24,
                              text: place.title.toUpperCase(),
                            ),
                          ),
                          // SizedBox()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              color: Colors.orange[800],
            )
          ],
        ),
      ),
    );
  }
}
