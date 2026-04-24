import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber.shade300,
            radius: 25,
            child: Image.asset('assets/images/avatar.jpg'),
          ),
          title:  Text('Hello I\'m',style: TextStyle(fontSize: 12,color: Colors.grey),),
          subtitle: const Text('Hussain Naqvi',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}