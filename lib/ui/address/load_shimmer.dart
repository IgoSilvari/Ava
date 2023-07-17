import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadShimmer extends StatelessWidget {
  const LoadShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(radius: 30),
            title: Container(
              color: Colors.blue,
              height: 20,
              width: double.infinity,
            ),
            subtitle: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                color: Colors.blue,
                height: 20,
                width: MediaQuery.sizeOf(context).width / 2,
              ),
            ),
          );
        },
      ),
    );
  }
}
