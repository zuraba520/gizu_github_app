import 'dart:async';//ტაიმერთან მუშაობისათვის
import 'package:flutter/material.dart';//ვიჯეტებისათვის
import 'package:flutter_svg/flutter_svg.dart';//ფოტოებისათვის
import 'package:gizu_github_app/pages/landing_page.dart';
import 'package:gizu_github_app/theme/theme.dart';//ჩასაკრასკისთვის

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();//ქრეათესთათე აბრუნებს =>ის მაგალითს
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;

  @override
  //ამმეთოდში ხდება ტაიმერის ინიციალიზაცია ლოადთაიმერის მეშვეობით,გამოძახებით
  void initState() {
    super.initState();
    _loadTimer();
  }

  @override
  void dispose() {//ეს გასანეიტრალებლად არის აუცილებელი
    _timer.cancel();
    super.dispose();
  }
//ანუ ეს ლოადთაიმერი 1500 მილიწამის გასვლის შემდეგ გადააგდებს ლანდინგ ნავიგაციაზე.
  void _loadTimer() {
    _timer = Timer(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pushNamed(LandingPage.routeName);//ტაიმერის დასრულებისას გადადის ლანდინფეიჯზე როგორგ წეღან ვახსენე
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//სქაფოლდის ვიჯეტი ბრუნდება ფონის ფერით, და კიდევ გითჰაბის ლოგოთი  და კიდევ ტექსტით ველქამ,ანუ მოგესალმებით
      backgroundColor: AppTheme.lightOrange,//ეს ცალკე რო გავაკეთე ფერებზე
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: SvgPicture.asset(
              'assets/svgs/github.svg',
              // ignore: deprecated_member_use
              color: AppTheme.white,
            ),
          ),
          Center(
            child: Text(
              'welcome',
              style: AppTheme.twentyBold.copyWith(
                color: AppTheme.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
