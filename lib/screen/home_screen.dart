import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('DDay App'),
            backgroundColor: Colors.black,
          ),
          body: Container(
            color: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _DDay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DDay extends StatefulWidget {
  _DDay({super.key});

  @override
  State<_DDay> createState() => __DDayState();
}

class __DDayState extends State<_DDay> {
  DateTime now = DateTime.now();
  int days = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
              ),
              hintText: 'DDay를 설정할 주제를 입력하세요',
            ),
          ),
          SizedBox(height: 30,),
          IconButton(
            onPressed: () {
              showCupertinoDialog(
                context: context, 
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      height: 300,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime date) {
                          setState(() {
                            days = DateTime(date.year,date.month,date.day).difference(now).inDays+1;
                          });
                        },
                      ),
                    ),
                  );
                },
                barrierDismissible: true,
              );
            },
            icon: Icon(
              Icons.settings,
            ),
          ),
          SizedBox(height: 30,),
          Text('D-${days}',style: TextStyle(fontSize: 50),),
          SizedBox(height: 50,),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: '톱니바퀴 모양을 누르면 날짜를 선택할 수 있습니다.\n이곳엔 추가로 필요한 메모를 작성하세요.'),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            
          ),
        ],
      ),
    );
  }
}
