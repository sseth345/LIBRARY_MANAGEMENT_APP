import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  Map<String, bool> faqVisibility = {
    'Library timing?': false,
    'Working days?': false,
    'Digital Library?': false,
    'Food Inside Library?': false,
  };

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Color(0xFFFEFAE0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'About Our Library',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Our library features state-of-the-art infrastructure with digital and non-digital resources, catering to various fields like science, technology, humanities, and more. It includes a digital library, video conferencing, and RFID technology for automated services.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                'FAQs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFAQTile(context, 'Library timing?', '7 am - 12 pm'),
                    SizedBox(width: 10),
                    _buildFAQTile(context, 'Working days?', 'Mon - Sat'),
                    SizedBox(width: 10),
                    _buildFAQTile(context, 'Digital Library?', 'Yes, available',
                            () {
                          _launchURL('http://webopaccc.vit.ac.in/cgi-bin/koha/opac-user.pl');
                        }),
                    SizedBox(width: 10),
                    _buildFAQTile(context, 'Food Inside Library?', 'Strictly prohibited'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQTile(BuildContext context, String question, String answer, [VoidCallback? onTap]) {
    bool isVisible = faqVisibility[question]!;
    return GestureDetector(
      onTap: () {
        setState(() {
          faqVisibility[question] = !faqVisibility[question]!;
        });
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: isVisible ? Color(0xFFFEFAE0) : Color(0xFFD4A373),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isVisible)
              Text(
                question,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 10),
            Visibility(
              visible: isVisible,
              child: Text(
                answer,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
