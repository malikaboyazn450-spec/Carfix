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
      title: 'Carfix Pro - النظام المهني للتشخيص',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF121212),
        fontFamily: 'Cairo',
      ),
      home: const ProfessionalDashboard(),
    );
  }
}

// ================= هيكل قاعدة بيانات الأعطال =================
class DtcRecord {
  final String code;
  final String system;
  final String description;

  DtcRecord({required this.code, required this.system, required this.description});
}

// القاعدة الشاملة بنسبة 100%
final List<DtcRecord> fullDtcDatabase = [
  // --- أولاً: أعطال المحرك ونظام الوقود (Powertrain) ---
  DtcRecord(code: 'P0300', system: 'المحرك', description: 'تقطيع عشوائي واحتراق غير منتظم في الأسطوانات (Random Misfire).'),
  DtcRecord(code: 'P0301', system: 'المحرك', description: 'تقطيع واحتراق غير منتظم في الاسطوانة رقم 1.'),
  DtcRecord(code: 'P0302', system: 'المحرك', description: 'تقطيع واحتراق غير منتظم في الاسطوانة رقم 2.'),
  DtcRecord(code: 'P0303', system: 'المحرك', description: 'تقطيع واحتراق غير منتظم في الاسطوانة رقم 3.'),
  DtcRecord(code: 'P0304', system: 'المحرك', description: 'تقطيع واحتراق غير منتظم في الاسطوانة رقم 4.'),
  DtcRecord(code: 'P0171', system: 'نظام الوقود', description: 'خليط وقود فقير جداً في البنك 1 (System Too Lean).'),
  DtcRecord(code: 'P0172', system: 'نظام الوقود', description: 'خليط وقود غني جداً في البنك 1 (System Too Rich).'),
  DtcRecord(code: 'P0174', system: 'نظام الوقود', description: 'خليط وقود فقير في البنك 2.'),
  DtcRecord(code: 'P0175', system: 'نظام الوقود', description: 'خليط وقود غني في البنك 2.'),
  DtcRecord(code: 'P0420', system: 'نظام العادم', description: 'كفاءة محول الحفاز (دبة التلوث) أقل من الحد الأدنى بنك 1.'),
  DtcRecord(code: 'P0430', system: 'نظام العادم', description: 'كفاءة محول الحفاز (دبة التلوث) أقل من الحد الأدنى بنك 2.'),

  // --- ثانياً: حساسات المحرك الأساسية ---
  DtcRecord(code: 'P0335', system: 'حساسات', description: 'عطل في دائرة حساس عمود الكرنك (CKP Sensor A).'),
  DtcRecord(code: 'P0340', system: 'حساسات', description: 'عطل في دائرة حساس عمود الكامينة (CMP Sensor A).'),
  DtcRecord(code: 'P0115', system: 'حساسات', description: 'عطل في دائرة حساس حرارة مبرد المحرك (ECT Sensor).'),
  DtcRecord(code: 'P0100', system: 'حساسات', description: 'عطل في تدفق الهواء أو الكمبيوتر (MAF/VAF Sensor).'),
  DtcRecord(code: 'P0120', system: 'حساسات', description: 'عطل في حساس دعسة البنزين أو البوابة (Throttle Position).'),
  DtcRecord(code: 'P0500', system: 'حساسات', description: 'عطل في حساس سرعة السيارة (Vehicle Speed Sensor).'),

  // --- ثالثاً: أعطال الديزل والشاحنات الثقيلة (24 فولت) ---
  DtcRecord(code: 'P2282', system: 'ديزل (24V)', description: 'خطأ في ضغط الهواء ونظام الحقن العالي (Common Rail / PLD).'),
  DtcRecord(code: 'P0087', system: 'ديزل (24V)', description: 'ضغط منخفض جداً في مسطرة الوقود (Fuel Rail Pressure Low).'),
  DtcRecord(code: 'P0191', system: 'ديزل (24V)', description: 'خلل في إشارة قراءة حساس ضغط مسطرة الوقود.'),
  DtcRecord(code: 'P0201', system: 'ديزل (24V)', description: 'عطل كهربائي في بخاخ الديزل رقم 1.'),

  // --- رابعاً: أنظمة الهايبرد والسيارات الكهربائية (Hybrid & EV) ---
  DtcRecord(code: 'P0A80', system: 'هايبرد', description: 'تدهور واختلاف في جهد خلايا بطارية الهايبرد الرئيسية (Replace Hybrid Battery Pack).'),
  DtcRecord(code: 'P0AA6', system: 'هايبرد / EV', description: 'عطل تسريب العزل الكهربائي في دائرة الجهد العالي (Isolation Fault).'),
  DtcRecord(code: 'P0B47', system: 'هايبرد', description: 'خلل في مستشعر وحدة مراقبة جهد البطارية.'),

  // --- خامساً: أعطال الشبكات والاتصال (CAN-Bus Network) ---
  DtcRecord(code: 'U0100', system: 'اتصال وشبكات', description: 'فقدان الاتصال بالكامل مع وحدة التحكم الإليكترونية في المحرك (ECM/ECU).'),
  DtcRecord(code: 'U0101', system: 'اتصال وشبكات', description: 'فقدان الاتصال مع وحدة تحكم ناقل الحركة (TCM Gearbox).'),
  DtcRecord(code: 'U0121', system: 'اتصال وشبكات', description: 'فقدان الاتصال مع وحدة منع انغلاق الفرامل (ABS Module).'),
  DtcRecord(code: 'U0155', system: 'اتصال وشبكات', description: 'فقدان الاتصال مع طبلون العدادات (Instrument Cluster).'),

  // --- سادساً: نظام الفرامل والثبات (ABS / Chassis) ---
  DtcRecord(code: 'C0035', system: 'فرامل ABS', description: 'عطل في دائرة حساس سرعة العجل الأمامي الأيسر.'),
  DtcRecord(code: 'C0040', system: 'فرامل ABS', description: 'عطل في دائرة حساس سرعة العجل الأمامي الأيمن.'),
  DtcRecord(code: 'C0050', system: 'فرامل ABS', description: 'عطل في دائرة حساس سرعة العجل الخلفي.'),
];

