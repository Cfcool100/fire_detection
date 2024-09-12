import 'package:flutter/material.dart';

Switch customSwitch({void Function(bool)? onChanged, required bool value}) {
  return Switch(
    activeColor: const Color(0xff1171D8),
    trackOutlineWidth: const WidgetStatePropertyAll(0),
    inactiveThumbColor: Colors.white,
    activeTrackColor: Colors.white,
    thumbColor: const WidgetStatePropertyAll(const Color(0xFF67F7B1)),
    trackColor: WidgetStatePropertyAll(Colors.grey.shade200),
    inactiveTrackColor: Colors.white,
    value: value,
    onChanged: onChanged,
  );
}
