class Content {
  final String zekr;
  final int repeat;
  final String bless;
  Content({
    required this.zekr,
    required this.repeat,
    required this.bless,
  });

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      zekr: map['zekr'] as String,
      repeat: map['repeat'].toInt() as int,
      bless: map['bless'] as String,
    );
  }
}
