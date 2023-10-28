// custom class for sorting developer data locally
import 'package:hasancv/models/dev_model.dart';

class DevData {
  DevData._();
  static DevModel devData = DevModel(
      name: 'Hasan Hammoudah',
      number: '',
      mail: 'hassun.h98@gmail.com',
      bio: devBio,
      hobbies: <String>[
        "Learning about Development",
        "",
      ],
      skillsAndProgress: <SkillsAndProgress>[
        SkillsAndProgress(
          name: 'Software Engineer',
          progress: 0.7,
        ),
        SkillsAndProgress(
          name: 'Flutter Developer',
          progress: 0.8,
        ),
        SkillsAndProgress(
          name: 'Mobile Developer',
          progress: 0.4,
        ),
      ]);

  static const String devBio = """
I'm Hasan Hammoudah, a motivated software engineering student with a passion for mobile development using Dart and Flutter 📱. I enjoy sharing programming knowledge on social media 🌐. Check out my portfolio on Instagram. Let's explore mobile development together! 🚀"
""";
}
