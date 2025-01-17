import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitmantra/common_widget/round_button.dart';
import 'package:fitmantra/common_widget/workout_row.dart';
import 'activity_tracker_view.dart';
import 'finished_workout_view.dart';
import 'notification_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../common/color_extension.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   String? _selectedDay;
    

    List lastWorkoutArr = [
    {
      "name": "Full Body Workout",
      "image": "assets/img/workout1.png",
      "kcal": "180",
      "time": "20",
      "progress": 0.3
      
    },
    {
      "name": "Lower Body Workout",
      "image": "assets/img/workout2.png",
      "kcal": "200",
      "time": "30",
      "progress": 0.4
    },
    {
      "name": "Ab Workout",
      "image": "assets/img/workout3.png",
      "kcal": "300",
      "time": "40",
      "progress": 0.7
    },
  ];

  List<int> showingTooltipOnSpots = [1, 3, 5];

  List<FlSpot> get allSpots => const [
            FlSpot(0, 20),
            FlSpot(1, 25),
            FlSpot(2, 40),
            FlSpot(3, 50),
            FlSpot(4, 35),
            FlSpot(5, 40),
            FlSpot(6, 30),
            FlSpot(7, 20),
            FlSpot(8, 25),
            FlSpot(9, 40),
            FlSpot(10, 50),
            FlSpot(11, 35),
            FlSpot(12, 50),
            FlSpot(13, 60),
            FlSpot(14, 40),
            FlSpot(15, 50),
            FlSpot(16, 20),
            FlSpot(17, 25),
            FlSpot(18, 40),
            FlSpot(19, 50),
            FlSpot(20, 35),
            FlSpot(21, 80),
            FlSpot(22, 30),
            FlSpot(23, 20),
            FlSpot(24, 25),
            FlSpot(25, 40),
            FlSpot(26, 50),
            FlSpot(27, 35),
            FlSpot(28, 50),
            FlSpot(29, 60),
            FlSpot(30, 40),

            //  FlSpot(0, 50),
            // FlSpot(1, 50),
            // FlSpot(2, 50),
            // FlSpot(3, 50),
            // FlSpot(4, 50),
            // FlSpot(5, 50),
            // FlSpot(6, 50),
            // FlSpot(7, 50),
            // FlSpot(8, 50),
            // FlSpot(9, 50),
            // FlSpot(10, 50),
            // FlSpot(11, 50),
            // FlSpot(12, 50),
            // FlSpot(13, 50),
            // FlSpot(14, 50),
            // FlSpot(15, 50),
            // FlSpot(16, 50),
            // FlSpot(17, 50),
            // FlSpot(18, 50),
            // FlSpot(19, 50),
            // FlSpot(20, 50),
            // FlSpot(21, 50),
            // FlSpot(22, 50),
            // FlSpot(23, 50),
            // FlSpot(24, 50),
            // FlSpot(25, 50),
            // FlSpot(26, 50),
            // FlSpot(27, 50),
            // FlSpot(28, 50),
            // FlSpot(29, 50),
            // FlSpot(30, 50),
      ];

      List waterArr =  [{"title": "6am - 8am", "subtitle": "600ml"},
       {"title": "9am - 11am", "subtitle": "500ml"}, 
      {"title": "11am - 2pm", "subtitle": "1000ml"}, 
      {"title": "2pm - 4pm", "subtitle": "700ml"},
       {"title": "4pm - now", "subtitle": "900ml"}];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

     final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
      
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              TColor.primaryColor2.withOpacity(0.4),
               
                TColor.primaryColor1.withOpacity(0.2),
        
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        dotData: FlDotData(show: false),
        gradient: LinearGradient(
          colors: 
            TColor.primaryG,
          
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Scaffold(
      backgroundColor: TColor.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
            
             Text("Welcome Back," ,
              style: TextStyle(color: TColor.white, fontSize: 15),
                  ),
              
              
                  Text("Kirrtana" , 
                  style: TextStyle(
                    color: TColor.white, 
                    fontSize: 20, 
                    fontWeight: FontWeight.w700),
                  ), 
              ],),
              
              

                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationView(),
                       ),
                       );
                    }, 
                    icon: Image.asset("assets/img/notification_active.png", 
                    width: 25, 
                    height: 25, 
                    fit: BoxFit.fitHeight,
                    ))
              ],
              ),

               SizedBox(
                    height: media.width * 0.05, 
                    ),

                    Container(
                      
                      height: media.width * 0.4,
                      decoration: BoxDecoration(gradient: LinearGradient(colors: TColor.primaryG),
                    borderRadius: BorderRadius.circular(media.width * 0.075)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                         Image.asset(
                          "assets/img/bg_dots2.png",
                          height: media.width * 0.5,
                          width: double.maxFinite,
                          fit: BoxFit.fitHeight,

                          ),

                          Padding(
                            padding: 
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 27),
                            child: Row(children: [
                               Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text("BMI (Body Mass Index)" , 
                                              style: TextStyle(
                                                color: TColor.white, 
                                                fontSize: 16, 
                                                fontWeight: FontWeight.w700),
                                              ), 
                            
                                  Text("You have a normal weight" ,
                                          style: TextStyle(
                                            color: TColor.white.withOpacity(0.7),
                                             fontSize: 13),
                                              ),

                                    SizedBox(
                                     height: media.width * 0.05, 
                                      ),

                                      SizedBox(
                                        width: 120,
                                        height: 33,
                                        child: RoundButton(title: "View More", type: RoundButtonType.bgSGradient, fontSize: 13, onPressed: (){}))
                                          
                                          
                                ],
                               ),

                               AspectRatio(
                                aspectRatio: 1,
                                child: PieChart(PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback: 
                                    (FlTouchEvent event, pieTouchResponse){
                                     
                                    },
                                  ),
                                  startDegreeOffset: 250,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 0,
                                  sections: showingSections(),
                                 ),
                                 ),
                               ),
                               
                            
                            ],),
                          )
              ]),
                    )
                        ,
                        
                        SizedBox(
                    height: media.width * 0.05, 
                    ),
                            
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              decoration: BoxDecoration(
                                color: TColor.primaryColor1.withOpacity(0.3),
                                 borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text("Today's Target" , 
                                   style: TextStyle(
                                   color: TColor.white, 
                                       fontSize: 15, 
                                      fontWeight: FontWeight.w700),
                  ),
                                        SizedBox(
                                        width: 70,
                                        height: 25,
                                        child: RoundButton(
                                          title: "Check", 
                                          type: RoundButtonType.bgGradient,
                                           fontSize: 11, 
                                           onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivityTrackerView(),
                                            ),
                                            );
                                           },
                                           ),
                                           ), 

                                  ],),
                            ),

                            SizedBox(
                    height: media.width * 0.05, 
                    ),

                      Text("Activity Status" , 
                                   style: TextStyle(
                                   color: TColor.white, 
                                       fontSize: 15, 
                                      fontWeight: FontWeight.w700),
                  ),

                  
                            SizedBox(
                    height: media.width * 0.02, 
                    ),

                     ClipRRect(
                       borderRadius: BorderRadius.circular(25),
                       child: Container(
                                height: media.width * 0.4,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: TColor.primaryColor1.withOpacity(0.3),
                                   borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20
                                          ) ,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Heart Rate" , 
                                                style: TextStyle(
                                                  color: TColor.white, 
                                                  fontSize: 16, 
                                                  fontWeight: FontWeight.w700),
                                                ), 
                       
                                                ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds){
                                 return LinearGradient(
                                   colors: TColor.tertiaryG,
                                   begin: Alignment.centerLeft,
                                   end: Alignment.centerRight)
                                   .createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                                },
                                  child:
                              
                                    Text("78 BPM" ,
                                            style: TextStyle(
                                              color: TColor.white.withOpacity(0.7),
                                               fontWeight: FontWeight.w700,
                                               fontSize: 16),
                                                ),
                                                ),
                                            ],
                                            ),
                                            ),
                       
                                            LineChart(
                                   LineChartData(
                                     showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                                       return ShowingTooltipIndicators([
                                         LineBarSpot(
                                           tooltipsOnBar,
                                           lineBarsData.indexOf(tooltipsOnBar),
                                           tooltipsOnBar.spots[index],
                                         ),
                                       ]);
                                     }).toList(),
                                     lineTouchData: LineTouchData(
                                       enabled: true,
                                       handleBuiltInTouches: false,
                                       touchCallback:
                                           (FlTouchEvent event, LineTouchResponse? response) {
                                         if (response == null || response.lineBarSpots == null) {
                                           return;
                                         }
                                         if (event is FlTapUpEvent) {
                                           final spotIndex = 
                                           response.lineBarSpots!.first.spotIndex;
                                           showingTooltipOnSpots.clear();
                                           setState(() {
                        
                          showingTooltipOnSpots.add(spotIndex);
                        
                                           });
                                         }
                                       },
                                       mouseCursorResolver:
                                           (FlTouchEvent event, LineTouchResponse? response) {
                                         if (response == null || response.lineBarSpots == null) {
                                           return SystemMouseCursors.basic;
                                         }
                                         return SystemMouseCursors.click;
                                       },
                                       getTouchedSpotIndicator:
                                           (LineChartBarData barData, List<int> spotIndexes) {
                                         return spotIndexes.map((index) {
                                           return TouchedSpotIndicatorData(
                         FlLine(
                          color: Colors.transparent,
                        ),
                        FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                            radius: 3,
                            color: Colors.white,
                            strokeWidth: 3,
                            strokeColor: TColor.tertiaryColor1,
                          ),
                        ),
                                           );
                                         }).toList();
                                       },
                                       touchTooltipData: LineTouchTooltipData(
                                         getTooltipColor: (touchedSpot) => const Color.fromARGB(255, 219, 41, 100),
                                         tooltipRoundedRadius: 8,
                                         getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                                           return lineBarsSpot.map((lineBarSpot) {
                        return LineTooltipItem(
                          "${lineBarSpot.x.toInt()} mins ago",
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                                           }).toList();
                                         },
                                       ),
                                     ),
                                     lineBarsData: lineBarsData,
                                     minY: 0,
                                     maxY: 120,
                                     titlesData: FlTitlesData(
                                       show: false,
                                      
                                       
                                     ),
                                     gridData:  FlGridData(show: false),
                                     borderData: FlBorderData(
                                       show: true,
                                       border: Border.all(
                                         color: Colors.transparent,
                                       ),
                                     ),
                                   ),
                                 )
                            
                                      ],
                                    ),
                                    
                       ),
                     ),
                    
                     SizedBox(
                    height: media.width * 0.02, 
                    ),

                    Row(children: [

                      Expanded(
                        child: Container(
                          height: media.width * 0.95,
                          padding: const EdgeInsets.symmetric(vertical:25, horizontal: 20),
                          decoration: BoxDecoration(color: TColor.black, borderRadius: BorderRadius.circular(25), boxShadow: const[
                            BoxShadow(color: Colors.grey, blurRadius: 2)
                          ]),

                          child: Row(children: [

                            SimpleAnimationProgressBar(
              height: media.width * 0.85,
              width: media.width * 0.07,
              backgroundColor: Colors.grey.shade100,
              foregrondColor: Colors.purple,
              ratio: 0.5,
              direction: Axis.vertical,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(seconds: 3),
              borderRadius: BorderRadius.circular(15),
              gradientColor:  LinearGradient(
                  colors: TColor.primaryG,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),

                    const SizedBox(width: 15,),
                     Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                                              Text("Water Intake" , 
                                                style: TextStyle(
                                                  color: TColor.white, 
                                                  fontSize: 14, 
                                                  fontWeight: FontWeight.w700),
                                                ), 
                       
                                                ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds){
                                 return LinearGradient(
                                   colors: TColor.fourthG,
                                   begin: Alignment.centerLeft,
                                   end: Alignment.centerRight)
                                   .createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                                },
                                  child:
                              
                                    Text("4 Liters",  
                                            style: TextStyle(
                                              color: TColor.white.withOpacity(1),
                                               fontWeight: FontWeight.w700,
                                               fontSize: 14),
                                                ),
                                                ),
                                                 const SizedBox(height: 10,),

                                                 Text("Real time updates" , 
                                                style: TextStyle(
                                                  color: TColor.lightGrey, 
                                                  fontSize: 14, 
                                                  ),
                                                ), 

                                                Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: waterArr.map((wObj) {
                                                    var isLast = wObj == waterArr.last;
                                                       
                                                  return Row(
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          margin:const EdgeInsets.symmetric(vertical: 4),
                                                          width: 10, 
                                                          height: 10, 
                                                          decoration: BoxDecoration
                                                        (color:TColor.primaryColor2.withOpacity(0.8), borderRadius: BorderRadius.circular(5)),),
                                                             
                                                             if(!isLast)
                                                          DottedDashedLine(
                                                            height: media.width * 0.08, 
                                                            width: 0, 
                                                            dashColor: Colors.red.withOpacity(0.8),
                                                            axis: Axis.vertical)

                                                      ],
                                                      ),
                                                        const SizedBox(width: 3.3,),

                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                       Text(wObj["title"].toString() , 
                                                style: TextStyle(
                                                  color: TColor.lightGrey, 
                                                  fontSize: 14, 
                                                  ),
                                                ),
                                                 ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds){
                                 return LinearGradient(
                                   colors: TColor.primaryG,
                                   begin: Alignment.centerLeft,
                                   end: Alignment.centerRight)
                                   .createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                                },
                                  child:
                              
                                    Text(wObj["subtitle"].toString() , 
                                            style: TextStyle(
                                              color: TColor.white.withOpacity(1),
                                               fontWeight: FontWeight.w700,
                                               fontSize: 13),
                                                ),
                                                ), 
                                                    ],)
                                                  ],
                                                  );
                                                } ).toList(),)
                                            ],
                                            ),
                     )
                          ],),
                        ),
                      ),

                      SizedBox(width: media.width * 0.05 ,),

                       Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                         Container(
                          width: double.maxFinite,
                          height: media.width * 0.45,
                          padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20
                          ),
                          decoration: BoxDecoration(color: TColor.black, borderRadius: BorderRadius.circular(25), boxShadow: const[
                            BoxShadow(color: Colors.grey, blurRadius: 2)
                          ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sleep" , 
                                                style: TextStyle(
                                                  color: TColor.white, 
                                                  fontSize: 16, 
                                                  fontWeight: FontWeight.w700),
                                                ), 
                       
                                                ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds){
                                 return LinearGradient(
                                   colors: TColor.fourthG,
                                   begin: Alignment.centerLeft,
                                   end: Alignment.centerRight)
                                   .createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                                },
                                  child:
                              
                                    Text("8hrs 20mins" ,
                                            style: TextStyle(
                                              color: TColor.white.withOpacity(1),
                                               fontWeight: FontWeight.w700,
                                               fontSize: 14),
                                                ),
                                                ),
                                                 SizedBox(height: media.width * 0.05 ,),
                                                Expanded(
                                                child:Image.asset(
                                                  "assets/img/sleep_graph.png",
                                                  fit:BoxFit.fitWidth,
                                                  width: double.maxFinite,
                                                   
                                                ),),
                            ],
                          ),
                        ),

                         SizedBox(height: media.width * 0.05 ,),

                          Container(
                          width: double.maxFinite,
                          height: media.width * 0.45,
                          padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20
                          ),
                          decoration: BoxDecoration(color: TColor.black, borderRadius: BorderRadius.circular(25), boxShadow: const[
                            BoxShadow(color: Colors.grey, blurRadius: 2)
                          ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Calories" , 
                                                style: TextStyle(
                                                  color: TColor.white, 
                                                  fontSize: 16, 
                                                  fontWeight: FontWeight.w700),
                                                ), 
                       
                                                ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds){
                                 return LinearGradient(
                                   colors: TColor.fourthG,
                                   begin: Alignment.centerLeft,
                                   end: Alignment.centerRight)
                                   .createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                                },
                                  child:
                              
                                    Text("1100 kCal" ,
                                            style: TextStyle(
                                              color: TColor.white.withOpacity(1),
                                               fontWeight: FontWeight.w700,
                                               fontSize: 14),
                                                ),
                                                ),
                                                  
                                                  const Spacer(),

                                                Container(
                                                  
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width: media.width * 0.2,
                                                    height: media.width * 0.2,
                                                    child: Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                           
                                                           Container(
                                                            width: media.width * 0.15,
                                                            height: media.width * 0.15,
                                                            alignment: Alignment.center,
                                                           decoration: BoxDecoration(gradient: LinearGradient(colors: TColor.primaryG),
                                                           borderRadius: BorderRadius.circular(media.width * 0.075)),

                                                           child:  FittedBox(
                                                             child: Text("100 kCal\nleft" ,
                                                             textAlign: TextAlign.center,
                                                                     style: TextStyle(
                                                                     color: TColor.white,
                                                                    
                                                                    fontSize: 11),
                                                                                                             ),
                                                           ), 
                                                           ),

                                                        SimpleCircularProgressBar(
                                                         progressStrokeWidth: 10,
                                                         backStrokeWidth: 10,
                                                         progressColors: TColor.primaryG,
                                                         backColor: Colors.grey.shade900,
                                                         valueNotifier: ValueNotifier(50),
                                                         startAngle: -180,
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                            ],
                          ),
                        ),
                        ],)
                      )
                    ]),
                     
                     SizedBox(
                    height: media.width * 0.1, 
                    ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Workout Progress" , 
                                   style: TextStyle(
                                   color: TColor.white, 
                                       fontSize: 16, 
                                      fontWeight: FontWeight.w700),
                  ),
                               
                                Container(
                                    height: 35,
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: TColor.primaryG),
                                 borderRadius: BorderRadius.circular(15),
                                  ),
                                  child:  DropdownButtonHideUnderline(
                        
                        child: DropdownButton<String>(
                          dropdownColor: TColor.black,
                          value: _selectedDay, //Set the value
                          
                          items: ["Weekly", "Monthly"]
                          .map((name) => DropdownMenuItem(
                            value: name,
                            child: Text(
                                       name,
                                      style: TextStyle(
                                        color: TColor.white, 
                                        fontSize: 16,
                                         
                                        
                                      
                                    ), 
                                    ), 
                                    ))
                                    .toList() , 
                                    onChanged: (value){
                                      setState(() {
                                        _selectedDay = value; // Update the selected gender
                                      });
                                    },
                                   
                                
                                    hint: Text(
                                       "Weekly",
                                      style: TextStyle(
                                        color: TColor.white, 
                                        fontSize: 13,
                                       
                                        
                                      
                                    ), 
                                    ) ,
                                    icon: Icon(
                                    Icons.arrow_drop_down, // Custom icon
                                             color: Colors.white, // Set the icon color here
                                    ),
                      ),
                                ),),

                      ],),

                      SizedBox(
                    height: media.width * 0.1, 
                    ),

                      
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                                height: media.width * 0.4,
                                width: double.maxFinite,
                               
                                    child: 
                                            LineChart(
                                   LineChartData(
                                     showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                                       return ShowingTooltipIndicators([
                                         LineBarSpot(
                                           tooltipsOnBar,
                                           lineBarsData.indexOf(tooltipsOnBar),
                                           tooltipsOnBar.spots[index],
                                         ),
                                       ]);
                                     }).toList(),
                                     lineTouchData: LineTouchData(
                                       enabled: true,
                                       handleBuiltInTouches: false,
                                       touchCallback:
                                           (FlTouchEvent event, LineTouchResponse? response) {
                                         if (response == null || response.lineBarSpots == null) {
                                           return;
                                         }
                                         if (event is FlTapUpEvent) {
                                           final spotIndex = 
                                           response.lineBarSpots!.first.spotIndex;
                                           showingTooltipOnSpots.clear();
                                           setState(() {
                        
                          showingTooltipOnSpots.add(spotIndex);
                        
                                           });
                                         }
                                       },
                                       mouseCursorResolver:
                                           (FlTouchEvent event, LineTouchResponse? response) {
                                         if (response == null || response.lineBarSpots == null) {
                                           return SystemMouseCursors.basic;
                                         }
                                         return SystemMouseCursors.click;
                                       },
                                       getTouchedSpotIndicator:
                                           (LineChartBarData barData, List<int> spotIndexes) {
                                         return spotIndexes.map((index) {
                                           return TouchedSpotIndicatorData(
                         FlLine(
                          color: Colors.transparent,
                        ),
                        FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                            radius: 3,
                            color: Colors.white,
                            strokeWidth: 3,
                            strokeColor: TColor.tertiaryColor1,
                          ),
                        ),
                                           );
                                         }).toList();
                                       },
                                       touchTooltipData: LineTouchTooltipData(
                                         getTooltipColor: (touchedSpot) => const Color.fromARGB(255, 219, 41, 100),
                                         tooltipRoundedRadius: 8,
                                         getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                                           return lineBarsSpot.map((lineBarSpot) {
                        return LineTooltipItem(
                          "${lineBarSpot.x.toInt()} mins ago",
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                                           }).toList();
                                         },
                                       ),
                                     ),
                                     lineBarsData: lineBarsData1,
                                     minY: -0.5,
                                     maxY: 110,
                                     titlesData: FlTitlesData(
                                       show: true,
                                       leftTitles: AxisTitles(),
                                       topTitles: AxisTitles(),
                                       bottomTitles: AxisTitles(
                                        sideTitles: bottomTitles,
                                       ),
                                      rightTitles: AxisTitles(
                                        sideTitles: rightTitles,
                                       ),
                                      
                                      
                                       
                                     ),
                                     gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        horizontalInterval: 25,
        drawVerticalLine: false,
       
        getDrawingHorizontalLine: (value) {
          return  FlLine(
            color: TColor.grey,
            strokeWidth: 2,
          );
        },
      ),
                                     
                                     borderData: FlBorderData(
                                       show: true,
                                       border: Border.all(
                                         color: Colors.transparent,
                                       ),
                                     ),
                                   ),
                                 )
                            
                                      
                                    
                       ),

                        SizedBox(
                    height: media.width * 0.05, 
                    ),

                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Latest Workout" , 
                                   style: TextStyle(
                                   color: TColor.white, 
                                       fontSize: 16, 
                                      fontWeight: FontWeight.w700),
                  ),
                               
                                TextButton(onPressed: (){}, child: Text("See More" , 
                                   style: TextStyle(
                                   color: TColor.white, 
                                       fontSize: 15, 
                                       fontWeight: FontWeight.w700,
                                     ),
                  ),)

                      ],),
                      
                      

                    ListView.builder(
                      padding:  EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lastWorkoutArr.length,
                      itemBuilder: (context, index){
                        var wObj = lastWorkoutArr[index] as Map? ?? {};
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FinishedWorkoutView(), ),);
                        },
                        child: WorkoutRow(wObj: wObj)); 
                    }),

                    SizedBox(
                    height: media.width * 0.1, 
                    ),

                                         
                    ],
                    ),
            ),
          ),
        ),
      );

    
  }

   List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        
        var color0 = TColor.secondaryColor1;
        

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value: 33,
              title: '',
              radius: 55,
              titlePositionPercentageOffset: 0.55,
              badgeWidget: Text("20,1", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),)
             
            );
          case 1:
            return PieChartSectionData(
              color: Colors.white,
              value: 75,
              title: '',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
             
            );
          
          default:
            throw Error();
        }
      },
    );
  }

    LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) =>
              Colors.blueGrey.withValues(alpha: 0.8),
        ),
      );

       List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        
      ];


       LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          TColor.primaryColor2.withOpacity(0.5),
          TColor.primaryColor1.withOpacity(0.5)]),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData:   FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),

          //  FlSpot(1, 50),
          // FlSpot(2, 50),
          // FlSpot(3, 50),
          // FlSpot(4, 50),
          // FlSpot(5, 50),
          // FlSpot(6, 50),
          // FlSpot(7, 50),
        ],
      );

      LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.white,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData:   FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          
        ),
        spots: const [
          FlSpot(1, 80),
          FlSpot(2, 50),
          FlSpot(3, 90),
          FlSpot(4, 40),
          FlSpot(5, 80),
          FlSpot(6, 35),
          FlSpot(7, 60),

          //  FlSpot(1, 50),
          // FlSpot(2, 50),
          // FlSpot(3, 50),
          // FlSpot(4, 50),
          // FlSpot(5, 50),
          // FlSpot(6, 50),
          // FlSpot(7, 50),
        ],
      );

        SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: TColor.grey,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: TColor.grey,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: text,
    );
  }
}