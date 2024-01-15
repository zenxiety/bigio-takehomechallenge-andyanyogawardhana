import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:takehomechallenge_andyanyogawardhana/providers/home_provider.dart';
import 'package:takehomechallenge_andyanyogawardhana/utils/constants/colors.dart';
import 'package:takehomechallenge_andyanyogawardhana/utils/constants/loading_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final HomeProvider provider = Provider.of<HomeProvider>(
      context,
      listen: false,
    );

    provider.getCharacters(page: 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: screenHeight,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(
                      "https://wallpapers-clan.com/wp-content/uploads/2021/08/rick-and-morty-portal-wallpaper-2-scaled.jpg",
                      fit: BoxFit.fill,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Text(
                              "Rick and Morty",
                              style: GoogleFonts.bangers(
                                fontSize: 48,
                                letterSpacing: 4,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = AppColors.darkGreen,
                              ),
                            ),
                            Text(
                              "Rick and Morty",
                              style: GoogleFonts.bangers(
                                fontSize: 48,
                                letterSpacing: 4,
                                color: AppColors.yellow,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: <Widget>[
                            Text(
                              "Characters Fandom",
                              style: GoogleFonts.bangers(
                                fontSize: 24,
                                letterSpacing: 2,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = AppColors.darkGreen,
                              ),
                            ),
                            Text(
                              "Characters Fandom",
                              style: GoogleFonts.bangers(
                                fontSize: 24,
                                letterSpacing: 2,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Consumer<HomeProvider>(builder: (context, state, _) {
                          return ElevatedButton(
                            onPressed: () {
                              Scrollable.ensureVisible(
                                state.dataKey.currentContext!,
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                              );
                            },
                            child: const Text("Start Exploration"),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              Consumer<HomeProvider>(builder: (context, state, _) {
                return Center(
                  key: state.dataKey,
                  child: state.loadingState == LoadingState.loading
                      ? SizedBox(
                          height: screenHeight,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.darkGreen,
                            ),
                          ),
                        )
                      : state.loadingState == LoadingState.success
                          ? state.charactersModel == null ||
                                  state.charactersModel!.results.isEmpty
                              ? const Text("No Characters Found")
                              : Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Text(
                                        "THE CHARACTERS",
                                        style: GoogleFonts.bangers(
                                          fontSize: 36,
                                          letterSpacing: 2,
                                          color: AppColors.darkGreen,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Divider(
                                        color: AppColors.darkBrown,
                                        height: 2,
                                        thickness: 2,
                                        indent: 20,
                                        endIndent: 20,
                                      ),
                                    ),
                                    for (var character
                                        in state.charactersModel!.results)
                                      GestureDetector(
                                        onTap: () => state.tapCharacter(
                                          context,
                                          character: character,
                                        ),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            child: ClipRRect(
                                              clipBehavior: Clip.hardEdge,
                                              borderRadius:
                                                  BorderRadius.circular(9999),
                                              child: Image.network(
                                                character.image,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            character.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Text(
                                            character.location.name,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          trailing: character.status == "Alive"
                                              ? const Icon(
                                                  Icons.person_rounded,
                                                  color: AppColors.green,
                                                )
                                              : character.status == "Dead"
                                                  ? const Icon(
                                                      Icons.dangerous_rounded,
                                                      color: AppColors.red,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .question_mark_rounded,
                                                      color: AppColors.yellow,
                                                    ),
                                        ),
                                      ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: state.currentPage == 1
                                              ? null
                                              : state.prevPage,
                                          icon: const Icon(
                                            Icons.chevron_left_rounded,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: state.currentPage ==
                                                  state.charactersModel!.info
                                                          .pages -
                                                      1
                                              ? null
                                              : state.nextPage,
                                          icon: const Icon(
                                            Icons.chevron_right_rounded,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                          : SizedBox(
                              height: screenHeight,
                              child: const Text("FAILED TO FETCH DATA"),
                            ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
