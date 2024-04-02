import 'package:coding_junior_assignment/constants/colors/assignment-colors.dart';
import 'package:coding_junior_assignment/constants/strings/app_strings.dart';
import 'package:coding_junior_assignment/modules/lang_module/view/cpp_screen.dart';
import 'package:coding_junior_assignment/widgets/lang_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.codingJr, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryBlue),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const SizedBox(width: 8,),
              Expanded(child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => CppScreen()));
                },
                  child: LangCard(name: AppStrings.codingLanguages.first, icon: Icon(Icons.code, color: AppColors.primaryBlue, size: 70,),)
              )),
              const SizedBox(width: 12,),
              Expanded(child: LangCard(name: AppStrings.codingLanguages[1], icon: Icon(Icons.laptop, color: AppColors.primaryBlue, size: 70,),),),
              const SizedBox(width: 8,),
            ],
          ),
          const SizedBox(height: 12,),
          ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            shrinkWrap: true,
              itemBuilder: (ctx, index){
            return LangCard(name: AppStrings.codingLanguages[index], icon: index%2 != 0 ?  Icon(Icons.add_chart_sharp, color: AppColors.primaryBlue, size: 70,) : Icon(Icons.tab, color: AppColors.primaryBlue, size: 70,));
          }, separatorBuilder: (ctx, index){
            return const SizedBox(height: 8);
          }, itemCount: AppStrings.codingLanguages.reversed.length - 2),
        ],
      ),
    );
  }
}
