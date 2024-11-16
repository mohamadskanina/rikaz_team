import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/localization/generated/l10n.dart';
import 'package:screenshot/screenshot.dart';

import 'package:rikaz_team/features/share_employee_as_image/controller/card_gen_cubit.dart';
import 'package:rikaz_team/features/users_list/domain/entities/user.dart';

class CardGenWidget extends StatelessWidget {
  CardGenWidget({super.key, required this.user});

  final User user;

  final CardGenCubit cardGenCubit = CardGenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cardGenCubit,
      child: BlocBuilder<CardGenCubit, CardGenState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    )),
                Expanded(
                  child: Center(
                    child: Screenshot(
                      controller: cardGenCubit.screenshotController,
                      child: Stack(
                        children: [
                          Container(
                            width: 350,
                            height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/gradient-ID-card.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 350,
                            height: 220,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey.shade200,
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: user.avatar,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error,
                                        size: 50,
                                        color: Colors.red,
                                      ),
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                VerticalDivider(color: Colors.transparent),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 20),
                                    Text(
                                      'Id Card : ${user.id}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '${user.first_name} ${user.last_name}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      user.email,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.read<CardGenCubit>().generateUserCard();
                        },
                        label: Text(Lang.of(context).share),
                        icon: Icon(Icons.share),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
