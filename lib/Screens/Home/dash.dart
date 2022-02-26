import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.03),
          Column(
            children: [
              Container(
                  height: height * 0.3,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Colors.grey[800],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.005,
                      ),
                      const Text("Questions",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Image.network(
                          "https://www.pngall.com/wp-content/uploads/2/Question-Mark-PNG-Picture.png",
                          scale: 2.4)
                    ],
                  )),
              SizedBox(height: height * 0.03),
              Container(
                  height: height * 0.3,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Colors.grey[800],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.005,
                      ),
                      const Text("Resources",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Image.network(
                          "https://www.vhv.rs/dpng/d/0-9282_cartoon-stack-of-books-png-transparent-png.png",
                          scale: 2.4)
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
