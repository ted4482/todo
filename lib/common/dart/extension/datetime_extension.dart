import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('yyyy.MM.dd').format(this);

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateTime => DateFormat('yyyy.MM.dd HH:mm').format(this);

  String get relativeDays {
    final diffDays = difference(DateTime.now().onlyDate).inDays;
    final isNegative = diffDays.isNegative;

    final checkCondition = (diffDays, isNegative);
    return switch (checkCondition) {
    (0, _) => _tillToday,
    (1, _) => _tillTomorrow,
    (_, true) => _dayPassed,
    _ => _dayLeft
    };
  }

  DateTime get onlyDate => DateTime(year, month, day);

  String get _dayLeft => 'daysLeft'.tr(
    namedArgs: {"daysCount": difference(DateTime.now().onlyDate).inDays.toString()}
  );

  String get _dayPassed => 'daysPassed'.tr(
      namedArgs: {"daysCount": difference(DateTime.now().onlyDate).inDays.abs().toString()}
  );

  String get _tillToday => 'tillToday'.tr();

  String get _tillTomorrow => 'tillTomorrow'.tr();
}
