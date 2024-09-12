import 'package:flutter/material.dart';

class CustomSliverSearchBar extends StatelessWidget {
  CustomSliverSearchBar({super.key, this.onChanged});

  final FocusNode _focus = FocusNode();

  final Function(String q)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      sliver: SliverToBoxAdapter(
        child: TextField(
          focusNode: _focus,
          onChanged: onChanged,
          onTapOutside: (event) => _focus.unfocus(),
          decoration: const InputDecoration(
            hintText: 'Recherche',
            hintStyle: TextStyle(fontSize: 20, color: Colors.grey, height: 1),
            constraints: BoxConstraints(maxHeight: 45),
            prefixIcon: Icon(
              Icons.search_outlined,
              color: Color(0xff1171D8),
              size: 30,
            ),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff1171D8),
              ),
            ),
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 10.0),
    );
  }
}
