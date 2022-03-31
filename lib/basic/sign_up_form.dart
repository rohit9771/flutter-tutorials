import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'app_profile.dart';

// Create a Form widget.
class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class SignUpFormState extends State<SignUpForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Institute';
  final _chipKey = GlobalKey<ChipsInputState>();

  @override
  Widget build(BuildContext context) {
    const mockResults = <AppProfile>[
      AppProfile('John Doe', 'jdoe@flutter.io',
          'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
      AppProfile('Paul', 'paul@google.com',
          'https://mbtskoudsalg.com/images/person-stock-image-png.png'),
      AppProfile('Fred', 'fred@google.com',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Brian', 'brian@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('John', 'john@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Thomas', 'thomas@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Nelly', 'nelly@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Marie', 'marie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Charlie', 'charlie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Diana', 'diana@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Ernie', 'ernie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Gina', 'fred@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
    ];

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Enter email',
                labelText: 'Email',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                icon: Icon(Icons.add_location),
                hintText: 'Enter your Location',
                labelText: 'Location',
              ),
            ),
            DropdownButton(
                //decoration: const InputDecoration(icon: Icon(Icons.school),hintText: 'Select Institute/Trainer/Student',labelText: 'Institute/Trainer/Student'),
                items: <String>['Institute', 'Trainer', 'Student']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                }),
            ChipsInput(
              key: _chipKey,
              // autofocus: true,
              // allowChipEditing: true,
              keyboardAppearance: Brightness.dark,
              textCapitalization: TextCapitalization.words,
              // enabled: false,
              // maxChips: 5,
              textStyle: const TextStyle(
                  height: 1.5, fontFamily: 'Roboto', fontSize: 16),
              decoration: const InputDecoration(
                // prefixIcon: Icon(Icons.search),
                // hintText: formControl.hint,
                icon: Icon(Icons.menu_book),
                labelText: 'Technologies',
                // enabled: false,
                // errorText: field.errorText,
              ),
              findSuggestions: (String query) {
                // print("Query: '$query'");
                if (query.isNotEmpty) {
                  var lowercaseQuery = query.toLowerCase();
                  return mockResults.where((profile) {
                    return profile.name
                            .toLowerCase()
                            .contains(query.toLowerCase()) ||
                        profile.email
                            .toLowerCase()
                            .contains(query.toLowerCase());
                  }).toList(growable: false)
                    ..sort((a, b) => a.name
                        .toLowerCase()
                        .indexOf(lowercaseQuery)
                        .compareTo(
                            b.name.toLowerCase().indexOf(lowercaseQuery)));
                }
                // return <AppProfile>[];
                return mockResults;
              },
              onChanged: (data) {
                // print(data);
              },
              chipBuilder: (context, state, dynamic profile) {
                return InputChip(
                  key: ObjectKey(profile),
                  label: Text(profile.name),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(profile.imageUrl),
                  ),
                  onDeleted: () => state.deleteChip(profile),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              },
              suggestionBuilder: (context, state, dynamic profile) {
                return ListTile(
                  key: ObjectKey(profile),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(profile.imageUrl),
                  ),
                  title: Text(profile.name),
                  subtitle: Text(profile.email),
                  onTap: () => state.selectSuggestion(profile),
                );
              },
            ),
            DropdownButton(
                //decoration: const InputDecoration(icon: Icon(Icons.medical_services),hintText: 'Service Type',labelText: 'Service Type',),
                items: <String>['Training', 'Support', 'Certification']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                }),
            Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: ElevatedButton(
                    child: const Text('Submit'), onPressed: null)),
          ],
        ),
      ),
    );
  }
}
