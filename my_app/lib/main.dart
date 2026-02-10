import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ---------------- APP COLORS ----------------
class AppColors {
  static const Color background = Color(0xFFF5F5F5);    // Light Gray
  static const Color card = Color(0xFF8C6A5C);          // Brown Sugar
  static const Color accent = Color(0xFFFFC0CB);        // Soft Pink
  static const Color secondary = Color(0xFFC49081);     // Rosy Brown
  static const Color textPrimary = Color(0xFF3E2723);   // Dark Brown
  static const Color textSecondary = Color(0xFF5D4037); // Medium Brown
}

// ---------------- MAIN APP ----------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roshni Portfolio',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.card,
          foregroundColor: AppColors.textPrimary,
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ---------------- HOME PAGE ----------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Header
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image.asset(
                  'assets/coding1.jpeg',
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                "Roshni Rai",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary),
              ),
              const SizedBox(height: 6),
              Text(
                "UI/UX Designer • Flutter Learner",
                style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // Intro Card
          glassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("👋 Hello",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent)),
                const SizedBox(height: 10),
                Text(
                  "I am Roshni, a B.Tech CSE student passionate about UI/UX design and frontend development. I enjoy creating clean, modern interfaces and I am currently learning Flutter to build mobile apps.",
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          glassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("🎯 What I Do",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent)),
                const SizedBox(height: 10),
                Text(
                  "• Design user-friendly UI screens\n"
                  "• Create app layouts using Figma\n"
                  "• Learn Flutter for app development\n"
                  "• Build beginner-friendly projects\n"
                  "• Explore frontend technologies",
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Text(
            "Explore My Portfolio",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary),
          ),

          const SizedBox(height: 12),

          menuTile(context, "My Profile", const ProfilePage()),
          menuTile(context, "About Me", const AboutPage()),
          menuTile(context, "Skills", const SkillsPage()),
          menuTile(context, "Projects", const ProjectsPage()),
          menuTile(context, "Contact", const ContactPage()),

          const SizedBox(height: 30),

          Center(
            child: Text(
              "Made with Flutter 💙",
              style: TextStyle(color: AppColors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- GLASS CARD ----------------
Widget glassCard({required Widget child}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.card.withOpacity(0.9),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.accent.withOpacity(0.3)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, 6),
        )
      ],
    ),
    child: child,
  );
}

// ---------------- MENU TILE ----------------
Widget menuTile(BuildContext context, String title, Widget page) {
  return Card(
    color: AppColors.card,
    child: ListTile(
      title: Text(title, style: TextStyle(color: AppColors.textPrimary)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.accent),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    ),
  );
}

// ---------------- PROFILE PAGE ----------------
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return contentPage(
      title: "My Profile",
      children: const [
        infoBlock("Name", "Roshni Rai"),
        infoBlock("Course", "B.Tech CSE"),
        infoBlock("Role", "UI/UX Designer & Flutter Learner"),
        infoBlock(
            "Bio",
            "I love designing aesthetic user interfaces and learning new frontend technologies. I enjoy combining creativity with technology."),
      ],
    );
  }
}

// ---------------- ABOUT PAGE ----------------
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return contentPage(
      title: "About Me",
      children: const [
        infoBlock(
            "Who Am I?",
            "I am a Computer Science student with a strong interest in UI/UX and frontend development."),
        infoBlock(
            "My Passion",
            "I enjoy creating beautiful designs and turning them into functional app screens."),
        infoBlock(
            "My Goal",
            "To become a skilled frontend developer and UI/UX designer."),
      ],
    );
  }
}

// ---------------- SKILLS PAGE ----------------
class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return contentPage(
      title: "Skills",
      children: const [
        infoBlock("Design", "UI/UX Design, Figma, Wireframing"),
        infoBlock("Development", "Flutter (Beginner), HTML, CSS"),
        infoBlock("Other", "Creative Thinking, Problem Solving"),
      ],
    );
  }
}

// ---------------- PROJECTS PAGE ----------------
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return contentPage(
      title: "Projects",
      children: const [
        infoBlock(
            "Portfolio App (Flutter)",
            "A beginner Flutter app showcasing my profile, skills, and projects."),
        infoBlock(
            "UI Design Concepts",
            "Created multiple UI screens using Figma for practice."),
        infoBlock(
            "Mini Web Pages",
            "Built simple HTML & CSS pages to understand frontend basics."),
      ],
    );
  }
}

// ---------------- CONTACT PAGE ----------------
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return contentPage(
      title: "Contact Me",
      children: const [
        infoBlock("Email", "roshni@example.com"),
        infoBlock("LinkedIn", "linkedin.com/in/roshnirai"),
        infoBlock("Instagram", "@roshnirai"),
        infoBlock("Message",
            "Feel free to connect with me for collaborations and projects!"),
      ],
    );
  }
}

// ---------------- COMMON PAGE TEMPLATE ----------------
Widget contentPage(
    {required String title, required List<Widget> children}) {
  return Scaffold(
    backgroundColor: AppColors.background,
    appBar: AppBar(title: Text(title)),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: children,
    ),
  );
}

// ---------------- INFO BLOCK ----------------
class infoBlock extends StatelessWidget {
  final String title;
  final String content;

  const infoBlock(this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return glassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          Text(content,
              style: TextStyle(fontSize: 15, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
