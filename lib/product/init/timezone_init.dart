import 'package:timeago/timeago.dart' as timeago;

class TimezoneInit {
  init() {
    timeago.setLocaleMessages('tr', timeago.TrMessages());
    timeago.setLocaleMessages('en', timeago.EnMessages());
  }
}
