import 'package:dsc_client/configs/assets.dart';
import 'package:dsc_client/constants.dart';
import 'package:dsc_client/helpers/data.dart';
import 'package:dsc_client/helpers/members.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  Data data;

  List<TeamMember> teamMembers;
  String title = CORE_TEAM;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    getTeamData();
    super.initState();
  }

  getTeamData({data = CORE_TEAM}) async {
    this.data = new Data();
    teamMembers = <TeamMember>[];
    await this.data.getTeamData(data);
    teamMembers = this.data.teamMembers;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Center(
                        child: Column(
                      children: [
                        Image.asset(Assets.team_design),
                        Text(
                          title,
                        ),
                      ],
                    )),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: PageView.builder(
                    itemCount: 7,
                    controller: _pageController,
                    onPageChanged: (index) {
                      if (index == 0) {
                        title = CORE_TEAM;
                        getTeamData(data: CORE_TEAM);
                      } else if (index == 1) {
                        title = WEB_TEAM;
                        getTeamData(data: WEB_TEAM);
                      } else if (index == 2) {
                        title = ML_TEAM;
                        getTeamData(data: ML_TEAM);
                      } else if (index == 3) {
                        title = ANDROID_TEAM;
                        getTeamData(data: ANDROID_TEAM);
                      } else if (index == 4) {
                        title = DESIGN_TEAM;
                        getTeamData(data: DESIGN_TEAM);
                      } else if (index == 5) {
                        title = CONTENT_TEAM;
                        getTeamData(data: CONTENT_TEAM);
                      } else if (index == 6) {
                        title = MANAGEMENT_TEAM;
                        getTeamData(data: MANAGEMENT_TEAM);
                      } else {
                        title = CORE_TEAM;
                        getTeamData(data: CORE_TEAM);
                      }
                    },
                    itemBuilder: (context, _) => Container(
                      child: ListView.builder(
                        itemCount: teamMembers.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: 36.0,
                              right: 36,
                              top: 10,
                              bottom:
                                  teamMembers.length - 1 == index ? 100 : 10,
                            ),
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: Offset(0, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  teamMembers[index].profile,
                                ),
                                onError: (exception, stackTrace) {
                                  return Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("😢"),
                                  );
                                },
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white24,
                                  child: Column(
                                    children: [
                                      Text(
                                        teamMembers[index].name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              color: Colors.grey.shade600,
                                              blurRadius: 4,
                                            )
                                          ],
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      teamMembers[index].title != null
                                          ? Text(
                                              teamMembers[index].title,
                                              style: TextStyle(
                                                color: Colors.white,
                                                shadows: [
                                                  Shadow(
                                                    color: Colors.grey.shade600,
                                                    blurRadius: 4,
                                                  )
                                                ],
                                                fontWeight: FontWeight.w900,
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(16.0),
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: Icon(FontAwesome5.twitter),
                                          ),
                                          onTap: () async {
                                            if (await canLaunch(
                                                teamMembers[index].twitter)) {
                                              await launch(
                                                  teamMembers[index].twitter);
                                            } else {
                                              final snackBar = SnackBar(
                                                content: Text(teamMembers[index]
                                                                .twitter ==
                                                            "" ||
                                                        null
                                                    ? 'Link not found'
                                                    : 'Could not launch ${teamMembers[index].twitter}'),
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              color: Colors.white,
                                              child:
                                                  Icon(FontAwesome5.linkedin)),
                                          onTap: () async {
                                            if (await canLaunch(
                                                teamMembers[index].linkedin)) {
                                              await launch(
                                                  teamMembers[index].linkedin);
                                            } else {
                                              final snackBar = SnackBar(
                                                content: Text(teamMembers[index]
                                                                .linkedin ==
                                                            "" ||
                                                        null
                                                    ? 'Link not found'
                                                    : 'Could not launch ${teamMembers[index].linkedin}'),
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              color: Colors.white,
                                              child: Icon(FontAwesome5.github)),
                                          onTap: () async {
                                            if (await canLaunch(
                                                teamMembers[index].github)) {
                                              await launch(
                                                  teamMembers[index].github);
                                            } else {
                                              final snackBar = SnackBar(
                                                content: Text(teamMembers[index]
                                                                .github ==
                                                            "" ||
                                                        null
                                                    ? 'Link not found'
                                                    : 'Could not launch ${teamMembers[index].github}'),
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(16.0),
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: Icon(
                                              FontAwesome5.medium,
                                            ),
                                          ),
                                          onTap: () async {
                                            if (await canLaunch(
                                                teamMembers[index].medium)) {
                                              await launch(
                                                  teamMembers[index].medium);
                                            } else {
                                              final snackBar = SnackBar(
                                                content: Text(teamMembers[index]
                                                                .medium ==
                                                            "" ||
                                                        null
                                                    ? 'Link not found'
                                                    : 'Could not launch ${teamMembers[index].medium}'),
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                padding: EdgeInsets.symmetric(vertical: 8.0),
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12,
                      color: Colors.grey.shade400,
                    )
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        title = CORE_TEAM;
                        getTeamData();
                        _pageController.animateToPage(
                          0,
                          duration: Duration(
                            microseconds: 2,
                          ),
                          curve: Curves.ease,
                        );
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Constants.googleLogoColorsList[0],
                        child: Text(
                          "C",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        title = WEB_TEAM;
                        getTeamData(data: WEB_TEAM);
                        _pageController.animateToPage(
                          2,
                          duration: Duration(
                            microseconds: 2,
                          ),
                          curve: Curves.ease,
                        );
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Constants.googleLogoColorsList[1],
                        child: Text(
                          "W",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        title = ML_TEAM;
                        getTeamData(data: ML_TEAM);
                        _pageController.animateToPage(
                          2,
                          duration: Duration(
                            microseconds: 2,
                          ),
                          curve: Curves.ease,
                        );
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Constants.googleLogoColorsList[2],
                        child: Text(
                          "ML",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        title = ANDROID_TEAM;
                        getTeamData(data: ANDROID_TEAM);
                        _pageController.animateToPage(
                          2,
                          duration: Duration(
                            microseconds: 2,
                          ),
                          curve: Curves.ease,
                        );
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Constants.googleLogoColorsList[3],
                        child: Text(
                          "A",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        title = DESIGN_TEAM;
                        getTeamData(data: DESIGN_TEAM);
                        _pageController.animateToPage(
                          2,
                          duration: Duration(
                            microseconds: 2,
                          ),
                          curve: Curves.ease,
                        );
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Constants.googleLogoColorsList[1],
                        child: Text(
                          "D",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        title = CONTENT_TEAM;
                        getTeamData(data: CONTENT_TEAM);
                        _pageController.animateToPage(
                          2,
                          duration: Duration(
                            microseconds: 2,
                          ),
                          curve: Curves.ease,
                        );
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Constants.googleLogoColorsList[2],
                        child: Text(
                          "C",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        title = MANAGEMENT_TEAM;
                        getTeamData(data: MANAGEMENT_TEAM);
                        _pageController.animateToPage(
                          2,
                          duration: Duration(
                            microseconds: 2,
                          ),
                          curve: Curves.ease,
                        );
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Constants.googleLogoColorsList[3],
                        child: Text(
                          "M",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
