import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchWhatsApp1(BuildContext context) async {
  final Uri whatsappUrl = Uri.parse("https://wa.me/601172205654");
  try {
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      final Uri browserUrl = Uri.parse("https://wa.me/601172205654");
      if (await canLaunchUrl(browserUrl)) {
        await launchUrl(browserUrl, mode: LaunchMode.externalApplication);
      } else {
        print('Failed to launch both WhatsApp app and browser URL');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Unable to open WhatsApp or browser.")),
        );
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error $e")),
    );
  }
}

void launchWhatsApp2(BuildContext context) async {
  final Uri whatsappUrl = Uri.parse("https://wa.me/601172205654");
  try {
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      final Uri browserUrl = Uri.parse("https://wa.me/601172205654");
      if (await canLaunchUrl(browserUrl)) {
        await launchUrl(browserUrl, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Unable to open WhatsApp or browser.")),
        );
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error $e")),
    );
  }
}

void launchWhatsApp3(BuildContext context) async {
  final Uri whatsappUrl = Uri.parse("https://wa.me/601172205654");
  try {
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      final Uri browserUrl = Uri.parse("https://wa.me/601172205654");
      if (await canLaunchUrl(browserUrl)) {
        await launchUrl(browserUrl, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Unable to open WhatsApp or browser.")),
        );
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error $e")),
    );
  }
}
