import 'package:flutter/material.dart';
// นำเข้า Flutter Material Widgets เพื่อใช้งาน UI แบบ Material Design

import 'page2.dart';
// นำเข้าไฟล์ page2.dart เพื่อให้สามารถกดปุ่มไปยังหน้า Page2 ได้


void main() => runApp(const MyApp());
// main() คือฟังก์ชันเริ่มต้นของแอป
// runApp() ใช้รัน widget หลักของโปรเจค (MyApp)
//void
// ฟังก์ชันที่ทำงานอย่างเดียว ไม่ส่งค่า

class MyApp extends StatelessWidget {
  // MyApp เป็น StatelessWidget แสดงข้อมูลที่ไม่เปลี่ยนแปลงระหว่างใช้งาน
  //class MyApp คือคลาสหลักของแอป ที่บอก Flutter ว่าหน้าตาแอปควรเริ่มยังไง
  const MyApp({super.key});
//สร้าง MyApp แบบคงที่ และส่ง key ให้พ่อมัน (StatelessWidget)
  @override
  //สร้าง MyApp แบบคงที่ และส่ง key ให้พ่อมัน (StatelessWidget)
  Widget build(BuildContext context) {
    //ฟังก์ชันที่สร้าง UI ทั้งหมดบนหน้าจอ
    return MaterialApp(
      title: 'Profile Demo', // ชื่อแอป
      debugShowCheckedModeBanner: false, // ซ่อนป้าย DEBUG มุมขวาบน
      theme: ThemeData(
        useMaterial3: true, // ใช้ Material Design 3
        colorSchemeSeed: Colors.blue, // โทนสีหลักของแอป
      ),
      home: const MyHomePage(), // หน้าแรกของแอป
    );
  }
}


// ----------------------------
// StatefulWidget ส่วนของหน้า Home
// ----------------------------
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
// สร้าง State สำหรับจัดการ UI ที่เปลี่ยนแปลงได้
}


// ตัว State ที่ควบคุม MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1976D2),
      // พื้นหลังส่วนบนสีฟ้าเข้ม (หัวโปรไฟล์)

      body: SafeArea(
        // ป้องกันไม่ให้ UI ชนขอบบน / รอยบากมือถือ
        child: Stack(
          // Stack ใช้วาง widget ซ้อนเลเยอร์กัน
          children: [

            // ------------------------- พื้นหลังสีขาวด้านล่าง -------------------------
            Positioned.fill(
              top: 220,
              // ให้ Container ด้านล่างเริ่มที่ตำแหน่ง 220 พิกเซลจากบน
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white, // สีพื้นหลังแผงข้อมูล
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  // มุมส่วนบนโค้งมน 24 px
                ),

                child: SingleChildScrollView(
                  // เลื่อนเนื้อหาด้านล่างได้
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                  // เว้นระยะรอบด้าน

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ข้อมูลส่วนตัว',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      ),

                      const SizedBox(height: 16),

                      // --------- รายการข้อมูลทีละแถว ---------
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
                        value: 'วิทยาลัยป้องกันราชอาณาจักรภาครัฐร่วมเอกชน รุ่นที่ 20',
                      ),

                      const SizedBox(height: 24),

                      // -------------------- ปุ่มไปหน้า 2 --------------------
                      SizedBox(
                        width: double.infinity, // ให้ปุ่มกว้างเต็มแถว
                        child: ElevatedButton(
                          onPressed: () {
                            // กดปุ่มแล้วไปหน้า 2
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Page2(),
                              ),
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,  // สีปุ่ม
                            foregroundColor: Colors.white, // สีตัวอักษรปุ่ม
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: const StadiumBorder(), // ปุ่มวงรีมน
                          ),

                          child: const Text('ไปหน้า 2'), // ข้อความบนปุ่ม
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ------------------------- ส่วนหัวโปรไฟล์ -------------------------
            Align(
              alignment: Alignment.topCenter,
              // จัดให้อยู่กลางด้านบน
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  const Text(
                    'ข้อมูลส่วนตัว',
                    style: TextStyle(
                      color: Colors.white, // ตัวอักษรสีขาว
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // รูปโปรไฟล์ + ขอบวงขาว
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white, // วงขาวรอบรูป
                      shape: BoxShape.circle,
                    ),

                    child: const CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQME67XRzBgNu0ty1ROh69-L0dlo83HPe9Xg9p6A8HOi8ilQIP4e5t80yHxyAziz-BU0zJpGbw_sEKOKn6i2qfczlvrV3XYVcMbrdHZIg&s=10',
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Prayut Chan-o-cha',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ==========================================================
// ฟังก์ชันสำหรับสร้างแถวข้อมูลที่มีไอคอนสี + ข้อความ
// ==========================================================
Widget _infoTile({
  required IconData icon, // ไอคอน
  required Color color,   // สีประจำหัวข้อ
  required String title,  // ชื่อหัวข้อ เช่น เบอร์โทรศัพท์
  required String value,  // ค่าที่แสดง เช่น 081-234...
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // ไอคอนสีในวงกลมจาง ๆ
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15), // สีพื้นหลังจาง 15%
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color), // ไอคอนสีจริง
        ),

        const SizedBox(width: 12),

        // ข้อความสองบรรทัด (title + value)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, // ชื่อหัวข้อ
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                value, // ค่าจริง
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
