import 'package:dsc_client/configs/assets.dart';
import 'package:dsc_client/screens/team/TeamTab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Team extends StatefulWidget {
  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  final _year = ['2021', '2020'];
  String? _currentYear = '2021';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          title: Container(
            height: 80,
            child: Image.asset(Assets.vitb_dsc_logo),
          ),
          centerTitle: true,
          actions: [
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                items: _year.map(buildMenuItem).toList(),
                value: _currentYear,
                onChanged: (value) {
                  setState(() {
                    _currentYear = value;
                  });
                },
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(child: Text('Android')),
              Tab(child: Text('Content')),
              Tab(child: Text('Core')),
              Tab(child: Text('Design')),
              Tab(child: Text('Management')),
              Tab(child: Text('ML')),
              Tab(child: Text('Outreach')),
              Tab(child: Text('Web')),
              Tab(child: Text('WTM')),
            ],
            isScrollable: true,
            indicatorColor: Colors.blue.shade200,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: GoogleFonts.rubik(
              fontSize: 14.0,
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              TeamTab(
                team: 'Android',
                year: _currentYear!,
              ),
              TeamTab(
                team: 'Content',
                year: _currentYear!,
              ),
              TeamTab(
                team: 'Core',
                year: _currentYear!,
              ),
              TeamTab(
                team: 'Design',
                year: _currentYear!,
              ),
              TeamTab(
                team: 'Management',
                year: _currentYear!,
              ),
              TeamTab(
                team: 'ML',
                year: _currentYear!,
              ),
              TeamTab(
                team: 'Outreach',
                year: _currentYear!,
              ),
              TeamTab(
                team: 'Web',
                year: _currentYear!,
              ),
              TeamTab(
                team: 'WTM',
                year: _currentYear!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
