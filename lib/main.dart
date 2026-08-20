import 'package:flutter/material.dart';

void main() {
  runApp(const CarfixProCloudApp());
}

class CarfixProCloudApp extends StatelessWidget {
  const CarfixProCloudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: 'Cairo'),
      home: const CloudSearchDashboard(),
    );
  }
}

class CloudSearchDashboard extends StatefulWidget {
  const CloudSearchDashboard({super.key});

  @override
  State<CloudSearchDashboard> createState() => _CloudSearchDashboardState();
}

class _CloudSearchDashboardState extends State<CloudSearchDashboard> {
  // قائمة المركبات المسجلة
  final List<Map<String, String>> vehicleRegistry = [
    {'name': 'تويوتا لاندكروزر', 'year': '2025', 'origin': 'اليابان', 'fuel': 'ديزل', 'volt': '12 فولت'},
  ];

  void _addNewVehicle() {
    showDialog(
      context: context,
      builder: (context) {
        final nameCtrl = TextEditingController();
        final yearCtrl = TextEditingController();
        final originCtrl = TextEditingController();
        return AlertDialog(
          title: const Text('تسجيل مركبة جديدة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'اسم السيارة')),
              TextField(controller: yearCtrl, decoration: const InputDecoration(labelText: 'سنة الصنع')),
              TextField(controller: originCtrl, decoration: const InputDecoration(labelText: 'بلد الصنع')),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  vehicleRegistry.add({
                    'name': nameCtrl.text,
                    'year': yearCtrl.text,
                    'origin': originCtrl.text,
                    'fuel': 'غير محدد',
                    'volt': '12 فولت'
                  });
                });
                Navigator.pop(context);
              },
              child: const Text('حفظ'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carfix Pro - نظام تسجيل وفحص المركبات'), backgroundColor: Colors.blueGrey[900]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: _addNewVehicle,
              icon: const Icon(Icons.add),
              label: const Text('إضافة مركبة جديدة لقاعدة البيانات'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700], foregroundColor: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vehicleRegistry.length,
              itemBuilder: (context, index) {
                final v = vehicleRegistry[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text('${v['name']} (${v['year']})', style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('بلد الصنع: ${v['origin']} | الوقود: ${v['fuel']} | النظام: ${v['volt']}'),
                    leading: const Icon(Icons.directions_car, color: Colors.blueGrey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
