import 'package:flutter/material.dart';
import 'package:pushnotification/list.dart';

class DuyuruDetay extends StatelessWidget {
  final Announcement duyuru;

  DuyuruDetay({required this.duyuru});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duyuru Detayı'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                '${duyuru.title}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text(
                '${duyuru.body}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 60),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(),
                      body: Center(
                        child: Image.network('${duyuru.image}'),
                      ),
                    ),
                  ));
                },
                child: Hero(
                  tag: duyuru.image,
                  child: Image.network(duyuru.image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}