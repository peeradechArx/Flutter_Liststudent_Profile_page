import 'package:flutter/material.dart';
import 'package:my_windows_app/student.dart';
import 'DetailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(33, 150, 243, 1)),
        useMaterial3: true,
      ),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Student> names = [
      Student("นายเจษฎา ลีรัตน์", "643450067-0", "images/1.jpg", "เจษฎาเป็นนักศึกษาสาขาวิศวกรรมคอมพิวเตอร์ ผู้ที่มีความสามารถพิเศษในด้านการพัฒนาเว็บและแอปพลิเคชัน", "jesada.l@kkumail.com", "https://www.facebook.com/pat.loveasd"),
      Student("นายธนาธิป เตชะ", "643450076-9", "images/2.jpg", "ธนาธิปสนใจในด้านการเขียนโปรแกรม และมีทักษะที่ดีในการพัฒนาเกม", "tanathip.t@kkumail.com", "https://facebook.com/tanathip"),
      Student("นายพีระเดช โพธิ์หล้า", "643450082-4", "images/3.jpg", "พีระเดชมีความสนใจในด้านการออกแบบและพัฒนาสื่อดิจิทัล และมีผลงานหลายชิ้นที่โดดเด่น", "peeradech.p@kkumail.com", "https://facebook.com/peeradech"),
      Student("นายวิญญู พรมภิภักดิ์", "643450084-0", "images/4.jpg", "วิญญูเป็นนักศึกษาที่มีความรู้และทักษะในด้านการพัฒนาระบบเครือข่ายคอมพิวเตอร์", "winyu.p@kkumail.com", "https://facebook.com/winnyou"),
      Student("นายเทวารัณย์ ชัยกิจ", "643450324-6", "images/5.jpg", "เทวารัณย์สนใจในด้านปัญญาประดิษฐ์และการเรียนรู้ของเครื่อง และมีผลงานวิจัยหลายชิ้น", "tewaran.c@kkumail.com", "https://facebook.com/tewarun"),
      Student("นายณัฐกานต์ อินทรพานิชย์", "643450072-7", "images/6.jpg", "ณัฐกานต์มีความสามารถในการพัฒนาแอปพลิเคชันมือถือ และชอบสร้างสรรค์แอปใหม่ๆ", "nuttakan.i@kkumail.com", "https://facebook.com/natthakarn"),
      Student("นายศุภชัย แสนประสิทธิ์", "643450332-7", "images/7.jpg", "ศุภชัยเป็นนักศึกษาที่มีทักษะในการบริหารจัดการโครงการไอที และเป็นผู้นำกลุ่มในหลายโครงการ", "supachai.sa@kkumail.com", "https://facebook.com/supachai"),
      Student("ธนรัตน์ บ้านสระ", "643450658-7", "images/8.jpg", "ธนรัตน์มีความเชี่ยวชาญในด้านการพัฒนาเว็บ และมีความสนใจในเทคโนโลยีใหม่ๆ", "thanarat.t@kkumail.com", "https://facebook.com/thanarat")
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("รายชื่อนักศึกษา CIS ปี 4"),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return displayNameItem(context: context, student: names[index], index: index);
        },
      ),
    );
  }

  Widget displayNameItem({required BuildContext context, required Student student, required int index}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => DetailPage(data: student),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(-1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                student.image,
                width: 100,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  student.name.contains("นายพีระเดช โพธิ์หล้า") ? rainbowText(student.name) : Text(
                    student.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    student.id,
                    style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rainbowText(String text) {
    List<Color> rainbowColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    List<TextSpan> spans = [];
    for (int i = 0; i < text.length; i++) {
      spans.add(TextSpan(
        text: text[i],
        style: TextStyle(
          color: rainbowColors[i % rainbowColors.length],
          decoration: text.contains("นายธนาธิป เตชะ")
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
      ));
    }

    return RichText(
      text: TextSpan(children: spans, style: const TextStyle(fontSize: 20)),
    );
  }
}
