import 'package:banking_app/widgets/contact_card.dart';
// import 'package:banking_app/widgets/launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    Future<void> launchURL(String url, String typ) async {
      if (typ == "mailto") {
        final Uri uri = Uri(scheme: typ, path: url);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch $url');
        }
      } else {
        final Uri uri = Uri(scheme: typ, host: url);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch $url');
        }
      }
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        child: Stack(
          children: [
            Container(
              height: screenHeight * 0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color.fromRGBO(136, 104, 255, 1),
              ),
            ),
            const SizedBox(height: 30),
            Positioned(
              top: screenHeight * 0.15,
              left: 0,
              right: 0,
              child: const CircleAvatar(
                radius: 45,
                child: Image(
                  image: NetworkImage(
                      'https://res.cloudinary.com/hy4kyit2a/f_auto,fl_lossy,q_70/learn/modules/mrkt_cloud_studios_builders/mrkt_cloud_studios_builders_email_journey/images/e87a2c14a2c62a87189526c6d8126e18_8-service-op-1.png'),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.30,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Get in Touch',
                  style: GoogleFonts.inriaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.34,
              // left: 0,
              // right: 0,
              child: SizedBox(
                width: screenWidth,
                child: Text(
                  'Sometimes it\'s just easy when we communicate.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inriaSans(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.42,
              child: const Contact(
                icon: Icons.call,
                title: "Call us",
                value: "+977 9860035612",
                type: "tel",
              ),
            ),
            Positioned(
              top: screenHeight * 0.52,
              child: const Contact(
                icon: Icons.email,
                title: "Email us",
                value: "khadkanishant1@gmail.com",
                type: "mailto",
              ),
            ),
            Positioned(
              top: screenHeight * 0.62,
              child: const Contact(
                icon: Icons.browser_not_supported,
                title: "Vist",
                value: "nishantkhadka.com.np",
                type: "https",
              ),
            ),
            Positioned(
              top: screenHeight * 0.72,
              child: const Contact(
                icon: Icons.calendar_month,
                title: "Book an appointment",
                value: "Set Date & Time",
                type: "date",
              ),
            ),
            Positioned(
              top: screenHeight * 0.82,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  width: screenWidth * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 20),
                            Icon(
                              FontAwesomeIcons.connectdevelop,
                              size: 45,
                            ),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  "Connect",
                                  style: GoogleFonts.inriaSans(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: const FaIcon(FontAwesomeIcons.facebook),
                                      onPressed: () {
                                        // launchURL('https://www.facebook.com/profile.php?id=100086381411028', 'https');
                                        launchURL('.facebook.com', 'https');
                                        print('presed');
                                      },
                                    ),
                                    const SizedBox(width: 20),
                                    IconButton(
                                      icon: const FaIcon(FontAwesomeIcons.instagram),
                                      onPressed: () {
                                        // launchURL('instagram.com', 'https');
                                        launchURL('instagram.com/nishantt.nez/', 'https');
                                        print('presed');
                                      },
                                    ),
                                    const SizedBox(width: 20),
                                    IconButton(
                                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                                      onPressed: () {
                                        launchURL('linkedin.com', 'https');
                                        // launchURL('linkedin.com/in/nishant-khadka/', 'https');
                                        print('presed');
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const Icon(Icons.arrow_right),
                        // const SizedBox(width: 1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
