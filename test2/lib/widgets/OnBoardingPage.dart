import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatelessWidget {
  final Map<String, String> pObj;

  const OnBoardingPage({Key? key, required this.pObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Center(
      child: Container(

        height: 450,
        padding: EdgeInsets.only(left: 0, top: 0),
        width: 350,
        
      
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
                       
             Image.asset(pObj["image"]!,
              fit: BoxFit.fill,
              height: 150,
              width: double.infinity,
              ),

              Text(pObj["title"]!,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 5),
              Text(pObj["subtitle"]!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),),

          
          ],
        ),
      ),
    );
 
  }
}