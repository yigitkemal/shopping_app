import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/ProductListTab.dart';
import 'package:shopping_app/searchTab.dart';

import 'ShoppingCartTab.dart';
import 'model/app_state_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel()..loadProducts(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Products"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart), label: "Cart"),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            switch (index) {
              case 0:
                returnValue = CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                    child: ProductListTab(),
                  );
                });
                break;
              case 1:
                returnValue = CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                    child: SearchTab(),
                  );
                });
                break;
              case 2:
                returnValue = CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                    child: ShoppingCartTab(),
                  );
                });
                break;
            }
        }
        return returnValue;
      },
    );
  }
}
