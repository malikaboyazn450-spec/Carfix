import 'package:flutter/material.dart';

void main() {
  runApp(const CarfixProEngineersApp());
}

class CarfixProEngineersApp extends StatelessWidget {
  const CarfixProEngineersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carfix Pro - Professional Diagnostic System',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF121212), // تصميم داكن احترافي للورش
        fontFamily: 'Cairo',
      ),
      home: const ProfessionalDashboard(),
    );
  }
}

class ProfessionalDashboard extends StatelessWidget {
  const ProfessionalDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carfix Pro - النظام المهني للتشخيص',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 2,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            color: const Color(0xFF2C2C2C),
            child: const Text(
              'مرجع فحص المركبات والشاحنات (بنزين - ديزل - هايبرد - كهرباء | 12V & 24V)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.25,
                children: [
                  _buildSectionCard(
                    context, 
                    'سجل المركبات والموديلات', 
                    Icons.directions_car, 
                    Colors.blue[700]!, 
                    const VehicleDatabaseScreen()
                  ),
                  _buildSectionCard(
                    context, 
                    'أكواد الأعطال (DTC Database)', 
                    Icons.bug_report, 
                    Colors.red[700]!, 
                    const DtcDatabaseScreen()
                  ),
                  _buildSectionCard(
                    context, 
                    'المخططات الكهربائية والأسلاك', 
                    Icons.electric_bolt, 
                    Colors.amber[700]!, 
                    const WiringDiagramsScreen()
                  ),
                  _buildSectionCard(
                    context, 
                    'أدوات الفحص والبرمجة', 
                    Icons.computer, 
                    Colors.indigo[700]!, 
                    const ProgrammingToolsScreen()
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            color: const Color(0xFF1F1F1F),
            child: const Text(
              'Carfix Pro © 2026 - نظام ورش العمل الاحترافي',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, String title, IconData icon, Color color, Widget targetScreen) {
    return Card(
      color: const Color(0xFF1E1E1E),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withOpacity(0.5), width: 1),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 38, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= 1. شاشة سجل المركبات والموديلات الشاملة =================
class VehicleDatabaseScreen extends StatefulWidget {
  const VehicleDatabaseScreen({super.key});

  @override
  State<VehicleDatabaseScreen> createState() => _VehicleDatabaseScreenState();
}

class _VehicleDatabaseScreenState extends State<VehicleDatabaseScreen> {
  final List<Map<String, String>> vehicles = [
    {'name': 'تويوتا لاندكروزر', 'year': '2026', 'origin': 'اليابان', 'type': 'بنزين', 'volt': '12 فولت'},
    {'name': 'مرسيدس أكتروس', 'year': '2025', 'origin': 'ألمانيا', 'type': 'ديزل (شاحنة ثقيلة)', 'volt': '24 فولت'},
    {'name': 'تويوتا بريوس', 'year': '2024', 'origin': 'اليابان', 'type': 'هايبرد (Hybrid)', 'volt': '12 فولت'},
    {'name': 'تسلا موديل Y', 'year': '2026', 'origin': 'الولايات المتحدة', 'type': 'كهرباء بالكامل (EV)', 'volt': '12 فولت'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('قاعدة بيانات المركبات والموديلات', style: TextStyle(fontSize: 15, color: Colors.white)),
        backgroundColor: const Color(0xFF1F1F1F),
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final v = vehicles[index];
          return Card(
            color: const Color(0xFF1E1E1E),
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: const Icon(Icons.directions_car, color: Colors.blueAccent),
              title: Text('${v['name']} - موديل ${v['year']}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text('بلد الصنع: ${v['origin']} | المحرك: ${v['type']} | النظام: ${v['volt']}', style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ),
          );
        },
      ),
    );
  }
}

// ================= 2. شاشة أكواد الأعطال المهنية =================
class DtcDatabaseScreen extends StatelessWidget {
  const DtcDatabaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dtcList = [
      {'code': 'P0300', 'system': 'محرك (بنزين/ديزل)', 'desc': 'تقطيع عشوائي واحتراق غير منتظم في الأسطوانات.'},
      {'code': 'P0A80', 'system': 'نظام الهايبرد (Hybrid)', 'desc': 'تدهور واختلاف في جهد خلايا بطارية الهايبرد الرئيسية.'},
      {'code': 'P2282', 'system': 'نظام الحقن (ديزل 24V)', 'desc': 'عطل في ضغط الهواء وخط الوقود العالي (Common Rail).'},
      {'code': 'U0100', 'system': 'شبكة الكان بس (CAN-Bus)', 'desc': 'فقدان الاتصال بالكامل مع وحدة التحكم الإليكترونية (ECU).'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('أكواد الأعطال والتشخيص (DTC)', style: TextStyle(fontSize: 15, color: Colors.white)),
        backgroundColor: const Color(0xFF1F1F1F),
      ),
      body: ListView.builder(
        itemCount: dtcList.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final item = dtcList[index];
          return Card(
            color: const Color(0xFF1E1E1E),
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red[900],
                child: Text(item['code']!.substring(0, 1), style: const TextStyle(color: Colors.white)),
              ),
              title: Text('${item['code']} - ${item['system']}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text(item['desc']!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ),
          );
        },
      ),
    );
  }
}

// ================= 3. شاشة المخططات الكهربائية =================
class WiringDiagramsScreen extends StatelessWidget {
  const WiringDiagramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('المخططات الكهربائية والدوائر', style: TextStyle(fontSize: 15, color: Colors.white)),
        backgroundColor: const Color(0xFF1F1F1F),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          Card(
            color: Color(0xFF1E1E1E),
            child: ListTile(
              leading: Icon(Icons.bolt, color: Colors.amber),
              title: Text('أنظمة الجهد الكهربائي (12V & 24V)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text('• نظام 12 فولت: السيارات الصغيرة، الهايبرد، والمركبات الكهربائية.\n• نظام 24 فولت: الشاحنات الثقيلة ومعدات الديزل (بطاريتين على التوالي).', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ),
          ),
          Card(
            color: Color(0xFF1E1E1E),
            child: ListTile(
              leading: Icon(Icons.settings_ethernet, color: Colors.blueAccent),
              title: Text('فحص شبكات الاتصال (CAN-High / CAN-Low)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text('المقاومة الطبيعية للشبكة والبطارية مفصولة يجب أن تساوي تقريباً 60 أوم.', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= 4. شاشة أدوات الفحص والبرمجة =================
class ProgrammingToolsScreen extends StatelessWidget {
  const ProgrammingToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('أدوات الفحص وأجهزة البرمجة', style: TextStyle(fontSize: 15, color: Colors.white)),
        backgroundColor: const Color(0xFF1F1F1F),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          Card(
            color: Color(0xFF1E1E1E),
            child: ListTile(
              leading: Icon(Icons.computer, color: Colors.indigoAccent),
              title: Text('أجهزة الفحص الشاملة (مثل Launch / Autel)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text('تنفيذ عمليات إعادة التعيين (Reset)، برمجة البوابات، ومعايرة زاوية الإكسسوارات وحساسات الكرنك.', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}
