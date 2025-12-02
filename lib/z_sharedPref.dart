import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZSharedpref extends StatefulWidget {
  const ZSharedpref({super.key});

  @override
  State<ZSharedpref> createState() => _ZSharedprefState();
}

class _ZSharedprefState extends State<ZSharedpref> {
  String name = '';

  @override
  void initState() {
    super.initState();
    loadData(); // jab screen load ho to data fetch karo
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      name = sp.getString('name') ?? 'No Name';
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Center(child: Text('My name is $name')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences sp = await SharedPreferences.getInstance();
          await sp.setString('name', 'ahmad');
          await sp.setInt('age', 21);
          loadData(); // ab save ke baad dobara load kar lo
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
