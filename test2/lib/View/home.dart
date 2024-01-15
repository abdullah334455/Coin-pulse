import 'package:crypto/Model/coinModel.dart';
import 'package:crypto/View/Components/item.dart';
import 'package:crypto/View/Components/item2.dart';
import 'package:crypto/components/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'navBar.dart';
import 'package:crypto/View/prediction.dart';
import 'package:crypto/screen/home/home_page.dart';
import 'package:crypto/widgets/OnBoardingPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

int selectPage = 0;
PageController controller = PageController();

List<Map<String, String>> pageArr = [
    {
      "title": "Find out best bitcoin strategies in the 2024 for investment",
      "subtitle":
      "Don't worry if you have trouble determining your goals. We can help you determine and track your goals.",
      "image": "assets/images/bit1.jpg"
    },
    {
      "title": "Get Burn",
      "subtitle":
      "Let’s keep burning to achieve your goals. It may hurt temporarily, but giving up will cause permanent pain.",
      "image": "assets/images/bit2.jpg"
    },
    {
      "title": "Eat Well",
      "subtitle":
      "Start a healthy lifestyle with us. We can help you plan your daily diet. Eating healthy can be fun!",
      "image": "assets/images/bit3.jpg"
    },
    {
      "title": "Improve Sleep Quality",
      "subtitle":
      "Improve the quality of your sleep with us. Good quality sleep can bring a positive mood in the morning.",
      "image": "assets/images/bit4.jpg"
    },
  ];



  @override
  void initState() {
    getCoinMarket();
    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
          DrawerHeader(
  child: RichText(
    text: TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: 24, // Adjust the font size as needed
        fontWeight: FontWeight.bold, // Make the text bold
      ),
      children: [
        TextSpan(
          text: 'Your ',
        ),
        TextSpan(
          text: 'Account',
          style: TextStyle(
            color: Colors.black, // You can customize the style for the second part of the text
          ),
        ),
      ],
    ),
  ),
  decoration: BoxDecoration(
    color: Color(0xffFBC700),
  ),
)
,
            ListTile(
  title: MouseRegion(
    cursor: SystemMouseCursors.click,
    child: InkWell(
      onTap: () {
        // Handle tap event for Dashboard
      },
      child: ListTile(
        leading: Icon(Icons.dashboard),
        title: Text('Dashboard'),
      ),
    ),
  ),
),
            ListTile(
  title: MouseRegion(
    cursor: SystemMouseCursors.click,
    child: InkWell(
      onTap: () {
        // Handle tap event for Dashboard
      },
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
      ),
    ),
  ),
),
            ListTile(
  title: MouseRegion(
    cursor: SystemMouseCursors.click,
    child: InkWell(
      onTap: () {
        // Handle tap event for Dashboard
      },
      child: ListTile(
        leading: Icon(Icons.mail),
        title: Text('Help'),
      ),
    ),
  ),
),
           ListTile(
  title: MouseRegion(
    cursor: SystemMouseCursors.click,
    child: InkWell(
      onTap: () {
        // Handle tap event for Dashboard
      },
      child: ListTile(
        leading: Icon(Icons.app_registration),
        title: Text('Applications'),
      ),
    ),
  ),
),
       ListTile(
  title: MouseRegion(
    cursor: SystemMouseCursors.click,
    child: InkWell(
      onTap: () async {
        try {
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        } catch (e) {
          print('Error during logout: $e');
          // Handle logout error if needed
        }
      },
      child: ListTile(
        leading: Icon(Icons.logout),
        title: Text('Logout'),
      ),
    ),
  ),
),

        ]),
      ),
        
        backgroundColor: 
                      Color.fromARGB(255, 253, 225, 112),
                      
                    
        extendBodyBehindAppBar: true,
        
        
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 253, 225, 112),
        ),
        
        
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50),
              
              width: myWidth,
              height: 1460,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 253, 225, 112),
                      Color(0xffFBC700),
                    ]),
              ),
              child: Column(
                
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: myHeight * 0.09, left: 10,right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: myWidth * 0.02, vertical: myHeight * 0.005),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Main portfolio',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          MaterialButton(
                            hoverColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  HomePage()),
  );
                            },
                            child: Text(
                              'Crypto News',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          MaterialButton(
                            hoverColor: Colors.white,
                            onPressed: () {
                               Navigator.push(  
                          context,  
                          MaterialPageRoute(builder: (context) => prediction()),  
                        ); 
                            },
                            child: Text(
                              'Prediction',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                    SizedBox(height: 10,),
          
          
          
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  HomePage()),
  );
                      },
                      child: Column(
                                  children: [
                                    Text('News Update',
                                    style: TextStyle(
                                      fontSize: 20,
                      
                                      fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(height: 10,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.8,
                                  height: MediaQuery.of(context).size.width*0.9,
                                  child: PageView.builder(
                                controller: controller,
                                itemCount: pageArr.length,
                                itemBuilder: (context, index) {
                                  var pObj = pageArr[index];
                                  return OnBoardingPage(pObj: pObj);
                                },
                                  ),
                                ),
                                    
                                    Container(
                                      width: 200.0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: List.generate(
                      pageArr.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 10.0,
                        width: (selectPage == index) ? 20.0 : 10.0,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: BoxDecoration(
                          color: (selectPage == index) ? Colors.black : Colors.grey,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                                        ),
                                      ),
                                    ),
                                SizedBox(height: 20), 
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.8,
                          child: ElevatedButton(
                            
                            onPressed: () {
                              if (selectPage < 3) {
                                selectPage = selectPage + 1;
                                controller.animateToPage(
                                  selectPage,
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.bounceInOut,
                                );
                                setState(() {});
                              } 
                              // else {
                              //   print("Open Welcome Screen"); }
                                },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              child: Icon(
                                Icons.skip_next,color: Colors.white,
                              ),),),),], ),
                    ),
          
          SizedBox(height: 30), 
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ 7,466.20',
                          style: TextStyle(fontSize: 35),
                        ),
                        Container(
                          padding: EdgeInsets.all(myWidth * 0.02),
                          height: myHeight * 0.05,
                          width: myWidth * 0.1,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.5)),
                          child: Image.asset(
                            'assets/icons/5.1.png',
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                    child: Row(
                      children: [
                        Text(
                          '+162% all time',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  Container(
                    height: 774,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                        
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Column(
                      
                      children: [
                        SizedBox(
                          height: myHeight * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Assets',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.add)
                            ],
                          ),
                        ),
                        SizedBox(
                          // height: myHeight * 0.01,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            height: 500,
                            width: MediaQuery.of(context).size.width*1,
                            child: isRefreshing == true
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xffFBC700),
                                    ),
                                  )
                                : coinMarket == null || coinMarket!.length == 0
                                    ? Padding(
                                        padding: EdgeInsets.all(myHeight * 0.01),
                                        child: Center(
                                          child: Text(
                                            'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: 4,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Item(
                                            item: coinMarket![index],
                                          );
                                        },
                                      ),
                          ),
                        ),
                        SizedBox(
                          height: myHeight * 0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: myWidth * 0.05),
                          child: Row(
                            children: [
                              Text(
                                'Recommend to Buy',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: myHeight * 0.01,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: myWidth * 0.03),
                            child: isRefreshing == true
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xffFBC700),
                                    ),
                                  )
                                : coinMarket == null || coinMarket!.length == 0
                                    ? Padding(
                                        padding: EdgeInsets.all(myHeight * 0.06),
                                        child: Center(
                                          child: Text(
                                            'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: coinMarket!.length,
                                        itemBuilder: (context, index) {
                                          return Item2(
                                            item: coinMarket![index],
                                          );
                                        },
                                      ),
                          ),
                        ),
                        
                        
                      ],
                    ),
                  ),
                ],
              ),
            
          ),
        ),
      ),
    );
  }

  bool isRefreshing = true;

  List? coinMarket = [];
  var coinMarketList;
  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    setState(() {
      isRefreshing = true;
    });
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    setState(() {
      isRefreshing = false;
    });
    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
    return null;
  }
}
