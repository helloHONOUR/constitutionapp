import 'package:flutter/material.dart';

final Map<String, List> chapter1 = {
  'Supremancy of the Consitution': [
    'Constitution shall be the supreme law of Ghana and any other law found to be inconsistent with any provision of this Constitution shall, to the extent of the inconsistency, be void.',
    'The sovereignty of Ghana resides in the people of Ghana in whose name and for whose welfare the powers of government are to be exercised in the manner and within the limits laid down in this Constitution.',
    'This Constitution shall be the supreme law of Ghana and the laws of Ghana shall be the laws referred to in the Constitution.',
    'Parliament shall have no power to enact a law establishing a one-party state.'
  ]
};

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chapter1.keys.toList()[0],
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.end,
        ),
        const SizedBox(height: 5),
        Container(
          height: 580,
          child: ListView.builder(
            itemCount: chapter1['Supremancy of the Consitution']!.length,
            itemBuilder: (BuildContext context, int index) {
              // final law = chapter1['Supremancy of the Consitution']![index];
              final {'Supremancy of the Consitution': title} = chapter1;
              int clause = index + 1;
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clause $clause',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      title[index],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
