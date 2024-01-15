import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takehomechallenge_andyanyogawardhana/models/characters_model.dart';
import 'package:takehomechallenge_andyanyogawardhana/utils/constants/colors.dart';

class DetailScreen extends StatelessWidget {
  final Result? character;

  const DetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Character Details"),
        backgroundColor: AppColors.green,
      ),
      body: Stack(
        children: <Widget>[
          Image.network(
            character!.image,
            fit: BoxFit.cover,
            width: screenWidth,
            opacity: const AlwaysStoppedAnimation(.25),
          ),
          ListView(
            children: <Widget>[
              SizedBox(
                height: screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundColor: AppColors.green,
                            radius: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                clipBehavior: Clip.hardEdge,
                                child: Image.network(character!.image),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: screenWidth / 2 + 36,
                          child: CircleAvatar(
                            backgroundColor: AppColors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: CircleAvatar(
                                backgroundColor: AppColors.darkBrown,
                                child: Text(
                                  character!.id.toString(),
                                  style: GoogleFonts.bangers(
                                    color: AppColors.green,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        children: <Widget>[
                          Text(
                            character!.name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bangers(
                              fontSize: 36,
                              letterSpacing: 2,
                              height: 1,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = AppColors.green,
                            ),
                          ),
                          Text(
                            character!.name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bangers(
                              fontSize: 36,
                              letterSpacing: 2,
                              height: 1,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBrown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.darkBrown,
                height: 2,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 20),
              Text(
                "${character!.species} (${character!.status})",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: AppColors.darkBrown,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  character!.type != ""
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            character!.type,
                            style: const TextStyle(
                              color: AppColors.darkBrown,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(width: character!.type != "" ? 8 : 0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: character!.gender == "Male"
                          ? AppColors.blue
                          : character!.gender == "Female"
                              ? AppColors.pink
                              : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      character!.gender,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: AppColors.darkBrown,
                  height: 2,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 160,
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Character Origin",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBrown,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            character!.origin.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.darkBrown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 160,
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Current Location",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBrown,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            character!.location.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.darkBrown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
