import 'package:flutter/material.dart';

class RegionDropdown extends StatelessWidget {
  final List<String> regions;
  final String region;
  final Function(String) onChanged;

  const RegionDropdown({
    @required this.regions,
    @required this.region,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: region,
          items: regions
              .map((e) => DropdownMenuItem(
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 8.0),
                        Text(
                          e,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
