import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String link, String typ) async {
  // String url = Uri.encodeFull(link);
  // String url = link.replaceAll('/', '%2F');
  // print(url);
  if (typ == "mailto" || typ == "tel") {
    final Uri uri = Uri(scheme: typ, path: link);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $link');
    }
  } else {
    // String url = Uri.try;
    // String url = Uri.encodeFull(link);
    // String url1 = link.split("/")[0];

    final Uri uri = Uri(scheme: typ, host: link);
    // final Uri uri = Uri.tryParse(link);
    // final Uri uri = Uri.https(link);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ');
    }
  }
}
