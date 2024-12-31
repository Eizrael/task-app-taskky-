// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/providers/completed_providers.dart';

class CompletedBox extends ConsumerWidget {
  final String label;
  final int taskIndex;
  const CompletedBox({
    Key? key,
    required this.label,
    required this.taskIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 18,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black, 
                  decorationThickness: 2.0,
                )
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFF3333),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: IconButton(
                  onPressed: () {
                    ref.read(completedListProvider.notifier).removeCompletedTask(taskIndex);
                  },
                  icon: Icon(CupertinoIcons.trash, color: Colors.white,)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
