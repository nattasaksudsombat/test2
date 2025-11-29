import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

// ✅ ต้องมี State แยกจาก StatefulWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1976D2), // น้ำเงินส่วนหัว
      body: SafeArea(
        child: Stack(
          children: [
            // แผงล่างสีขาว (โค้งมุมบน)
            Positioned.fill(
              top: 220,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('ข้อมูลส่วนตัว',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 16),
                      _infoTile(
                        icon: Icons.phone_iphone,
                        color: Colors.green,
                        title: 'เบอร์โทรศัพท์',
                        value: '081-234-5678',
                      ),
                      _infoTile(
                        icon: Icons.calendar_today,
                        color: Colors.pink,
                        title: 'วันเกิด',
                        value: '21 มีนาคม พ.ศ. 2497 ',
                      ),
                      _infoTile(
                        icon: Icons.wc,
                        color: Colors.orange,
                        title: 'เพศ',
                        value: 'ชาย',
                      ),
                      _infoTile(
                        icon: Icons.school,
                        color: Colors.deepPurple,
                        title: 'ระดับการศึกษา',
                        value: 'วิทยาลัยป้องกันราชอาณาจักรภาครัฐร่วมเอกชน รุ่นที่ 20'
                      ),
                      const SizedBox(height: 24
                      ),
                      SizedBox(

                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,    // 🔵 สีปุ่ม
                            foregroundColor: Colors.white,   // ⚪ สีตัวอักษร
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text('ไปหน้า 2'),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ส่วนหัว: ชื่อ + รูปโปรไฟล์
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const Text('ข้อมูลส่วนตัว',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(
                        // เปลี่ยนลิงก์รูปได้ตามต้องการ
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQME67XRzBgNu0ty1ROh69-L0dlo83HPe9Xg9p6A8HOi8ilQIP4e5t80yHxyAziz-BU0zJpGbw_sEKOKn6i2qfczlvrV3XYVcMbrdHZIg&s=10',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Prayut Chan-o-cha',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// แถวข้อมูลแบบมีไอคอนสี
Widget _infoTile({
  required IconData icon,
  required Color color,
  required String title,
  required String value,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500)),
              const SizedBox(height: 2),
              Text(value,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    ),
  );
}
