import 'package:belajar/pages/data_table.dart';
import 'package:flutter/material.dart';
import 'package:belajar/utilities/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainMonitoring(
        title: 'Navigation Drawer with submenu - Flutter',
      ),
    );
  }
}

class MainMonitoring extends StatefulWidget {
  const MainMonitoring({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainMonitoring> createState() => _MainMonitoringState();
}

class _MainMonitoringState extends State<MainMonitoring> {
  List<Menu> data = [];

  @override
  void initState() {
    for (var element in dataList) {
      data.add(Menu.fromJson(element));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: _buildDrawer(),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            Spacer(),
            ElevatedCardExample(),
            SizedBox(height : 10),
            FilledCardExample(),
            SizedBox(height : 10),
            OutlinedCardExample(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 0),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildDrawerHeader(data[index]);
        }
        return _buildMenuList(data[index]);
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(
            height: 1,
            thickness: 2,
          ),
    );
  }

  Widget _buildDrawerHeader(Menu headItem) {
    return DrawerHeader(
        margin: const EdgeInsets.only(bottom: 0),
        decoration: const BoxDecoration(
          color: Colors.indigo,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              headItem.icon,
              color: Colors.white,
              size: 60,
            ),
            const Spacer(),
            Text(
              headItem.title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ));
  }

  Widget _buildMenuList(Menu menuItem) {
    //build the expansion tile
    double lp = 0; //left padding
    double fontSize = 20;
    if (menuItem.level == 1) {
      lp = 20;
      fontSize = 16;
    }
    if (menuItem.level == 2) {
      lp = 30;
      fontSize = 14;
    }

    if (menuItem.children.isEmpty) {
      return Builder(builder: (context) {
        return InkWell(
          child: Padding(
            padding: EdgeInsets.only(left: lp),
            child: ListTile(
              leading: Icon(menuItem.icon),
              title: Text(
                menuItem.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          onTap: () {
            // Close the drawer
            Navigator.pop(context);

            //Then direct user to dashboard page
            Navigator.push(
              context,
                    MaterialPageRoute(
                      builder: (context) => EditablePage(),
                    ),
                  );


                },
              );
          }
      );
    }


    return  Padding(
      padding: EdgeInsets.only(left: lp),
      child: ExpansionTile(
        leading: Icon(menuItem.icon),
        title: Text(
          menuItem.title,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
        children: menuItem.children.map(_buildMenuList).toList(),
      ),
    );

  }
}


//The Menu Model
class Menu {
  int level =0;
  IconData icon = Icons.drive_file_rename_outline;
  String title ="";
  List<Menu> children = [];
  //default constructor
  Menu(this.level, this.icon, this.title, this.children);

  //one method for  Json data
  Menu.fromJson(Map<String, dynamic> json) {
    //level
    if(json["level"] != null){level = json["level"];}
    //icon
    if(json["icon"] != null){icon = json["icon"];}
    //title
    title = json['title'];
    //children
    if (json['children'] != null) {
      children.clear();
      //for each entry from json children add to the Node children
      json['children'].forEach((v) {
        children.add(Menu.fromJson(v));
      });
    }
  }
}


//menu data list
List dataList = [
  //menu data item
  {
    "level": 0,
    "icon": Icons.account_circle_rounded,
    "title": "Validator",
  },

  //menu data item
    {
    "level": 0,
    // "icon": Icons.payments,
    "title": "Account",
    "children": [
      {
        "level":1,
        // "icon": Icons.paypal,
        "title": "Ubah Username Dan Password",
      },
    ]
  },


  //menu data item
  {
    "level": 0,
    // "icon": Icons.payme,
    "title": "Data Master",
    "children": [
      {
        "level":1,
        // "icon": Icons.paypal,
        "title": "Pemantauan Gabah",
      },
      { "level":1,
        // "icon": Icons.credit_card,
        "title": "Data Gabah"
      }
    ]
  },




];


class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.pastelNavy,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          width: 300,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pelanggan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '1',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FilledCardExample extends StatelessWidget {
  const FilledCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.pastelNavy,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          width: 300,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gabah Kering(kg)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '20',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlinedCardExample extends StatelessWidget {
  const OutlinedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.pastelNavy,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          width: 300,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

          ),
        ),
      ),
    );
  }
}