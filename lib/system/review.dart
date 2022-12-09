import 'package:url_launcher/url_launcher_string.dart';

void review(String url) async {
  if (await launchUrlString(url)) {
    return;
  }
}
