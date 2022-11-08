import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    // create an instance of our app
    // and pass it to the runApp function
    const App(),
  );
}

// #docregion Routes
// define route name as a constant
// so it is reusable
const detailsPageRouteName = '/details';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: const HomePage(),
      // routes property defines the available named routes
      // and the widgets to build when navigating to those routes
      routes: {
        detailsPageRouteName: (context) => const DetailsPage(),
      },
    );
  }
}
// #enddocregion Routes

// create a class that holds each person's data
@immutable
class Person {
  final String name;
  final int age;
  const Person({
    required this.name,
    required this.age,
  });
}

// then we create a list of people
final mockPersons = Iterable.generate(
  100,
  (index) => Person(
    name: 'Person #${index + 1}',
    age: 10 + index,
  ),
);

// This is stateless widget that displays the list of persons
// that we get from the mockPersons list and allows the user
// to tap each person to see their details
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Pick a person',
        ),
      ),
      child: Material(
        child:
            // #docregion ListView
            ListView.builder(
          itemCount: mockPersons.length,
          itemBuilder: (context, index) {
            final person = mockPersons.elementAt(index);
            final age = '${person.age} years old';
            return ListTile(
              title: Text(person.name),
              subtitle: Text(age),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {
                // when a ListTile that represents a person is
                // tapped, push the detailsPageRouteName route
                // to the Navigator and pass the person's instance
                // to the route
                Navigator.of(context).pushNamed(
                  detailsPageRouteName,
                  arguments: person,
                );
              },
            );
          },
        ),
        // #enddocregion ListView
      ),
    );
  }
}

// #docregion DetailsPage
class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // read the person instance from the arguments
    final Person person = ModalRoute.of(
      context,
    )?.settings.arguments as Person;
    // extract the age
    final age = '${person.age} years old';
    return Scaffold(
      // display name and age
      body: Column(children: [Text(person.name), Text(age)]),
    );
  }
}
// #enddocregion DetailsPage
