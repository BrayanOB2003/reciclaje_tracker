import 'package:ReciTracker/model/delivery_entry.dart';
import 'package:ReciTracker/screens/calculator_screen/calculator_screen.dart';
import 'package:ReciTracker/screens/tracking_screen/tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;
  void _goToTrackingTab() {
    setState(() {
      _selectedIndex = 1; // Suponiendo que el tab 1 es tracking
    });
  }
  @override
  void initState() {
    super.initState();
    _pages = [
      CalculatorScreen(onGoToTracking: _goToTrackingTab,),
      ValueListenableBuilder<Box<DeliveryEntry>>(
        valueListenable: Hive.box<DeliveryEntry>('deliveries').listenable(),
        builder: (context, box, _) {
          final deliveries = box.values.toList().cast<DeliveryEntry>();
          return TrackingScreen(deliveries: deliveries);
        },
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'Calculadora',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu_outlined),
            label: 'Tracking',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}