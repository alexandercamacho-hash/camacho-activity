
import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// List of 5 students
const List<Student> students = [
  Student(
    name: 'Alexander Camacho',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'alexander.camacho@csucc.edu.ph',
  ),
  Student(
    name: 'Jay Aguelo',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'jay.aguelo@csucc.edu.ph',
  ),
  Student(
    name: 'Jonard Osa',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'jonard.osa@csucc.edu.ph',
  ),
  Student(
    name: 'Kim Embarnace',
    course: 'BS Information Systems',
    yearLevel: 3,
    email: 'kim.embarnace@csucc.edu.ph',
  ),
  Student(
    name: 'Maribel Corpuz',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'maribel.corpuz@csucc.edu.ph',
  ),
];

 // DirectoryApp is stateless because its theme and home screen do not change.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Directory',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal, // Customization 1: Theme color
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}

 // DirectoryScreen is stateless because it only displays fixed student data.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Directory'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Students'),
          ...students.map(
            (student) => StudentCard(student: student),
          ),
        ],
      ),
    );
  }
}

 // SectionHeader is stateless because its title does not change by itself.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.teal, // Customization 2: Header color
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}

 // StudentCard is stateless because it only displays the given student data.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      // Customization 3: Rounded card corners
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        // Customization 4: Card spacing
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              // Customization 5: Avatar background color
              backgroundColor: Colors.teal.shade100,
              child: Text(
                student.name[0],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    // Customization 6: Student name style
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(student.course),
                  const SizedBox(height: 10),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year Level: ${student.yearLevel}',
                  ),
                  const SizedBox(height: 6),
                  InfoRow(
                    icon: Icons.email,
                    text: student.email,
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

 // InfoRow is stateless because it only displays an icon and text.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.teal),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

