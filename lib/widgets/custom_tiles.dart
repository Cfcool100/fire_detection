import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({
    super.key,
    required this.icon,
    required this.title,
    required this.bgColor,
    required this.route,
    this.count,
  });

  final dynamic icon;
  final String title;
  final Color bgColor;
  final int? count;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(route),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon.runtimeType == IconData)
                CircleAvatar(
                  radius: 40,
                  backgroundColor: bgColor,
                  child: Icon(
                    icon,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
              if (icon.runtimeType == String)
                Container(
                  height: 85,
                  width: 85,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: bgColor,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      icon,
                      // color: Colors.white,
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1171D8),
                ),
              ),
              if (count != null)
                Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1171D8),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.description,
    this.image,
    this.tileFilled = false,
    this.icon,
    this.onLongPress,
  }) : assert(icon == null || image == null);

  final String title;
  final String description;
  final String? image;
  final bool tileFilled;
  final IconData? icon;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: ListTile(
        tileColor: tileFilled ? const Color(0xff1171D8) : null,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: tileFilled ? Colors.black : const Color(0xff1171D8),
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        contentPadding: EdgeInsets.zero,
        textColor: Colors.black,
        horizontalTitleGap: 5,
        // minTileHeight: 60,
        dense: true,
        leading: SizedBox(
          height: 200,
          width: 60,
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            decoration: ShapeDecoration(
              color: icon != null ? Colors.red : const Color(0xff1171D8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              image: image == null
                  ? null
                  : DecorationImage(
                      image: AssetImage('$image'),
                      fit: BoxFit.fill,
                    ),
            ),
            child: image != null
                ? null
                : Icon(
                    icon ?? CupertinoIcons.person_fill,
                    color: icon != null ? Colors.white : Colors.white,
                    size: 32,
                  ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: tileFilled ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: tileFilled ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
