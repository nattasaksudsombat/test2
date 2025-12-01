import 'package:flutter/material.dart'; // นำเข้าแพ็กเกจ Material ของ Flutter เพื่อใช้ widget ต่าง ๆ

// ประกาศคลาส Page2 ซึ่งเป็น StatelessWidget (ไม่มี state ภายใน)
class Page2 extends StatelessWidget {
  const Page2({super.key}); // คอนสตรักเตอร์ของ Page2 รับ key และประกาศเป็น const เพื่อประสิทธิภาพ

  @override
  Widget build(BuildContext context) { // เมทอด build เพื่อสร้าง UI ของ widget นี้
    return Scaffold( // Scaffold เป็นโครงหลักของหน้า (AppBar, body, ฯลฯ)
      backgroundColor: Colors.white, // กำหนดสีพื้นหลังของหน้าเป็นสีขาว

      appBar: AppBar( // กำหนด AppBar ด้านบนของหน้า
        title: const Text("หน้า 2"), // ข้อความหัวเรื่องใน AppBar
        centerTitle: true, // จัดข้อความหัวเรื่องให้อยู่ตรงกลาง
        backgroundColor: Colors.white, // ตั้งสีพื้นหลังของ AppBar ให้เป็นสีขาว
        elevation: 0, // ตั้งค่าเงาของ AppBar ให้ไม่มีเงา (fl at look)
      ),

      body: SingleChildScrollView( // ทำให้เนื้อหาด้านล่างเลื่อนขึ้นลงได้เมื่อยาวเกินหน้า
        padding: const EdgeInsets.all(16), // เว้นขอบด้านในทุกด้าน 16 จุด
        child: Column( // ใช้ Column เพื่อวาง widget แนวตั้ง
          crossAxisAlignment: CrossAxisAlignment.start, // จัดแนวลูกให้ชิดซ้าย
          children: [ // รายการ widget ภายใน Column
            const SizedBox(height: 10), // เว้นช่องว่างสูง 10 จุด

            // ------------------ รูปโปรไฟล์ ------------------
            Center( // วาง widget ด้านในให้อยู่กึ่งกลางแนวนอน
              child: CircleAvatar( // CircleAvatar ใช้แสดงภาพโปรไฟล์เป็นวงกลม
                radius: 50, // รัศมีของวงกลม (ขนาดรูป)
                backgroundImage: NetworkImage( // ใช้ NetworkImage เพื่อโหลดรูปจาก URL
                  // เปลี่ยนลิงก์รูปได้ตามต้องการ
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQME67XRzBgNu0ty1ROh69-L0dlo83HPe9Xg9p6A8HOi8ilQIP4e5t80yHxyAziz-BU0zJpGbw_sEKOKn6i2qfczlvrV3XYVcMbrdHZIg&s=10'), // URL รูปโปรไฟล์
              ),
            ),

            const SizedBox(height: 14), // เว้นช่องว่างสูง 14 จุด

            // ------------------ ชื่อ + Verified ------------------
            Center( // วางชื่อและไอคอนไว้กึ่งกลาง
              child: Row( // ใช้ Row เพื่อวางชื่อและไอคอนในแนวนอน
                mainAxisSize: MainAxisSize.min, // ให้ Row มีขนาดพอดีกับเนื้อหา (ไม่ยืดเต็มแถว)
                children: const [ // รายการ widget ใน Row
                  Text( // ข้อความแสดงชื่อ
                    "nattasak_SIT22", // ชื่อที่จะแสดง
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), // สไตล์ตัวอักษรใหญ่และหนา
                  ),
                  SizedBox(width: 6), // เว้นช่องว่างแนวนอน 6 จุดระหว่างชื่อกับไอคอน
                  Icon(Icons.verified, color: Colors.blue), // ไอคอน verified สีน้ำเงิน
                ],
              ),
            ),

            const SizedBox(height: 6), // เว้นช่อง 6 จุด

            const Center( // วาง username ย่อยไว้ตรงกลาง
              child: Text("@nattasak11", style: TextStyle(color: Colors.grey)), // ข้อความ username สีเทา
            ),

            const SizedBox(height: 20), // เว้นช่อง 20 จุด

            // ------------------ ปุ่มติดตาม ------------------
            SizedBox( // ใช้ SizedBox เพื่อกำหนดความกว้างของปุ่ม
              width: double.infinity, // กว้างเต็มความกว้างหน้าจอ (ภายใน padding)
              child: ElevatedButton( // ปุ่มแบบยกสูง (Material)
                onPressed: () {}, // ฟังก์ชันเมื่อกด (ตอนนี้ยังว่าง)
                style: ElevatedButton.styleFrom( // ปรับสไตล์ของปุ่ม
                  backgroundColor: Colors.yellow, // สีพื้นของปุ่มเป็นสีเหลือง
                  foregroundColor: Colors.black, // สีตัวอักษรของปุ่มเป็นสีดำ
                  shape: const StadiumBorder(), // รูปร่างปุ่มเป็น Stadium (มุมมนยาว)
                  padding: const EdgeInsets.symmetric(vertical: 14), // ช่องว่างด้านในแนวตั้ง 14 จุด
                ),
                child: const Text("ติดตาม"), // ข้อความบนปุ่ม
              ),
            ),

            const SizedBox(height: 20), // เว้นช่อง 20 จุด

            // ------------------ สถิติเหมือนหน้าแรก ------------------
            Row( // แถวแสดงสถิติ 3 อย่าง (ตามตัวอย่าง)
              mainAxisAlignment: MainAxisAlignment.spaceAround, // เว้นระยะห่างเท่า ๆ กันรอบ ๆ แต่ละรายการ
              children: const [ // รายการ ProfileStat (widget ย่อย) ทั้ง 3
                ProfileStat(number: "1", label: "กำลังติดตาม"), // สถิติ: กำลังติดตาม = 1
                ProfileStat(number: "999 B", label: "ผู้ติดตาม"), // สถิติ: ผู้ติดตาม = 999 B
                ProfileStat(number: "9999 B", label: "ถูกใจและบันทึก"), // สถิติ: ถูกใจและบันทึก = 9999 B
              ],
            ),

            const SizedBox(height: 24), // เว้นช่อง 24 จุด



            const SizedBox(height: 12), // เว้นช่อง 12 จุด (บรรทัดสำรอง)

            // ------------------ Grid 2 คอลัมน์ ------------------
            GridView.count( // GridView แบบกำหนดจำนวนคอลัมน์ง่าย ๆ
              crossAxisCount: 2, // จำนวนคอลัมน์ใน grid = 2
              crossAxisSpacing: 10, // ระยะห่างระหว่างคอลัมน์แนวนอน = 10
              mainAxisSpacing: 10, // ระยะห่างระหว่างแถวแนวตั้ง = 10
              shrinkWrap: true, // ให้ GridView ย่อขนาดตามจำนวน children (เพื่อใช้ใน Column)
              physics: const NeverScrollableScrollPhysics(), // ปิดการเลื่อนภายใน Grid (เลื่อนด้วย SingleChildScrollView แทน)
              children: [ // รายการรูปภาพที่จะแสดงเป็นตาราง
                ClipRRect( // คลิปมุมของรูปให้เป็นมุมโค้ง
                    borderRadius: BorderRadius.circular(10), // ให้มุมมนด้วยรัศมี 10
                    child: Image.network( // โหลดรูปจากอินเทอร์เน็ต
                      // เปลี่ยนลิงก์รูปได้ตามต้องการ
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqdARMBfmQIE3tG7EhkQpY4Am0yTg2k76t2yQ0HOmpRDkSR-DvhPeRmg_PKFSe_JKx7iQ&usqp=CAU', // URL รูปแรก
                      fit: BoxFit.cover, // ให้รูปครอบคลุมพื้นที่โดยอาจถูกครอปบางส่วน
                    )
                ),
                ClipRRect( // รูปที่สอง
                    borderRadius: BorderRadius.circular(10), // มุมโค้ง
                    child: Image.network( // โหลดรูปจาก URL
                      // เปลี่ยนลิงก์รูปได้ตามต้องการ
                      'https://www.tvpoolonline.com/wp-content/uploads/2022/03/pyu9znwxegC54A16l9r-o.jpg', // URL รูปที่สอง
                      fit: BoxFit.cover, // ปรับการแสดงรูปให้ครอบคลุมกล่อง
                    )
                ),
                ClipRRect( // รูปที่สาม
                    borderRadius: BorderRadius.circular(10), // มุมโค้ง
                    child: Image.network( // โหลดรูปจาก URL
                      // เปลี่ยนลิงก์รูปได้ตามต้องการ
                      'https://resource.nationtv.tv/uploads/images/md/2023/05/MdmtKfVJ2hVvdK6Kc8vD.webp', // URL รูปที่สาม
                      fit: BoxFit.cover, // ครอบคลุมพื้นที่กล่อง
                    )
                ),
                ClipRRect( // รูปที่สี่
                    borderRadius: BorderRadius.circular(10), // มุมโค้ง
                    child: Image.network( // โหลดรูปจาก URL
                      // เปลี่ยนลิงก์รูปได้ตามต้องการ
                      'https://entertain.teenee.com/series/img4/1216238.jpg', // URL รูปที่สี่
                      fit: BoxFit.cover, // ครอบคลุมพื้นที่กล่อง
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// Widget แสดงสถิติแบบเดียวกับหน้า Profile
class ProfileStat extends StatelessWidget { // ประกาศ widget ย่อย ProfileStat
  final String number; // ตัวแปรเก็บตัวเลขสถิติ (ส่งจากภายนอก)
  final String label; // ตัวแปรเก็บคำอธิบายสถิติ

  const ProfileStat({
    super.key, // key ที่ส่งให้ superclass
    required this.number, // กำหนดว่า number ต้องถูกส่งมา
    required this.label, // กำหนดว่า label ต้องถูกส่งมา
  });

  @override
  Widget build(BuildContext context) { // สร้าง UI ของ ProfileStat
    return Column( // ใช้ Column เพื่อวาง number และ label แนวตั้ง
      children: [ // รายการ widget ภายใน Column
        Text( // แสดงตัวเลข
          number, // ข้อความจากตัวแปร number
          style: const TextStyle( // สไตล์ตัวเลข
            fontSize: 18, // ขนาดตัวอักษร 18
            fontWeight: FontWeight.bold, // ตัวหนา
          ),
        ),
        Text( // แสดงคำอธิบายสถิติ (label)
          label, // ข้อความจากตัวแปร label
          style: const TextStyle(color: Colors.grey, fontSize: 12), // สีเทา ขนาดเล็ก
        ),
      ],
    );
  }
}
