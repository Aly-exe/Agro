import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/markethomepage.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LooseSmut extends StatefulWidget {
  var image;
  LooseSmut(this.image);

  @override
  State<LooseSmut> createState() => _LooseSmutState();
}

class _LooseSmutState extends State<LooseSmut> {
  var player1 = AudioPlayer();
  var player2 = AudioPlayer();
  IconData desicon = Icons.play_arrow;
  IconData medicon = Icons.play_arrow;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              //صورة المرض
              Positioned(
                top: height * .05,
                left: width * .3,
                child: CircleAvatar(
                  radius: width * .1805,
                  backgroundImage: FileImage(
                    widget.image,
                  ),
                ),
              ),
              //وصف المرض
              Positioned(
                top: height * .25,
                right: width * .05,
                left: width * .2,
                child: Container(
                  height: height * .36,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 2.0, left: 12.0, right: 12.0),
                        child: Text(
                          S.of(context).Wheat_Loose_Smut,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 3.0, left: 8.0, right: 8.0),
                        child: Text(
                          S.of(context).loosesmutdes,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height * .4,
                right: CashHelper.getData(key: "lang")=="en" ?width * .1 - width * .12 : width*.7,
                child: IconButton(
                  iconSize: 50.0,
                  icon: Icon(desicon),
                  onPressed: () {
                    if (medicon == Icons.play_arrow) {
                      if (desicon == Icons.play_arrow) {
                        setState(() {
                          desicon = Icons.pause;
                        });
                        if (CashHelper.getData(key: "lang") == "en") {
                          player1
                              .play(AssetSource("sounds/loosesmutdes_en.mp3"));
                        } else {
                          player1
                              .play(AssetSource("sounds/loosesmutdes_ar.mp3"));
                        }
                        player1.onPlayerComplete.listen((event) {
                          setState(() {
                            desicon = Icons.play_arrow;
                          });
                        });
                      } else {
                        setState(() {
                          desicon = Icons.play_arrow;
                        });
                        player1.stop();
                      }
                    }
                  },
                ),
              ),

              //العلاج
              Positioned(
                top: height * .59,
                right: width * .2,
                left: width * .05,
                child: Container(
                  height: height * .37,
                  decoration: BoxDecoration(
                      color: Color(0xFF799A82),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 2.0, left: 12.0, right: 12.0),
                        child: Text(
                          S.of(context).medicinemarket,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 3.0, left: 8.0, right: 8.0),
                        child: Text(
                          S.of(context).loosesmutmed,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height * .72,
                right: CashHelper.getData(key: "lang")=="en" ? width * .11 : width*.85,
                child: IconButton(
                  iconSize: 50.0,
                  icon: Icon(medicon),
                  onPressed: () {
                    if (desicon == Icons.play_arrow) {
                      if (medicon == Icons.play_arrow) {
                        setState(() {
                          medicon = Icons.pause;
                        });
                        if (CashHelper.getData(key: "lang") == "en") {
                          player2
                              .play(AssetSource("sounds/loosesmutmed_en.mp3"));
                        } else {
                          player2
                              .play(AssetSource("sounds/loosesmutmed_ar.mp3"));
                        }
                        player2.onPlayerComplete.listen((event) {
                          setState(() {
                            medicon = Icons.play_arrow;
                          });
                        });
                      } else {
                        setState(() {
                          medicon = Icons.play_arrow;
                        });
                        player2.stop();
                      }
                    }
                  },
                ),
              ),
              //زرار التنقل والذهاب الي المتجر
              Positioned(
                top: height * .93,
                left: width * .27,
                child: ElevatedButton(
                  onPressed: () {
                    navigateTo(context, MarketLayout());
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        S.of(context).Market,
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
