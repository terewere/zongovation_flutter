import 'package:flutter/material.dart';

class ActivityService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final info = [
      {
        'title': 'Co-working',
        'description': 'The ZongoVation Hub will provide a co-working '
            'space for its members. Membership will be opened '
            'to all young people and the general public, who can '
            'choose from daily, weekly, monthly, and yearly membership '
            'subscription categories.'
      },
      {
        'title': 'Classes & Workshops',
        'description': 'Together with our partners, '
            'we will offer a variety '
            'of classes and workshops on '
            'creative thinking, ideation '
            'techniques, ICT & Coding, '
            'social entrepreneurship, leadership,'
            ' presentation skills, project '
            'management, data visualization'
      },
      {
        'title': 'Incubation & Acceleration',
        'description': 'The ZongoVation Hub will become '
            'an environment for the incubation'
            ' and acceleration of startups by'
            ' young entrepreneurs. Office spaces'
            ' will be provided to young entrepreneurs'
            ' who will start and/or manage '
            'their startups at the Hub'
      },
      {
        'title': 'Consulting Services',
        'description': 'For startups and businesses that '
            'will require more hands-on assistance,'
            ' the Hub will provide '
            'consulting services and '
            'employee training. The Hub '
            'will partner with accounting firms,'
            ' legal firms, financial institutions,'
            ' business management'
      }
    ];
    return Column(
      children: [
        getServiceWidget(info[0]['title'], info[0]['description']),
        getServiceWidget(info[1]['title'], info[1]['description']),
        getServiceWidget(info[2]['title'], info[2]['description']),
        getServiceWidget(info[3]['title'], info[3]['description'])
      ],
    );
  }

  getServiceWidget(title, description) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(wordSpacing: 3, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
