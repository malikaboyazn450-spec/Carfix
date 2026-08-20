import 'package:flutter/material.dart';

void main() {
  runApp(const CarFixProApp());
}

class CarFixProApp extends StatelessWidget {
  const CarFixProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carfix Pro',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Cairo', // الخط العربي (اختياري)
      ),
      home: const MainDashboardScreen(),
    );
  }
}

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تعريف الألوان الرسمية القوية
    final Color primaryColor = Colors.blueGrey[900]!;
    final Color accentColor = Colors.blue[700]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'نظام إدارة صيانة المركبات - Carfix Pro',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          // شريط علوي تعريفي (أزرق قوي)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: accentColor,
            child: const Text(
              'أهلاً بك يا أبو يزن - المركز الفني المتخصص',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // منطقة الأقسام الرئيسية (شبكة منظمة)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2, // عمودين في كل صف
                crossAxisSpacing: 15, // مسافة بين الأعمدة
                mainAxisSpacing: 15, // مسافة بين الصفوف
                childAspectRatio: 1.3, // نسبة عرض إلى ارتفاع البطاقة
                children: [
                  _buildMenuCard(context, 'قاعدة بيانات العملاء', Icons.people_alt, Colors.teal[800]!),
                  _buildMenuCard(context, 'سجل المركبات والصيانة', Icons.directions_car_filled, Colors.deepOrange[800]!),
                  _buildMenuCard(context, 'المخططات الكهربائية', Icons.flash_on, Colors.amber[800]!),
                  _buildMenuCard(context, 'أكواد الأعطال (DTC)', Icons.bug_report, Colors.red[800]!),
                  _buildMenuCard(context, 'أدوات التشخيص', Icons.build_circle, Colors.indigo[800]!),
                  _buildMenuCard(context, 'إعدادات النظام', Icons.settings, Colors.blueGrey[700]!),
                ],
              ),
            ),
          ),
          // تذييل رسمي
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            color: primaryColor,
            child: const Text(
              'Carfix Pro © 2024 - جميع الحقوق محفوظة',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  // تصميم البطاقات القوية والرسمية
  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      elevation: 6, // ظل قوي للبروز
      shadowColor: Colors.black.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: color.withOpacity(0.3), width: 1),
      ),
      child: InkWell(
        onTap: () {
          _showInfoMessage(context, title);
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.05), // شفافية علوية خفيفة
                color.withOpacity(0.15), // لون خفيف يزداد للأسفل
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 15),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
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

  void _showInfoMessage(BuildContext context, String sectionName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'جاري الانتقال إلى قسم: $sectionName',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.blueGrey[800],
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
