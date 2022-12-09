import 'package:url_launcher/url_launcher_string.dart';

void review(String appId) async {
  var url = "https://apps.apple.com/app/id$appId?action=write-review";
  if (await launchUrlString(url)) {
    return;
  }
}
