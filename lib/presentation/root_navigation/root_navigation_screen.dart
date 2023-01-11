import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/presentation/home_screen/home/index.dart';
import 'package:supper_keep_money/presentation/profile/index.dart';
import 'package:supper_keep_money/presentation/root_navigation/controller/root_navigation_controller.dart';
import 'package:supper_keep_money/presentation/transaction/transaction_screen/index.dart';
import 'package:supper_keep_money/presentation/wallet/index.dart';
import 'package:supper_keep_money/widgets/image_widget.dart';
import 'package:supper_keep_money/routes/app_routes.dart';

class RootNavigationScreen extends StatefulWidget {
  const RootNavigationScreen({Key? key}) : super(key: key);

  @override
  State<RootNavigationScreen> createState() => _RootNavigationScreenState();
}

class _RootNavigationScreenState extends State<RootNavigationScreen>
    with TickerProviderStateMixin {
  late AnimationController _fabAnimationController;
  late Animation<double> fabAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  var _activeIndex = 0;

  final _controller = RootNavigationController();

  final _iconList = <IconData>[
    Icons.home,
    Icons.account_balance_wallet_outlined,
    Icons.pie_chart,
    Icons.account_circle,
  ]; //default index of a first screen

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activeIndex,
        children: [
          HomePage(),
          WalletPage(),
          HomePage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: HexColor('#FFA400'),
        backgroundColor: AppColors.backgroundPri,
        splashColor: AppColors.backgroundPri,
        foregroundColor: AppColors.backgroundPri,

        child: ImageApp(
          url: AppPath.icAdd,
          width: 24,
          height: 24,
          color: AppColors.yellow500,
          // color: HexColor('#373A36'),
        ),
        onPressed: () {
          _controller.gotoTransactionType();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: _iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? AppColors.yellow500 : Colors.white;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _iconList[index],
                size: 28,
                color: color,
              ),
              const SizedBox(height: 4),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   child: AutoSizeText(
              //     "brightness $index",
              //     maxLines: 1,
              //     style: TextStyle(color: color),
              //     group: autoSizeGroup,
              //   ),
              // )
            ],
          );
        },
        backgroundColor: AppColors.backgroundPri,
        activeIndex: _activeIndex,
        // splashColor: HexColor('#FFA400'),
        splashColor: AppColors.backgroundPri,
        splashSpeedInMilliseconds: 300,

        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) => setState(() => _activeIndex = index),
        // hideAnimationController: _hideBottomBarAnimationController,
        shadow: BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          // color: fromHex('#FFA400'),
        ),
        blurEffect: true,
      ),
    );
  }
}
