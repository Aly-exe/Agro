import 'package:agro/Bloc/bloc.dart';
import 'package:agro/Bloc/states.dart';
import 'package:agro/Bloc/userStates.dart';
import 'package:agro/Bloc/userbloc.dart';
import 'package:agro/addfeedback.dart';
import 'package:agro/func.dart';
import 'package:agro/markethomepage.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/home.dart';
import 'package:agro/login.dart';
import 'package:agro/news.dart';
import 'package:agro/reusablecomponent/widgets.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:agro/setting.dart';
import 'package:agro/showfeedbacks.dart';
import 'package:agro/widgets/drawerelement.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 1;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List<Widget> screens = [
    WheatNews(),
    HomeScreen(),
    // CustomScreen(),
    MarketLayout(),
    FeedbackListScreen()
  ];
// i apply this method to make me use S.of(context) without any error
  List<String> getTitles(BuildContext context) {
    return [
      S.of(context).explore,
      S.of(context).main,
      S.of(context).Market,
      S.of(context).Feedbacks
    ];
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<LocaleManagementBloc, LocaleStates>(
      builder: (context, state) {
        var cubit = LocaleManagementBloc.get(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Text(
              "${getTitles(context)[current]}",
              style: TextStyle(color: Colors.white),
            ),
            //Change Language Icon
            actions: [
              IconButton(
                  onPressed: () async {
                    await cubit
                        .changeLanguage()
                        .then((value) => null)
                        .catchError((onError) {});
                  },
                  icon: Icon(
                    Icons.language_outlined,
                    color: Colors.white,
                  ))
            ],
            //Open Drawer Icon
            leading: Builder(builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
          ),
          drawer: Drawer(
            width: width * .6,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: width*.55,
                  child: BlocProvider(
                    create: (context) => UserBloc()..getUserData(),
                    child: BlocBuilder<UserBloc, UserStates>(
                      builder: (context, state) {
                        var cubit = UserBloc.get(context);
                        if (state is LoadingGetUserDataState) {
                          return Center(
                            child: defaultCircularProgressIndicator(),
                          );
                        } else if (state is SuccessGetUserDataState) {
                          return Column(
                            children: [
                              SizedBox(height: width*.05),
                              GestureDetector(
                        onTap: (){
                          showImageDialog(context , cubit.userinfo!.image);
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(cubit.userinfo!.image),
                        ),
                      ),
                              SizedBox(height: width*.025),
                              Text(
                                "${cubit.userinfo!.f_name} ${cubit.userinfo!.l_name}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                cubit.userinfo!.email!,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: Text("UnExpecteed Error ocuured"),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                drawerElement(
                    width: width,
                    height: height,
                    icon: Icons.home_outlined,
                    drawerElementname: S.of(context).main,
                    onTap: () {
                      navigateAndClear(context, HomePage());
                    }),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                drawerElement(
                    width: width,
                    height: height,
                    icon: Icons.settings_outlined,
                    drawerElementname: S.of(context).Setting,
                    onTap: () {
                      navigateTo(context, SettingScreen());
                    }),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                drawerElement(
                    width: width,
                    height: height,
                    icon: Icons.info_outline,
                    drawerElementname: S.of(context).About),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                drawerElement(
                    onTap: () {
                      navigateTo(context, FeedbackScreen());
                    },
                    width: width,
                    height: height,
                    icon: Icons.star_border_outlined,
                    drawerElementname: S.of(context).Rateus),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                drawerElement(
                  width: width,
                  height: height,
                  icon: Icons.logout,
                  drawerElementname: S.of(context).logout,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(S.of(context).logout),
                          content: Text(S.of(context).logoutsure),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors
                                    .red, // Change button background color
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text(
                                S.of(context).No,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors
                                    .green, // Change button background color
                              ),
                              onPressed: () {
                                // Navigate to login screen
                                navigateAndClear(context, loginScreen());
                                CashHelper.DeleteData(key: "UID");
                              },
                              child: Text(
                                S.of(context).Yes,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          body: screens[current],
          bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 45.0,
        items: <Widget>[
          Icon(Icons.article_outlined, size: 30, color: current == 0 ? Colors.white : Colors.black),
          Icon(Icons.home, size: 30, color: current == 1 ? Colors.white : Colors.black),
          Icon(Icons.store, size: 30, color: current == 2 ? Colors.white : Colors.black),
          Icon(Icons.star, size: 30, color: current == 3 ? Colors.white : Colors.black),
          
        ],
        color: Colors.green,
        buttonBackgroundColor: Colors.green,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
        letIndexChange: (index) => true,
      ),
          // BottomNavigationBar(
          //     selectedItemColor: Colors.green,
          //     onTap: (index) {
          //       setState(() {
          //         current = index;
          //       });
          //     },
          //     currentIndex: current,
          //     items: [
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.article_outlined),
          //           label: S.of(context).explore),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.home), label: S.of(context).main),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.store), label: S.of(context).Market),
          //     ]),
        );
      },
    );
  }
}
