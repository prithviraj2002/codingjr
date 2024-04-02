import 'package:coding_junior_assignment/constants/colors/assignment-colors.dart';
import 'package:coding_junior_assignment/constants/strings/app_strings.dart';
import 'package:coding_junior_assignment/modules/code_editor/view/run_screen.dart';
import 'package:coding_junior_assignment/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/java.dart';

class CodingScreen extends StatefulWidget {
  const CodingScreen({super.key});

  @override
  State<CodingScreen> createState() => _CodingScreenState();
}

class _CodingScreenState extends State<CodingScreen> {

  TextEditingController codeController = TextEditingController();
  bool problemStatementExpanded = false;
  bool bottomBarExpanded = false;
  final controller = CodeController(
    text: '// ${AppStrings.cppProblems.first}'
        '\n void main ( ) {'
    '\n       cout<<"Hello World!"'
      '\n}',
    language: java
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    codeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
        title: Text(AppStrings.cppIde, style: GoogleFonts.comfortaa(color: Colors.white),),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {  }, icon: Icon(Icons.save),),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => RunScreen()));
            },
            child: Container(
              height: 40, width: 65,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(AppStrings.run, style: GoogleFonts.comfortaa(color: Colors.white),),
                  Icon(Icons.arrow_right, color: Colors.white,)
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            child: ExpansionTile(
                title: Text(AppStrings.cppProblems.first, style: GoogleFonts.comfortaa(color: Colors.white),),
               childrenPadding: const EdgeInsets.all(8.0),
               children: [Text(AppStrings.problemDescription.first, style: GoogleFonts.comfortaa(color: Colors.white),),],
            ),
          ),
          Expanded(
            child: CodeTheme(
              data: CodeThemeData(styles: monokaiSublimeTheme),
              child: SingleChildScrollView(
                child: CodeField(
                  controller: controller,
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height: bottomBarExpanded ? 150 : 80,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    controller.text += 'cout<<" "';
                  },
                    child: BottomButton(text: 'cout')),
                const SizedBox(width: 12,),
                InkWell(
                  onTap: (){
                    controller.text += "<";
                  },
                    child: BottomButton(text: '<')),
                const SizedBox(width: 12,),
                InkWell(
                  onTap: () {
                    controller.text += ">";
                  },
                    child: BottomButton(text: '>')),
                const SizedBox(width: 12,),
                InkWell(
                  onTap: (){
                    setState(() {
                      bottomBarExpanded = !bottomBarExpanded;
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.keyboard_arrow_up_outlined, color: Colors.white,),
                        Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            bottomBarExpanded ? Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    controller.text += '"';
                  },
                    child: BottomButton(text: '"',)),
                const SizedBox(width: 12,),
                InkWell(
                  onTap: () {
                    controller.text += "\n if( ) \n { \n } \n";
                  },
                    child: BottomButton(text: 'if')),
                const SizedBox(width: 12,),
                InkWell(
                  onTap: (){
                    controller.text += "\n else \n { \n } \n";
                  },
                    child: BottomButton(text: 'else')),
                const SizedBox(width: 12,),
                InkWell(
                  onTap: () {
                    controller.text += "for(int i = 0; i <= MAX; i++) { \n }";
                  },
                    child: BottomButton(text: 'for', width: 50,)),
              ],
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
