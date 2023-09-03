

class ListCardContainer extends StatelessWidget {
  final int id;
  final String joke;
  final bool status;

  ListCardContainer({required this.id, required this.joke, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.78,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: kAccentColor,
              offset: Offset(5, 5), // Shadow offset for bottom and right
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '00:00', // id
                  style: AppConstants.kText.copyWith(fontSize: 12), // Use your timer text style
                ),
              ],
            ),
            Center(
              child: Text(
                'text',//joke
                style: AppConstants.kText,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis, // Display ellipsis for long text
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//fav joke

class JokeListView extends StatefulWidget {
  @override
  _JokeListViewState createState() => _JokeListViewState();
}

class _JokeListViewState extends State<JokeListView> {
  String selectedEmoji = '😀';

  @override
  Widget build(BuildContext context) {
    final emojiTags = [
      '😀',
      '🤣',
      '😄',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: emojiTags.map((emoji) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedEmoji = emoji;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kPrimaryColor
                ),
                child: Row(
                  children: [
                    Text(
                      emoji,
                      style: TextStyle(fontSize: 30),
                    ),
                    Visibility(
                      visible: selectedEmoji == emoji,
                      child: Text(
                        'emoji', // Emoji name
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        // Divider(),
        Container(
          height:  MediaQuery.of(context).size.height * 0.56,
          child: ListView.builder(
            itemCount: JokeProvider.jokefavlist[selectedEmoji]?.length ?? 0,
            itemBuilder: (context, index) {
              final favJoke = JokeProvider.jokefavlist[selectedEmoji]?[index] ?? '';

              return ListTile(
                title: Text(favJoke),
                subtitle: Visibility(
                  visible: selectedEmoji == emojiTags[index],
                  child: Text(emojiTags[index]), // Display the selected emoji name
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
//joke list
class JokeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: JokeProvider.jokelist.length,
      itemBuilder: (context, index) {
        final jokeData = JokeProvider.jokelist[index];
        final id = jokeData.id;
        final joke = jokeData.joke;
        final status = jokeData.status;

        return ListCardContainer(
          id: id,
          joke: joke,
          status: status,
        );
      },
    );
  }
}



