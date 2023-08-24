import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gizu_github_app/providers/repository_provider.dart';
import 'package:gizu_github_app/widgets/app_bars/default_app_bar.dart';
import 'package:gizu_github_app/widgets/text_fields/default_text_field.dart';
import 'package:provider/provider.dart';
import 'package:gizu_github_app/theme/theme.dart';
import 'package:gizu_github_app/widgets/lists/repository_list.dart';
//კლასი ლანდინგ ფეიჯის,
class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/landing';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _controller = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _search('github');
  }

  @override
  void dispose() {
    _controller.dispose();//23 გაუქმება
    _debounce?.cancel();//ნებისმიერი ტაიმერი გაუქმება
    super.dispose();
  }

  void _search(v) {
    _debounce = Timer(const Duration(milliseconds: 300), () {
      Provider.of<RepositoryProvider>(context, listen: false).searchRepos(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//მთლიანი გვერდის სტრუქტურას განსაზღვრავს
      appBar: const DefaultAppBar(
        themeSwitcher: true,
        hasBackBtn: false,
      ),
      body: Column(
        children: [
          _buildTextField(),
          const SizedBox(
            height: 40,
          ),
          Expanded(//ანუ გაფართოებული ვიჯეტი,შეიცავს ძიების შედეგებს.
            child: Consumer<RepositoryProvider>(//და თუ მიმდინარეობს მოძებნა,ჩატვირტვა აჩვენებს ანიმაციაას
              builder: (__, repoProvider, _) {
                if (repoProvider.getLoading) {
                  return const  Align(
                    child: SpinKitWave(
                      color: AppTheme.gray,
                      size: 0,
                    ),
                  );
                }
                return repoProvider.getRepositoryList.isNotEmpty
                    ? RepositoryList(
                        list: repoProvider.getRepositoryList,
                      )
                    : const Text(
                        'Search again!',
                        style: AppTheme.twentyBold,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect _buildTextField() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(45),
      ),
      child: Container(
        color: AppTheme.lightOrange,
        padding: const EdgeInsets.all(16),
        height: 100,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(45),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: AppTheme.white,
            child: DefaultTextField(
                controller: _controller, onChanged: _search, hint: 'search'),
          ),
        ),
      ),
    );
  }
}
//საბოლოო ჯამში ეს მთლიანი კოდი წარმოადგენს  სფლაშის მერე რო ჩნდება
// მაგ გვერდს საძიებო ზოლით და აჩვენებს გითჰაბის ძიების შედეგებს ანუ პროვაიდერებს.