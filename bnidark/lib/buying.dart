import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product {
  final image;
  final name;
  final price;

  Product(this.image, this.name, this.price);
}

class Buying extends StatelessWidget {
  List products = [
    Product('assets/CC.jpg', 'Camera canon', 2000),
    Product('assets/CC.jpg', 'Camera canon', 2000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f7f9),
      appBar: AppBar(
        title: Text('Buyings'.tr),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                'Featured item',
                'Most recent',
                'Item 1',
                'Item 2',
                'Item 3',
                'Etc...'
              ]
                  .map((e) => Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        child: OutlineButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(e),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Column(
              children: products
                  .map(
                    (e) => Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.orange,
                              blurRadius: 10,
                              spreadRadius: 3,
                              offset: Offset(3, 4))
                        ],
                      ),
                      child: ListTile(
                        leading: Image.network(
                          e.image,
                          fit: BoxFit.cover,
                          width: 90,
                          height: 100,
                        ),
                        title: Text(
                          e.name,
                          style: TextStyle(fontSize: 25),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("\$ " + e.price.toString()),
                            SizedBox(height: 10),
                            Container(
                              height: 40,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      left: 20,
                                      bottom: 0,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.green,
                                          child: Image.network(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRxHTyqjCdnZsEM-EkMvn3FDBkDADcaEZ3GN1YEdWFToAJm83nX&usqp=CAU'))),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: CircleAvatar(child: Text('a'.tr)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList())
        ],
      ),
    );
  }
}
