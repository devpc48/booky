import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'data/models/user.dart';
import 'data/models/local.dart';
import 'data/models/equipment.dart';
import 'data/models/equipment_type.dart';
import 'presentation/screens/home_page.dart';
import 'presentation/screens/users_screen.dart';
import 'presentation/screens/locals_screen.dart';
import 'presentation/screens/equipment_types_screen.dart';
import 'presentation/screens/equipment_screen.dart';

late Isar isar;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [
      UserSchema,
      LocalSchema,
      EquipmentSchema,
      EquipmentTypeSchema,
    ],
    directory: dir.path,
  );

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'Booky',
      debugShowCheckedModeBanner: false,
        home: HomePage(),
      routes: {
          '/users': (context) => const UsersScreen(),
          '/locals': (context) => const LocalsScreen(),
          '/equipment-types': (context) => const EquipmentTypesScreen(),
        '/equipment': (context) => const EquipmentScreen(),
      },
    );
  }
}
