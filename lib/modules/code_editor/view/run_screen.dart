import 'package:coding_junior_assignment/constants/colors/assignment-colors.dart';
import 'package:coding_junior_assignment/constants/strings/app_strings.dart';
import 'package:coding_junior_assignment/widgets/run_screen_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RunScreen extends StatefulWidget {
  const RunScreen({super.key});

  @override
  State<RunScreen> createState() => _RunScreenState();
}

class _RunScreenState extends State<RunScreen> {
  TextEditingController inputController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    inputController.dispose();
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
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          AppStrings.enterYourInput,
          style: GoogleFonts.comfortaa(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 150,
              padding: const EdgeInsets.all(4.0),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.inputBoxBorder),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  Text(
                    AppStrings.enterYourInputHere,
                    style: GoogleFonts.comfortaa(
                        color: AppColors.inputBoxBorder, fontSize: 16),
                  ),
                  TextFormField(
                    maxLines: null,
                    controller: inputController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        prefix: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                        border: InputBorder.none),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: InkWell(
                  onTap: () {
                    showDialog(context: context, builder: (ctx){
                      Future.delayed(Duration(seconds: 3), (){
                        Navigator.pop(context);
                        showDialog(context: context, builder: (ctx){
                          return Container(
                            height: 500,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: AlertDialog(
                              surfaceTintColor: Colors.black,
                              backgroundColor: AppColors.primaryBlue,
                              title: Center(child: Text(AppStrings.compiledSuccessfully, style: GoogleFonts.comfortaa(color: Colors.white),)),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.check, color: Colors.green, size: 30,)
                                ],
                              ),
                            ),
                          );
                        });
                      });
                      return Container(
                        height: 500,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: AlertDialog(
                          surfaceTintColor: Colors.black,
                          backgroundColor: AppColors.primaryBlue,
                          title: Center(child: Text(AppStrings.compilingCode, style: GoogleFonts.comfortaa(color: Colors.white),)),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircularProgressIndicator(color: Colors.white,)
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: RunScreenButtons(
                    text: AppStrings.runCode,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ))),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: InkWell(
                onTap: (){
                  showDialog(context: context, builder: (ctx){
                    return Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: AlertDialog(
                        surfaceTintColor: Colors.black,
                        backgroundColor: AppColors.primaryBlue,
                        title: Text(AppStrings.plagiarismAlert, style: GoogleFonts.comfortaa(
                          color: Colors.white
                        ),),
                        content: Text(AppStrings.plagiarismAlertContent, style: GoogleFonts.comfortaa(color: Colors.white),),
                        actions: [
                          TextButton(onPressed: (){Navigator.pop(context);}, child: Text('No', style: TextStyle(color: Colors.white),)),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                            showDialog(context: context, builder: (ctx){
                              Future.delayed(Duration(seconds: 3), (){
                                Navigator.pop(context);
                                showDialog(context: context, builder: (ctx) {
                                  return Container(
                                    height: 500,
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: AlertDialog(
                                      surfaceTintColor: Colors.black,
                                      backgroundColor: AppColors.primaryBlue,
                                      title: Text(AppStrings.codeSubmitted, style: GoogleFonts.comfortaa(color: Colors.white),),
                                      content: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.check, color: Colors.green, size: 30,)
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              });
                              return Container(
                                height: 500,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: AlertDialog(
                                  surfaceTintColor: Colors.black,
                                  backgroundColor: AppColors.primaryBlue,
                                  title: Text(AppStrings.submittingCode, style: GoogleFonts.comfortaa(color: Colors.white),),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      CircularProgressIndicator(color: Colors.white,)
                                    ],
                                  ),
                                ),
                              );
                            });
                          }, child: Text('Yes', style: TextStyle(color: Colors.white),))
                        ],
                      ),
                    );
                  });
                },
                child: RunScreenButtons(
                            text: AppStrings.submitCode,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
              )),
        ],
      ),
    );
  }
}
