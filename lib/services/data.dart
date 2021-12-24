import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

//scrape the data from the website www.daraz.pk and show page title, page content, page url
void scrapeData(String weburl) async {
  var url = Uri.parse(weburl);
  var response = await http.get(url);
  var document = parse(response.body);

  print(response.body);

  var title1 = document.getElementsByClassName('pdp-mod-product-badge-wrapper');
  var title2 = title1.first;
  var title3 = title2.getElementsByClassName('pdp-mod-product-badge-title');
  var title4 = title3.first;
  String title5 = title4.text;

  print('Page Title: $title5');
}

void main() {
  scrapeData(
      'https://www.daraz.pk/products/i132822081-s1293067111.html?urlFlag=true&mp=1');
}
