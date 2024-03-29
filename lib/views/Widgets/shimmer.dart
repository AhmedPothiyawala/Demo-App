import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
                20, // Generate 5 Text widgets
                (index) => Center(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 30,
                          ),
                          title: Container(
                            height: 60,
                            width: 250,
                            color: Colors.grey[300],
                          ),
                          trailing: Icon(Icons.arrow_forward,
                              color: Colors.grey[300]),
                        ),
                      ),
                    ))));
  }
}
