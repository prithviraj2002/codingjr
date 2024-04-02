import 'package:coding_junior_assignment/constants/colors/assignment-colors.dart';
import 'package:coding_junior_assignment/constants/strings/app_strings.dart';
import 'package:coding_junior_assignment/modules/code_editor/view/code_screen.dart';
import 'package:coding_junior_assignment/widgets/new_project_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CppScreen extends StatelessWidget {
  const CppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.codingJr,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        margin: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: NewProjectButton(
                text: AppStrings.createNewCppProject,
                icon: Icon(
                  Icons.add,
                  color: AppColors.primaryBlue,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              AppStrings.savedProjects,
              style: GoogleFonts.comfortaa(fontSize: 20, fontWeight: FontWeight.bold,),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppStrings.examples,
                  style: GoogleFonts.comfortaa(fontSize: 16),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppStrings.noFilesAvailable,
                        style: GoogleFonts.comfortaa(fontSize: 16),
                      ),
                      Divider()
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Card(
                    surfaceTintColor: Colors.white,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => CodingScreen()));
                      },
                      leading: Icon(Icons.file_copy_outlined, color: AppColors.primaryBlue,),
                      title: Text(AppStrings.cppProblems[index], style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold, fontSize: 16),),
                      subtitle: Text(AppStrings.codingJr, style: GoogleFonts.comfortaa(fontSize: 12),),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15, color: AppColors.primaryBlue,),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(height: 4,);
                },
                itemCount: AppStrings.cppProblems.length)
          ],
        ),
      ),
    );
  }
}
