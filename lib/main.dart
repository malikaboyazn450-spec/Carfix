import 'package:flutter/material.dart';

void main() {
  runApp(const CarfixProApp());
}

class CarfixProApp extends StatelessWidget {
  const CarfixProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carfix Pro Expert',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Cairo',
      ),
      home: const MainDashboardScreen(),
    );
  }
}

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext classContext) {
    final Color primaryColor = Colors.blueGrey[900]!;
    final Color accentColor = Colors.blue[700]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carfix Pro - نظام التشخيص الفني',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: accentColor,
            child: const Text(
              'المرجع المتخصص للتشخيص وبرمجة السيارات',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.25,
                children: [
                  _buildMenuCard(
                    classContext, 
                    'أكواد الأعطال (DTC)', 
                    Icons.bug_report, 
                    Colors.red[800]!, 
                    const DtcScreen()
                  ),
                  _buildMenuCard(
                    classContext, 
                    'المخططات الكهربائية', 
                    Icons.flash_on, 
                    Colors.amber[800]!, 
                    const WiringScreen()
                  ),
                  _buildMenuCard(
                    classContext, 
                    'أدوات التشخيص والبرمجة', 
                    Icons.build_circle, 
                    Colors.indigo[800]!, 
                    const ToolsScreen()
                  ),
                  _buildMenuCard(
                    classContext, 
                    'دليل الحساسات والكنترول', 
                    Icons.settings_input_component, 
                    Colors.teal[800]!, 
                    const SensorsScreen()
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            color: primaryColor,
            child: const Text(
              'Carfix Pro © 2026 - نظام احترافي للورش',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, Widget targetScreen) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.05), color.withOpacity(0.15)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 45, color: color),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= 1. شاشة أكواد الأعطال =================
class DtcScreen extends StatelessWidget {
  const DtcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dtcList = [
      {'code': 'P0300', 'title': 'تشخيص تقطيع عشوائي في الاسطوانات (Random Misfire)', 'fix': 'فحص شمعات الاحتراق (البواجي)، الكอยلات، وضغط الوقود.'},
      {'code': 'P0171', 'title': 'خليط وقود فقير في البنك 1 (System Too Lean)', 'fix': 'فحص تسرب الهواء في مانع التنفيس، حساس الهواء (MAF)، وضغط طرمبة البنزين.'},
      {'code': 'P0420', 'title': 'كفاءة دبات التلوث أقل من الحد الأدنى', 'fix': 'فحص تسرب الشكمان أو تلف دبة الرصاص أو حساسات الأكسجين الخلفية.'},
      {'code': 'P0135', 'title': 'عطل في دائرة سخان حساس الأكسجين (Bank 1 Sensor 1)', 'fix': 'فحص الفيوزات والأسلاك الواصلة للحساس أو استبدال الحساس.'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('أكواد الأعطال الشائعة (DTC)'), backgroundColor: Colors.red[800]),
      body: ListView.builder(
        itemCount: dtcList.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red[800],
                child: Text(dtcList[index]['code']!.substring(1, 3), style: const TextStyle(color: Colors.white, fontSize: 12)),
              ),
              title: Text('${dtcList[index]['code']} - ${dtcList[index]['title']}', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text('طريقة الحل والفحص: ${dtcList[index]['fix']}'),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ================= 2. شاشة المخططات الكهربائية =================
class WiringScreen extends StatelessWidget {
  const WiringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المخططات الكهربائية والأسلاك'), backgroundColor: Colors.amber[800]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        key: const Key('wiring_body'),
        child: ListView(
          children: const [
            Card(
              child: ListTile(
                leading: Icon(Icons.electric_bolt, color: Colors.amber),
                title: Text('دليل ألوان الأسلاك في ضفيرة السيارة'),
                subtitle: Text('الأحمر: موجب بطارية مباشر (B+)\nالأصفر: موجب بعد السويتش (IGN)\nالأسود/البني: خط أرضي سالب (Ground)\nالأزرق/الأخضر: خطوط إشارات الحساسات (Signals)'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: Icon(Icons.settings_ethernet, color: Colors.blue),
                title: Text('فحص شبكة الكان بس (CAN-Bus)'),
                subtitle: Text('قیاس المقاومة بين CAN-High و CAN-Low يجب أن تظهر تقريباً 60 أوم والبطارية مفصولة.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= 3. شاشة أدوات التشخيص والبرمجة =================
class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أدوات التشخيص وبرمجة الأجهزة'), backgroundColor: Colors.indigo[800]),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.computer, color: Colors.indigo),
              title: Text('جهاز فحص Launch X-431'),
              subtitle: Text('استخدام الجهاز في عمل Reset لزيت المحرك، معايرة حساس الزاوية (SAS)، وبرمجة البوابات (Throttle Body Reset).'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.phone_android, color: Colors.green),
              title: Text('تطبيقات المخططات (مثل Carmin)'),
              subtitle: Text('مرجع أساسي لتتبع مسارات الفولتية وأماكن الفيوزات (Fuse Box Layout) لكل طرازات السيارات. أداة لا غنى عنها للكهربائي.'),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= 4. شاشة الحساسات والكنترول =================
class SensorsScreen extends StatelessWidget {
  const SensorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('دليل الحساسات والكنترول (ECU)'), backgroundColor: Colors.teal[800]),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.sensors, color: Colors.teal),
              title: Text('حساس كرنك المحرك (CKP Sensor)'),
              subtitle: Text('المسؤول عن توقيت الإشعال والبنزين. عطله يسبب قطع شرارة البواجي وعدم عمل طرمبة الوقود وتوقف السيارة عن العمل تماماً.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.thermostat, color: Colors.orange),
              title: Text('حساس حرارة الماكينة (ECT Sensor)'),
              subtitle: Text('يغذي كمبيوتر السيارة بدرجة حرارة الـ مبرد. عطله يسبب صعوبة التشغيل صباحاً وارتفاع استهلاك الوقود.'),
            ),
          ),
        ],
      ),
    );
  }
}