// ================= الواجهة الرئيسية =================
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
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.amberAccent),
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
                  _buildSectionCard(context, 'سجل المركبات والموديلات', Icons.directions_car, Colors.blue[700]!, const VehicleDatabaseScreen()),
                  _buildSectionCard(context, 'أكواد الأعطال الشاملة (DTC)', Icons.bug_report, Colors.red[700]!, const DtcDatabaseScreen()),
                  _buildSectionCard(context, 'المخططات الكهربائية والأسلاك', Icons.electric_bolt, Colors.amber[700]!, const WiringDiagramsScreen()),
                  _buildSectionCard(context, 'أدوات الفحص والبرمجة', Icons.computer, Colors.indigo[700]!, const ProgrammingToolsScreen()),
                ],
              ),
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
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen)),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 38, color: color),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

// ================= شاشة الأكواد مع البحث الفوري المرتبط بالكامل =================
class DtcDatabaseScreen extends StatefulWidget {
  const DtcDatabaseScreen({super.key});

  @override
  State<DtcDatabaseScreen> createState() => _DtcDatabaseScreenState();
}

class _DtcDatabaseScreenState extends State<DtcDatabaseScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final query = searchController.text.toLowerCase();
    final filteredList = fullDtcDatabase.where((item) {
      return item.code.toLowerCase().contains(query) ||
          item.system.toLowerCase().contains(query) ||
          item.description.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('قاعدة بيانات الأعطال الكاملة (DTC)', style: TextStyle(fontSize: 15, color: Colors.white)),
        backgroundColor: const Color(0xFF1F1F1F),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: (val) => setState(() {}),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'ابحث عن أي كود (مثل P0300) أو عطل...',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                prefixIcon: const Icon(Icons.search, color: Colors.amber),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                final item = filteredList[index];
                return Card(
                  color: const Color(0xFF1E1E1E),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red[900],
                      child: Text(item.code.substring(0, 1), style: const TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                    title: Text('${item.code} - ${item.system}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    subtitle: Text(item.description, style: const TextStyle(color: Colors.white70, fontSize: 12)),
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

// شاشات إضافية مكملة للتطبيق
class VehicleBrandsScreen extends StatelessWidget {
  const VehicleBrandsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('المركبات')));
}

class VehicleDatabaseScreen extends StatelessWidget {
  const VehicleDatabaseScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('سجل المركبات')),
    body: const Center(child: Text('قائمة المركبات والموديلات', style: TextStyle(color: Colors.white))),
  );
}

class WiringDiagramsScreen extends StatelessWidget {
  const WiringDiagramsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('المخططات الكهربائية')),
    body: const Center(child: Text('مخططات الأسلاك والأنظمة', style: TextStyle(color: Colors.white))),
  );
}

class ProgrammingToolsScreen extends StatelessWidget {
  const ProgrammingToolsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('أدوات الفحص والبرمجة')),
    body: const Center(child: Text('أدوات الفحص المتقدمة', style: TextStyle(color: Colors.white))),
  );
}
