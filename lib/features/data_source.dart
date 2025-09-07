import 'package:m_emad/core/color_pallete.dart';
import 'package:m_emad/core/extensions/string_extension.dart';
import '../core/model/person_model.dart';

final List<Person> persons = [
  Person(
    name: "Ahmed",
    image: "download".jpg,
    message:
        "In today’s fast-paced digital world, technology continues to shape the way we live, work, and connect with each other. From the moment we wake up and check our phones, to the late hours when we browse the internet before going to sleep, technology surrounds us and influences almost every aspect of our daily lives. It provides us with tools that make communication faster, access to information easier, and entertainment more interactive than ever before. However, this convenience also comes with challenges, such as the risk of distraction, the spread of misinformation, and the growing concerns around privacy and data security",
  ),
  Person(
    name: "Sara",
    message:
        "In today’s fast-paced digital world, technology continues to shape the way we live, work, and connect with each other. From the moment we wake up and check our phones, to the late hours when we browse the internet before going to sleep, technology surrounds us and influences almost every aspect of our daily lives. It provides us with tools that make communication faster, access to information easier, and entertainment more interactive than ever before. However, this convenience also comes with challenges, such as the risk of distraction, the spread of misinformation, and the growing concerns around privacy and data security.",
    screenColor: ColorPallete.deepOrange,
  ),
  Person(name: "mahmoud", message: "I am here", image: "download".jpg , screenColor: ColorPallete.cyan ),
  Person(name: "Mahmoud saeed", message: "dfasdf sdf", image: "download".jpg, screenColor: ColorPallete.lightBlue),
];
