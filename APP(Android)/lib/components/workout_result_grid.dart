import 'package:flutter/material.dart';
import 'package:mypt/models/workout_result.dart';
import 'package:mypt/screens/analysis/workout_result_page.dart';
import 'package:mypt/screens/main_page.dart';
import 'package:mypt/utils/function_utils.dart';

class WorkoutResultGrid extends StatelessWidget {
  WorkoutResult workoutResult;
  late Color backgroundColor;
  final textStyle = const TextStyle(
      fontFamily: 'Nunito', fontWeight: FontWeight.bold, fontSize: 15);
  
  // ignore: use_key_in_widget_constructors
  WorkoutResultGrid({required this.workoutResult});

  @override
  Widget build(BuildContext context) {
    if (workoutResult.workoutName == 'push_up'){
      backgroundColor = colorList[0];
    } else if (workoutResult.workoutName == 'pull_up'){
      backgroundColor = colorList[1];
    } else if (workoutResult.workoutName == 'squat'){
      backgroundColor = colorList[2];
    } else {
      backgroundColor = colorList[2];
    }
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkoutResultPage(workoutResult: workoutResult,)),
          );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 120,
        width: double.infinity,
        child: Row(
          children: [_buildWorkoutName(), const Spacer(), _buildRecord()],
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 7.0) // changes position of shadow
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutName() {
    return Text('${workoutResult.workoutName}'.toUpperCase(), style: textStyle);
  }

  Widget _buildRecord() {
    return Column(
      children: [
        Text('운동횟수 : ${workoutResult.count!}', style: textStyle),
        Text('운동점수 : ${sumInt(workoutResult.score!)}', style: textStyle),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}


