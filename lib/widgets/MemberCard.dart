import 'package:dsc_client/helpers/TeamMember.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberCard extends StatelessWidget {
  final TeamMember member;
  const MemberCard({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final social = member.social!;

    return ListTile(
      title: Text(
        member.name!,
        style: GoogleFonts.rubik(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Image.network(
        member.profile!,
        fit: BoxFit.cover,
        height: 60,
        width: 60,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/images/main_logo.png',
            fit: BoxFit.fitWidth,
            height: 60,
            width: 60,
          );
        },
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (social.github != null && social.github!.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  String link = social.github!;
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                child: Text('G'),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                ),
              ),
            if (social.medium != null && social.medium!.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  String link = social.medium!;
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                child: Text('M'),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                ),
              ),
            if (social.linkedin != null && social.linkedin!.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  String link = social.linkedin!;
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                child: Text('L'),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                ),
              ),
            if (social.twitter != null && social.twitter!.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  String link = social.twitter!;
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                child: Text('T'),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
