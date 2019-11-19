import 'package:animal_farm/src/models/character.dart';
import 'package:animal_farm/src/screens/main_page.dart';
import 'package:animal_farm/src/widgets/bottomnav_widget.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:frideos/frideos.dart';

import '../models/appstate.dart';

import '../models/trivia_stats.dart';


class SummaryPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of<AppState>(context);
    final bloc = AppStateProvider
        .of<AppState>(context)
        .triviaBloc;


    return ValueBuilder(
        streamed: bloc.stats,
        builder: (context, snapshot) {
          TriviaStats stats = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                title: Text('Revision Summary'),
              ),
              drawer: DrawerWidget(),
              // drawer: DrawerWidget(),
              body: FadeInWidget(
                duration: 100,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ValueBuilder(
                    streamed: appState.currentCharacter,
                    noDataChild: const CircularProgressIndicator(),
                    builder: (context, snapshot) {
                      Character character = snapshot.data;
                      String subHeader = "";


                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding:
                                const EdgeInsets.only(bottom: 10.0),
                                child: const Text(
                                  'Animal Farm',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Raleway',

                                    letterSpacing: 3.0,
                                    shadows: [],
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                const EdgeInsets.only(bottom: 50.0),
                                child: const Text(
                                  'GCSE Revision App',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Raleway',

                                    letterSpacing: 3.0,
                                    shadows: [],
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  (stats.corrects.length>0?(stats.corrects.length>3?'Formidable!':'Bravo!'):'Oh dear, '+ character.name+'!') ,
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Raleway',

                                    letterSpacing: 2.0,
                                    shadows: [],
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                const EdgeInsets.only(bottom: 50.0),
                                child: Text(
                      (stats.corrects.length==0?
                              "You didn't answer any questions correctly!"
                          :    "You answered "+stats.corrects.length.toString()+' question'+(stats.corrects.length!=1?'s':'')+' correctly!')
                          ,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Raleway',

                                    letterSpacing: 2.0,
                                    shadows: [],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: AvatarGlow(
                                  startDelay:
                                  Duration(milliseconds: 1000),
                                  glowColor:(character != null
                                      ? character.color
                                      : Colors.blueGrey),
                                  endRadius: 120.0,
                                  duration: Duration(milliseconds: 2000),
                                  repeat: true,
                                  showTwoGlows: true,
                                  repeatPauseDuration:
                                  Duration(milliseconds: 100),
                                  child: Material(
                                      elevation: 8.0,
                                      shape: CircleBorder(),
                                      color: (character != null
                                          ? character.color
                                          : Colors.blueGrey),

                                        child: CircleAvatar(
                                          backgroundColor:
                                          (character != null
                                              ? character.color
                                              : Colors.blueGrey),
                                          backgroundImage: AssetImage(
                                              'assets/images/avatar/' +
                                                  (character == null
                                                      ? 'noavatar'
                                                      : character.id) +
                                                  '.png'),
                                          radius: 100.0,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[],
                                          ),
                                        ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 260,
                              decoration: BoxDecoration(
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(35),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 4.0,
                                        spreadRadius: 2.5),
                                  ]),
                              child: const Text(
                                "Let's Some More Revision!",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            onTap: () =>
                                Navigator.pushNamed(context, "/trivia"),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavWidget(selectedIndex: 0));
        }
    );
  }

        }

