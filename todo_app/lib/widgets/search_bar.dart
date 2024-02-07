import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class MySearchBar extends StatelessWidget {
//   const MySearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     void _onSearchPressed(BuildContext context) {
//       showSearch(
//         context: context,
//         delegate: MySearchDelegate(),
//       );
//     }

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: GestureDetector(
//         onTap: () {
//           _onSearchPressed(context);
//         },
//         child: Container(
//           height: 45,
//           // padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             // color: Colors.black,
//             borderRadius: BorderRadius.circular(24),
//             border: Border.all(color: Colors.grey),
//           ),
//           child: Row(children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Icon(
//                 Icons.search,
//                 color: Colors.black38,
//               ),
//             ),
//             Text(
//               'Find your task...',
//               style: GoogleFonts.montserrat(fontSize: 16),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }

class MyCustomSearch extends SearchDelegate {
  final List<String> allData = [
    'American',
    'Russia',
    'China',
    'Germany',
    'Italy',
    'France',
    'England',
    'Vietnamese'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
