import 'package:supper_keep_money/core/app_export.dart';

class CardDefaultWidget extends StatefulWidget {
  final Widget? child;
  final double? width;
  final double? height;

  const CardDefaultWidget({Key? key, this.child, this.width, this.height})
      : super(key: key);

  @override
  State<CardDefaultWidget> createState() => _CardDefaultWidgetState();
}

class _CardDefaultWidgetState extends State<CardDefaultWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.only(left: 16, top: 6, bottom: 6, right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.06)),
      child: widget.child,
    );
  }
}
