import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talento/one.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
      debugShowCheckedModeBanner: false,
      routes: {"one": (context) => One(), "home": (context) => Test()},
    );
  }
}

class Test extends StatefulWidget {
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends State<Test> with SingleTickerProviderStateMixin {
  String? game;
  String? email;
  TabController? mycontroller;
  ScrollController? fc;
  PageController? pc;
  TextEditingController ic = new TextEditingController();
  GlobalKey<ScaffoldState> opendrawer = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> ft = new GlobalKey<FormState>();
  RegExp re = new RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  int s1 = 0;

  void initState() {
    mycontroller = new TabController(length: 4, vsync: this);
    pc = new PageController(initialPage: 0);
    fc = new ScrollController();
    super.initState();
  }

  List drinks = [
    {
      "name": "3 in 1",
      "price": 2500,
      "select": false,
      "icon": Icon(
        Icons.local_cafe_rounded,
        color: Colors.brown[700],
        size: 40,
      )
    },
    {
      "name": "cofee",
      "price": 1500,
      "select": false,
      "icon": Icon(
        Icons.local_cafe_rounded,
        color: Colors.brown[700],
        size: 40,
      )
    },
    {
      "name": "kamon+lemon",
      "price": 1500,
      "select": false,
      "icon": Icon(
        Icons.emoji_food_beverage,
        color: Colors.green[700],
        size: 40,
      )
    },
    {
      "name": "Hot Chocolate",
      "price": 2500,
      "select": false,
      "icon": Icon(
        Icons.local_cafe_rounded,
        color: Colors.brown[700],
        size: 40,
      ),
    },
    {
      "name": "Tea",
      "price": 1500,
      "select": false,
      "icon": Icon(
        Icons.emoji_food_beverage,
        color: Colors.green[700],
        size: 40,
      )
    },
    {
      "name": "mate",
      "price": 8000,
      "select": false,
      "icon": Icon(
        Icons.format_color_fill,
        color: Colors.green[700],
        size: 40,
      )
    },
    {
      "name": "checha",
      "price": 8000,
      "select": false,
      "icon": Icon(
        Icons.smoking_rooms,
        color: Colors.black,
        size: 40,
      )
    }
  ];
  List games = [
    {
      "name": "شطرنج",
      "price": "1000SP",
      "select": "c",
      "image": Image.asset(
        "images/c.jpg",
        fit: BoxFit.fill,
      )
    },
    {
      "name": "جاكارو",
      "price": "1000SP",
      "select": "j",
      "image": Image.asset(
        "images/j.jpg",
      )
    },
    {
      "name": "طاولة",
      "price": "1000SP",
      "select": "t",
      "image": Image.asset("images/t.jpg")
    }
  ];
  List foods = [
    {
      "name": "مسبحة",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/مسبحة.jpg")
    },
    {
      "name": "متبل",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/متبل.jpg")
    },
    {
      "name": "لبن",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/l.jpeg")
    },
    {
      "name": "لبن متوّم",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/لبن متوم.jpg")
    },
    {
      "name": "محمرة",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/محمرة.jpg")
    },
    {
      "name": "زيتون اسود",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/زيتون اسود.jpg")
    },
    {
      "name": "زيتون اخضر",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/زيتون اخضر.jpg")
    },
    {
      "name": "شنكليش",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/شنكليش.webp")
    },
    {
      "name": "مرتديلا",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/مرتديلا.jpg")
    },
    {
      "name": "مشللة",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/مشللة.png")
    },
    {
      "name": "فطر",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/فطر.jpg")
    },
    {
      "name": "ذرة",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/ذرة.webp")
    },
    {
      "name": "مخلل",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/مخلل.jpeg")
    },
    {
      "name": "بزورات",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/بزورات.jpg")
    },
    {
      "name": "مسقعة",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/مسقعة.jpg")
    },
    {
      "name": "بطاطا مقليّة",
      "price": 2500,
      "select": false,
      "image": Image.asset("images/food/بطاطا.webp")
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: opendrawer,
      appBar: AppBar(
        title: Text(
          "Bit Joddy",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              opendrawer.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: Icon(Icons.search_rounded)),
          IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: Icon(Icons.exit_to_app)),
        ],
        leadingWidth: 30,
        toolbarHeight: 60,
        bottom: TabBar(
          controller: mycontroller,
          labelColor: Colors.white,
          indicatorColor: Colors.black,
          indicatorWeight: 4,
          isScrollable: true,
          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          tabs: [
            Tab(
                icon: Icon(
                  Icons.local_drink_sharp,
                  color: Colors.black,
                ),
                child: Text("drinks")),
            Tab(
                icon: Icon(
                  Icons.restaurant,
                  color: Colors.black,
                ),
                child: Text("food")),
            Tab(
                icon: Icon(
                  Icons.gamepad_outlined,
                  color: Colors.black,
                ),
                child: Text("games")),
            Tab(
                icon: Icon(
                  Icons.input,
                  color: Colors.black,
                ),
                child: Text("input"))
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Alaa Nakhla",
              style: TextStyle(fontSize: 25),
            ),
            accountEmail: Text("alaa.nakhla916@gmail.com",
                style: TextStyle(fontSize: 20)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/alaa.jpg"),
            ),
            currentAccountPictureSize: Size.square(70),
          ),
          ListTile(
              title: Text("Home Page", style: TextStyle(fontSize: 20)),
              leading: Icon(
                Icons.home,
                color: Colors.green[700],
              )),
          ListTile(
              title: Text("Help", style: TextStyle(fontSize: 20)),
              leading: Icon(
                Icons.help,
                color: Colors.green[700],
              )),
          ListTile(
              title: Text("About", style: TextStyle(fontSize: 20)),
              leading: Icon(
                Icons.help_center,
                color: Colors.green[700],
              )),
          ListTile(
              title: Text("Logout", style: TextStyle(fontSize: 20)),
              leading: Icon(
                Icons.logout,
                color: Colors.green[700],
              ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fc!.animateTo(0.0,
              duration: Duration(seconds: 1), curve: Curves.easeIn);
        },
        child: Icon(Icons.arrow_upward_rounded),
      ),
      body: TabBarView(controller: mycontroller, children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(10),
          child: ListView.separated(
              controller: fc,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, j) {
                return Divider(color: Colors.blue, thickness: 2, height: 2);
              },
              itemCount: drinks.length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                    value: drinks[i]["select"] == false ? false : true,
                    title: Text(
                      "${drinks[i]["name"]}",
                      style: TextStyle(fontSize: 25),
                    ),
                    subtitle: Text(
                      "${drinks[i]["price"]}",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    secondary: drinks[i]["icon"],
                    onChanged: (val) {
                      setState(() {
                        drinks[i]["select"] = val!;
                      });
                    });
              }),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(10),
          child: ListView.separated(
              controller: fc,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, j) {
                return Divider(color: Colors.blue, thickness: 2, height: 2);
              },
              itemCount: foods.length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                    value: foods[i]["select"] == false ? false : true,
                    title: Text(
                      "${foods[i]["name"]}",
                      style: TextStyle(fontSize: 25),
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                      "${foods[i]["price"]}",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    secondary: foods[i]["image"],
                    onChanged: (val) {
                      setState(() {
                        foods[i]["select"] = val!;
                      });
                    });
              }),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(20),
          child: ListView.separated(
              controller: fc,
              separatorBuilder: (context, l) {
                return Divider(color: Colors.blue, thickness: 2, height: 2);
              },
              shrinkWrap: true,
              itemCount: games.length,
              itemBuilder: (context, i) {
                return RadioListTile(
                  value: games[i]["select"] as String,
                  groupValue: game,
                  onChanged: (val) {
                    setState(() {
                      game = val as String;
                    });
                  },
                  title: Text(
                    "${games[i]["name"]}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text("${games[i]["price"]}",
                      style: TextStyle(fontSize: 15, color: Colors.red),
                      textDirection: TextDirection.rtl),
                  secondary: games[i]["image"],
                  controlAffinity: ListTileControlAffinity.trailing,
                );
              }),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Form(
                key: ft,
                child: TextFormField(
                  onSaved: (val) {
                    email = val;
                    print(" on $val");
                  },
                  decoration: InputDecoration(hintText: "Enter you Email"),
                  validator: (text) {
                    if (re.hasMatch(text.toString())) {
                      return null;
                    } else
                      return "this Email not valid";
                  },
                  textInputAction: TextInputAction.send,
                  controller: ic,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    var fort = ft.currentState;
                    if (fort!.validate()) {
                      fort.save();
                      print("Email: $email");
                      Navigator.of(context).pushNamed("one");
                    } else {
                      print("NO");
                    }
                  },
                  child: Text("OK"))
            ],
          ),
        ),
      ]),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("$query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    TestState ts = new TestState();
    List fillter = [];
    for (int i = 0; i < ts.foods.length; i++) {
      ts.foods[i]["name"].toString().startsWith(query)
          ? fillter.add(ts.foods[i])
          : null;
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(10),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, j) {
            return Divider(color: Colors.blue, thickness: 2, height: 2);
          },
          itemCount: query == "" ? ts.foods.length : fillter.length,
          itemBuilder: (context, i) {
            return query == ""
                ? CheckboxListTile(
                    value: ts.foods[i]["select"] == false ? false : true,
                    title: Text(
                      "${ts.foods[i]["name"]}",
                      style: TextStyle(fontSize: 25),
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                      "${ts.foods[i]["price"]}",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    secondary: ts.foods[i]["image"],
                    onChanged: (val) {
                      ts.foods[i]["select"] = val!;
                    })
                : CheckboxListTile(
                    value: fillter[i]["select"] == false ? false : true,
                    title: Text(
                      "${fillter[i]["name"]}",
                      style: TextStyle(fontSize: 25),
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                      "${fillter[i]["price"]}",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    secondary: fillter[i]["image"],
                    onChanged: (val) {
                      fillter[i]["select"] = val!;
                    });
          }),
    );
  }
}
