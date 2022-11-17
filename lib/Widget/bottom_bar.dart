import 'package:movie_apps/Constant/sizeConfig.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int? BottomNu;
  final Function? callback;
  const BottomBar({Key? key, this.BottomNu, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    final bottoms = [
      Icons.home_filled,
      Icons.search,
      Icons.person,
    ];
    return Container(
      color: Color.fromARGB(255, 41, 42, 55),
      width: SizeOfConfig.widthScreen,
      height: getHeightScreen(50),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          child: Container(
            width: (SizeOfConfig.widthScreen - 40) / 3,
            padding: EdgeInsets.symmetric(vertical: 4),
            decoration: BottomNu == index
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2.0,
                        color: Color(0xFFF09A36),
                      ),
                    ),
                  )
                : null,
            child: Icon(
              bottoms[index],
              size: 30,
              color: BottomNu == index ? Color(0xFFF09A36) : Colors.white70,
            ),
          ),
          onTap: () => callback!(index),
        ),
        separatorBuilder: (_, index) => const SizedBox(
          width: 20,
        ),
        itemCount: bottoms.length,
      ),
    );
  }
}
