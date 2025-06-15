import 'package:ReciTracker/main_screen.dart';
import 'package:ReciTracker/model/delivery_entry.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DeliveryEntryAdapter());
  await Hive.openBox<DeliveryEntry>('deliveries');
  runApp(const ReciclajeApp());
}