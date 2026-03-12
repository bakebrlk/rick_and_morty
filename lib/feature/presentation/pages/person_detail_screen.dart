import 'package:flutter/material.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/widgets/person_cache_image_widget.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonEntity person;

  const PersonDetailPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Character',
          style: TextStyle(
            fontSize: 18,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          spacing: 12,
          children: [
            SizedBox(height: 10),
            Text(
              person.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: .bold,
              ),
            ),
            PersonCacheImage(
              imageURL: person.image,
              width: size.width * 0.6,
              height: size.width * 0.6,
            ),
            Row(
              spacing: 8,
              mainAxisAlignment: .center,
              children: [
                Container(
                  width: size.width * 0.03,
                  height: size.width * 0.03,
                  decoration: BoxDecoration(
                    color: person.status == 'Alive' ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(size.width * 0.015),
                  ),
                ),
                Text(
                  person.status,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            _infoBox('Gender:', person.gender),
            _infoBox('Number of episodes:', person.episode.length.toString()),
            _infoBox('Species:', person.species),
            _infoBox('Last known location:', person.location.name),
            _infoBox('Origin:', person.origin.name),
            _infoBox('Was created:', person.created.toString()),
          ],
        ),
      ),
    );
  }

  Column _infoBox(String title, description) {
    return Column(
      spacing: 2,
      children: [
        Text(title, style: TextStyle(color: AppColors.greyColor)),
        Text(description, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
