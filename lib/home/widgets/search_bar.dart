import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext buildContext) {
    final TextEditingController searchController = TextEditingController();

    return Card(
      elevation: 5,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextField(
        controller: searchController,
        cursorColor: const Color(0xFFE86500),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(fontFamily: GoogleFonts.outfit().fontFamily, color: Color(0xFFDEDEDE)),
          filled: true, 
          fillColor: Color(0xFF121212),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1, color: Color(0xFFDEDEDE))
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1, color: Color(0xFFDEDEDE))
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1, color: Color(0xFFDEDEDE))
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            color: const Color(0xFFE86500),
            onPressed: () {
              // Perform the search here
            },
          )
        )
      )
    );
  }
}

// class RoomSearchDelegate extends SearchDelegate {
//   List<String> searchResults = [
//     'testLoc',
//     'Mariposa 2',
//     'Mariposa 3',
//   ];

//   @override
//   Widget? buildLeading(BuildContext context) => IconButton(
//     onPressed: () => close(context, null), 
//     icon: const Icon(Icons.arrow_back)
//   );

//   List<Widget>? buildActions(BuildContext context) => [
//     IconButton(
//       icon: Icon(Icons.clear, color: Colors.black),
//       onPressed: () {
//         if (query.isEmpty) {
//           close(context, null);
//         } else {
//           query = '';
//         }
//       },
//     ),
//   ];

//   Widget buildResults(BuildContext context) => Location(query);

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestions = searchResults.where((searchResult) {
//       final result = searchResult.toLowerCase();
//       final input = query.toLowerCase();

//       return result.contains(input);
//     }).toList();

//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final suggestion = suggestions[index];

//         return ListTile(
//           title: Text(suggestion),
//           onTap: () {
//             query = suggestion;
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }