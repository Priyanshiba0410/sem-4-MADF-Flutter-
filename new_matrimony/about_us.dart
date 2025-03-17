import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us',
        style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'), // Replace with your image path
            fit: BoxFit.cover, // This ensures the image covers the whole screen
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo-search-grid-1x.png',
                width: 80,
                height: 80,
              ),
              SizedBox(height: 10),
              Text(
                'Meeting Hearts',
                style: GoogleFonts.deliusSwashCaps(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20),
              _buildCard(
                title: 'Meet Our Team',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Developed by', 'Priyanshiba Gohil (23010101090)'),
                    _buildInfoRow('Mentored by', 'Prof. Mehul Bhundiya (Computer Engineering Department),School of Computer Science'),
                    _buildInfoRow('Explored by', 'ASWDC, School Of Computer Science'),
                    _buildInfoRow('Eulogized by', 'Darshan University, Rajkot, Gujarat - INDIA'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _buildCard(
                title: 'About ASWDC',
                content: Column(
                  children: [
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Image.asset('assets/du.png', height: 50),
                          SizedBox(width: 10),
                          Image.asset('assets/aswdc.png', height: 90,width: 150,),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'ASWDC is an Application, Software, and Website Development Center @ Darshan University. Run by students and staff of the School of Computer Science.\n\nSole purpose of ASWDC is to bridge gap between university curriculum & industry demands. Students learn cutting edge technologies, develop real world application & experiences professional environment @ ASWDC under guidance of industry experts & faculty members.',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _buildCard(
                title: 'Contact Us',
                content: Column(
                  children: [
                    _buildContactRow(Icons.email, 'aswdc@darshan.ac.in'),
                    _buildContactRow(Icons.phone, '+91-9727747317'),
                    _buildContactRow(Icons.web, 'www.darshan.ac.in'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _buildSocialLinks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget content}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            Divider(),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          text: '$label: ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.pink),
      title: Text(text, style: TextStyle(fontSize: 16)),
    );
  }

  Widget _buildSocialLinks() {
    return Column(
      children: [
        ListTile(
          leading: Icon(FontAwesomeIcons.shareNodes, color: Colors.pink),
          title: Text('Share App'),
        ),
        ListTile(
          leading: Icon(Icons.apps, color: Colors.pink),
          title: Text('More Apps'),
        ),
        ListTile(
          leading: Icon(Icons.star_rate, color: Colors.pink),
          title: Text('Rate Us'),
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.facebook, color: Colors.pink),
          title: Text('Like us on Facebook'),
        ),
        ListTile(
          leading: Icon(Icons.update, color: Colors.pink),
          title: Text('Check for Update'),
        ),
        SizedBox(height: 10),
        Text(
          '© 2025 Darshan University\nAll Rights Reserved - Privacy Policy\nMade with ❤️ in India',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}