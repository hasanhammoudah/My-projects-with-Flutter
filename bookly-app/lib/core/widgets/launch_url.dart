import 'package:booklyapp/core/widgets/custom_snacbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCutomUrl(context, String? url) async {
  if(url !=null){
Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      CustomSnacbar(context, 'Cannot launch $url');
    }
  }
  
}

