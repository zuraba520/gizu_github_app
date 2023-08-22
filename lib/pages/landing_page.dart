import 'dart:async';//ტაიმერთან მუშაობისათვის
import 'package:flutter/material.dart';//ვიჯეტებისათვის
import 'package:flutter_spinkit/flutter_spinkit.dart';//ანიმაციებისათვის
import 'package:gizu_github_app/providers/repository_provider.dart';
import 'package:gizu_github_app/widgets/app_bars/default_app_bar.dart';
import 'package:gizu_github_app/widgets/text_fields/default_text_field.dart';
import 'package:provider/provider.dart';//პროვაიდერი
import 'package:gizu_github_app/theme/theme.dart';//ჩასაკრასკისთვის
import 'package:gizu_github_app/widgets/lists/repository_list.dart';
//კლასი ლანდინგ ფეიჯის,
class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/landing';//სატი სტრიქონი,მარშრუტის წარმომადგენელი

  @override
  State<LandingPage> createState() => _LandingPageState();//=> ანუ აბრუნებს ეს მეთოდი ლანდინგის მაგალითს
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

  void _search(v) {//ტაიმერის შედგენა მილიწამის დაგვიანებით,ანუ 300 მილიწამის მერე უსერნამეს რო დავწერთ მერე მოძებნის
    _debounce = Timer(const Duration(milliseconds: 300), () {//დებოუნცე მეხმარება იმაში რო ავარიდო თავი აპის გადაჭარბებას ეგრევე როარ მოძებნოს.ზ
      Provider.of<RepositoryProvider>(context, listen: false).searchRepos(v);//და აი ამ სეარჩრეპოს დახმარებით ეძებს,თუ არსებობს მსგავსი სახელი
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//მთლიანი გვერდის სტრუქტურას განსაზღვრავს
      appBar: const DefaultAppBar(//ანუ ზევით როა სახელი გზ გული და დარქ-ნაითი ეგაა.
        themeSwitcher: true,//თუ მართალია მოხდება თუ არა არმოხდება
        hasBackBtn: false,//ეს < ამისთვის
      ),
      body: Column(
        children: [
          _buildTextField(),//ეს ააბრუნებს სტილისტური საძიებო ტექსტის ველს რომელსაც თავისი მნიშვნელობებიაქ საიზბოქსში
          const SizedBox(
            height: 40,
          ),
          Expanded(//ანუ გაფართოებული ვიჯეტი,შეიცავს ძიების შედეგებს.
            child: Consumer<RepositoryProvider>(//და თუ მიმდინარეობს მოძებნა,ჩატვირტვა აჩვენებს ანიმაციაას
              builder: (__, repoProvider, _) {
                if (repoProvider.getLoading) {
                  return const  Align(
                    child: SpinKitWave(//ეს უბრალოდ ანიმაცია არის,თუ გრძელდება
                      color: AppTheme.gray,
                      size: 0,
                    ),
                  );
                }
                return repoProvider.getRepositoryList.isNotEmpty
                    ? RepositoryList(//თუ არის მოძებნის თუ არარის ახლიდან მოძებნეო წერს,რომელიც ქვევით ტექტსში ჩანს,და თავისი ფერიაქ მინიჭებული თემას გამოყენებით.
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
    return ClipRRect(// აი ეს კიდევ მომრგვალებული რო იყოს მაგისია საზღვრები ანუ,
      // სხვანაირადაც შეიძლებოდა გაკეთება,როგორც მახსოვს,მაგრამ ანამ მირჩია ეს მეთოდი.
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(45),
      ),
      child: Container(
        color: AppTheme.lightOrange,
        padding: const EdgeInsets.all(16),
        height: 100,
        child: ClipRRect(//იგივე მომრგვალება
          borderRadius: const BorderRadius.all(
            Radius.circular(45),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: AppTheme.white,
            child: DefaultTextField(//მორგებული ვიჯეტი
                controller: _controller, onChanged: _search, hint: 'search'),//ეს თვითონ სადაც ვწერთ ნიქნეიმს იმისაა რო მოძებნეო გეუბნება
          ),
        ),
      ),
    );
  }
}
//საბოლოო ჯამში ეს მთლიანი კოდი წარმოადგენს  სფლაშის მერე რო ჩნდება
// მაგ გვერდს საძიებო ზოლით და აჩვენებს გითჰაბის ძიების შედეგებს ანუ პროვაიდერებს.