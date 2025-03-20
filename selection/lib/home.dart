import 'package:flutter/material.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, bool> filters = {
    'Work files': false,
    'Personal': false,
    'Projects': false,
    'Priority': false,
    'Reminders': false,
    'Events': false,
  };

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Types',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 4.0,
                    children:
                        filters.keys.map((String key) {
                          return Row(
                            children: [
                              Checkbox(
                                value: filters[key],
                                onChanged: (bool? value) {
                                  setModalState(() {
                                    filters[key] = value ?? false;
                                  });
                                },
                              ),
                              Text(key),
                            ],
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        List<String> selectedFilters =
                            filters.entries
                                .where((entry) => entry.value)
                                .map((entry) => entry.key)
                                .toList();
                        log('Selected Filters: $selectedFilters');
                        Navigator.pop(context);
                      },
                      child: const Text('Print'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter App')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showFilterBottomSheet(context);
          },
          child: const Text('Show Filters'),
        ),
      ),
    );
  }
}
