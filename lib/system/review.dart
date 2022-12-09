import 'package:url_launcher/url_launcher_string.dart';
import 'package:utils/toast.dart';

void launchUrl(String url) async {
  if (await launchUrlString(url)) {
    return;
  }
  Toast.show(msg: '启动失败，请坚持是否安装该app');
}
