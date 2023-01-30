import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_elred/common_widgets/task_widget.dart';
import 'package:todo_app_elred/pages/home/home_page_components/custom_app_bar.dart';
import 'package:todo_app_elred/pages/home/home_page_components/home_page_components.dart';
import 'package:todo_app_elred/pages/home/home_page_components/new_todo_page.dart';
import 'package:todo_app_elred/pages/home/home_page_view_model/todo_view_model.dart';
import 'package:todo_app_elred/services/global.dart';
import 'package:todo_app_elred/styles/fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodoViewModel(),
        builder: (context, child) => HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'ADD',
        child: const Icon(
          Icons.add,
          size: 25,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewTodoPage(),
              ));
        },
      ),
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      drawer: DrawerPage(),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          CustomAppBar(scaffoldKey: _scaffoldKey),

          ValueListenableBuilder(
            valueListenable: Global.boxes[BOXNAME.TODO_BOX]!.listenable(),
            builder: (context, value, child) => value.values.isEmpty
                ? SliverList(
                    delegate: SliverChildListDelegate.fixed([
                    Center(
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 90),
                            child: Text(
                              'There are No Todos',
                              style: AppFonts.profiletext
                                  .copyWith(color: Colors.black),
                            )))
                  ]))
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => FutureBuilder(
                        future: TodoViewModel.getTodosData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting &&
                              snapshot.connectionState ==
                                  ConnectionState.none) {
                            return const Center(
                              child: CupertinoActivityIndicator(radius: 10),
                            );
                          }
                          if (!snapshot.hasData) {
                            return const Center(
                              child: Text('There are No Todos'),
                            );
                          }

                          if (snapshot.hasData) {
                            //print(snapshot.data?.length);

                            return TaskWidget(
                              snapshot: snapshot,
                              index: index,
                            );
                          }
                          return const CupertinoActivityIndicator();
                        },
                      ), //ListTile
                      childCount: value.length,
                    ), //SliverChildBuildDelegate
                  ),
          ) //SliverList
        ], //<Widget>[]
      ),
      drawerEnableOpenDragGesture: false, //CustonScrollVie,
    );
  }
}
