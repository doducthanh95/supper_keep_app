import 'package:supper_keep_money/core/app_export.dart';

class ButtonDefaultWidget extends StatelessWidget {
  final String? title;
  final Function? onTap;

  const ButtonDefaultWidget({Key? key, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
              colors: [AppColors.yellow500, AppColors.orange500],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: ElevatedButton(
        onPressed: () {
          onTap?.call();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: AppColors.yellow300,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Center(
            child: Text(
          title ?? '',
          style: AppStyle.t16M.apply(color: Colors.white),
        )),
      ),
    );
  }
}
