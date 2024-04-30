import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

bool isTablet() {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  return (data.size.shortestSide >= 550);
}

double getStatusBarHeight(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

TextTheme textTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

// Function to open Google Maps with directions
void openMapsDirections(double? originLat, double? originLng, double destinationLat, double destinationLng) async {
  // Replace "your_origin_lat, your_origin_lng" with your starting coordinates
  final String origin = (originLat != null && originLng != null) ? "&origin=$originLat, $originLng" : "";

  final String destination = "$destinationLat, $destinationLng";
  final String url = "https://www.google.com/maps/dir/?api=1$origin&destination=$destination";

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

void sendEmail(String mail) async {
  final Uri url = Uri.parse('mailto:$mail');

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print('Error launching email');
  }
}

Future<void> callUs(String phone) async {
  String phoneNumber = 'tel:$phone';

  if (await canLaunchUrl(Uri.parse(phoneNumber))) {
    await launchUrl(Uri.parse(phoneNumber));
  } else {
    print('Error launching phone call');
  }
}