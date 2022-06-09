// ignore_for_file: must_be_immutable

import 'package:campost/views/homepage/homepage_constants.dart';
import 'package:campost/views/mobile_money_create_form/mobile_money_sheet.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/views_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  static const routeName = '/home_page';
  HomePageView({Key? key}) : super(key: key);
  var _bottomNavIndex = 0.obs;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: _bottomNavIndex.value,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          onTap: (value) {
            _bottomNavIndex(value);
            if (value == 0) {
              _pageController.jumpToPage(0);
            }
            if (value == 1) {
              _pageController.jumpToPage(1);
            }

            if (value == 2) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: (context) => Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: MobileMoneySheet(),
                ),
              );
            }
            if (value == 3) {
              _pageController.jumpToPage(2);
            }
            if (value == 4) {
              _pageController.jumpToPage(3);
            }
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Image.asset(
                HomePageConstants.homeIcon,
                width: 22,
                color: _bottomNavIndex.value == 0
                    ? Color(0xff0019ff)
                    : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Transaction',
              icon: Image.asset(
                HomePageConstants.transactionIcon,
                width: 25,
                color: _bottomNavIndex.value == 1
                    ? Color(0xff0019ff)
                    : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Add',
              icon: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff001aff)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Mobile money',
              icon: Image.asset(
                HomePageConstants.mobileMoneyIcon,
                width: 30,
                color: _bottomNavIndex.value == 3
                    ? Color(0xff0019ff)
                    : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Cards',
              icon: Image.asset(
                HomePageConstants.cardIcon,
                width: 30,
                color: _bottomNavIndex.value == 4
                    ? Color(0xff0019ff)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          LinesBackground(
            child: SafeArea(
              child: SizedBox.expand(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpace(30.h),
                      ScreenPadding(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AccountProcessView.routeName);
                              },
                              child: Image.asset(
                                HomePageConstants.menuIcon,
                                width: 27.w,
                              ),
                            ),
                            HorizontalSpace(15.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello Adam',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Welcome Back!',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                VerticalSpace(4.h),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Color(0xfffff5de),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text(
                                    'Pending Validation',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffffa200),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      VerticalSpace(28.h),
                      SizedBox(
                        height: 148.h,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 20.w),
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => AccountCard(),
                        ),
                      ),
                      VerticalSpace(25.h),
                      ScreenPadding(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuItem(
                              IconPath: HomePageConstants.transactionIcon,
                              name: 'Transactions',
                              onTap: () {},
                            ),
                            MenuItem(
                              IconPath: HomePageConstants.topupIcon,
                              name: 'Topup',
                              onTap: () {
                                Get.toNamed(AccountProcessView.routeName);
                              },
                            ),
                            MenuItem(
                              IconPath: HomePageConstants.withdrawIcon,
                              name: 'Withdraw',
                              onTap: () {
                                Get.toNamed(WithdrawView.routeName);
                              },
                            ),
                            MenuItem(
                              IconPath: HomePageConstants.moreIcon,
                              name: 'More',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      VerticalSpace(24.h),
                      ScreenPadding(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Last Topup',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.sp,
                                ),
                              ),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                          VerticalSpace(15.h),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff0019ff)),
                                child: Image.asset(
                                  HomePageConstants.topupIcon,
                                  color: Colors.white,
                                ),
                              ),
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Text('Topup'),
                              subtitle: Text('Sep 26, 10:34 pm'),
                              trailing: Text('-\$143.44'),
                            ),
                          ),
                          VerticalSpace(10.h),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff0019ff)),
                                child: Image.asset(
                                  HomePageConstants.topupIcon,
                                  color: Colors.white,
                                ),
                              ),
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Text('Topup'),
                              subtitle: Text('Sep 26, 10:34 pm'),
                              trailing: Text('-\$143.44'),
                            ),
                          ),
                          VerticalSpace(24.h),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.r),
                                gradient: LinearGradient(colors: [
                                  Color(0xfff1c500),
                                  Color(0xffffd800),
                                ])),
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 23.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Account Details',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                VerticalSpace(7.h),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mauris sem,',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          VerticalSpace(24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Last Withdraw',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.sp,
                                ),
                              ),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                          VerticalSpace(15.h),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffff7000)),
                                child: Image.asset(
                                  HomePageConstants.withdrawIcon,
                                  color: Colors.white,
                                ),
                              ),
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Text('Withdraw'),
                              subtitle: Text('Sep 26, 10:34 pm'),
                              trailing: Text('-\$143.44'),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffff7000)),
                                child: Image.asset(
                                  HomePageConstants.withdrawIcon,
                                  color: Colors.white,
                                ),
                              ),
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Text('withdraw'),
                              subtitle: Text('Sep 26, 10:34 pm'),
                              trailing: Text('-\$143.44'),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text('Transaction'),
            ),
          ),
          MobileMoneyView(),
          Container(
            child: Center(
              child: TextButton(
                  onPressed: () {
                    Get.toNamed(OopsView.routeName);
                  },
                  child: Text('Error page')),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      height: 138.h,
      width: 247.w,
      constraints: BoxConstraints(
        maxHeight: 150,
        maxWidth: 300,
        minHeight: 100,
        minWidth: 200,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff0087ff),
          Color(0xff0028ff),
        ]),
        borderRadius: BorderRadius.circular(
          13.r,
        ),
      ),
      child: Stack(
        children: [
          Opacity(
              opacity: .3, child: Image.asset('assets/images/cardline1.png')),
          Opacity(
            opacity: .3,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/cardline2.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Blocked Saving',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp),
                ),
                Spacer(),
                Text(
                  'Current Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ),
                VerticalSpace(4.h),
                Text(
                  '\$1200.49',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String name;
  final String IconPath;
  final VoidCallback onTap;
  const MenuItem({
    Key? key,
    required this.name,
    required this.IconPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffefeff4),
            ),
            child: Image.asset(
              IconPath,
              width: 31.w,
            ),
          ),
          VerticalSpace(7.h),
          Text(
            name,
            style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
