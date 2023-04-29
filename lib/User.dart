import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'DashboardPages/MessageUserTemplate.dart';

class User {
  //User Profile properties
  static late String username;
  static late String password;
  static late String age;

  static String firstName = "";
  static String lastName = "";
  static String gender = "";
  static String description = "";
  static String curMatchPage = "";
  static String picURL = "";

  //Dont need these anymore
  static List<String> allNames = [];
  static List<String> allPasswords = [];

  //Store important match data might need to move to db
  // ignore: non_constant_identifier_names
  static List<int> Answers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  // ignore: non_constant_identifier_names
  static List<String> Matches = [
    "No current match",
    "No current match",
    "No current match"
  ];
  static List<num> compatibility = [-10.0, -10.0, -10.0];
  static List<MessageUsers> messageSlots = [];

  //Add a new user to database
  static Future<void> addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    //Make new user
//add image file path here
    users.doc(username).set({
      'username': username,
      'password': password,
      'firstname': firstName,
      'lastname': lastName,
      'age': age,
      'description': description,
      'gender': gender,
      'picURL': picURL,
      'Answer01': Answers[0],
      'Answer02': Answers[1],
      'Answer03': Answers[2],
      'Answer04': Answers[3],
      'Answer05': Answers[4],
      'Answer06': Answers[5],
      'Answer07': Answers[6],
      'Answer08': Answers[7],
      'Answer09': Answers[8],
      'Answer10': Answers[9],
      'Answer11': Answers[10],
      'Answer12': Answers[11],
      'Answer13': Answers[12],
      'Answer14': Answers[13],
      'Answer15': Answers[14],
    });

    //Add messages subcollection
    for (int i = 1; i < 4; i++) {
      users.doc(username).collection("matches").doc("Match0$i").set({
        'username': "No current match",
        'percent': -10.0,
        'Match0$i': 'Match0$i'
      });
    }
  }

  //Calculate compatibility
  //parameter: numMatches, put in how many matches you want to find,
  //  useful for when you delete one match and need to replace it
  //return: list of top 5 matches, some info to identify user
  //Only find matches for opposite gender
  static void findMatches() {
    //get all documents in collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.get().then((res) =>
        //loop through documents using res.docs.forEach
        // ignore: avoid_function_literals_in_foreach_calls
        res.docs.forEach((element) {
          //Check if it is your own doc, make a doc reference for later use in math
          if (element.get("username") != username &&
              gender != element.get("gender")) {
            //sum up answers using math below
            num one = 6 - (Answers[0] - element.get("Answer01")).abs();
            num two = 6 - (Answers[1] - element.get("Answer02")).abs();
            num three = 6 - (Answers[2] - element.get("Answer03")).abs();
            num four = 6 - (Answers[2] - element.get("Answer04")).abs();
            num five = 6 - (Answers[2] - element.get("Answer05")).abs();
            num six = 6 - (Answers[2] - element.get("Answer06")).abs();
            num seven = 6 - (Answers[2] - element.get("Answer07")).abs();
            num eight = 6 - (Answers[2] - element.get("Answer08")).abs();
            num nine = 6 - (Answers[2] - element.get("Answer09")).abs();
            num ten = 6 - (Answers[2] - element.get("Answer10")).abs();
            num eleven = 6 - (Answers[2] - element.get("Answer11")).abs();
            num twelve = 6 - (Answers[2] - element.get("Answer12")).abs();
            num thirteen = 6 - (Answers[2] - element.get("Answer13")).abs();
            num fourteen = 6 - (Answers[2] - element.get("Answer14")).abs();
            num fifteen = 6 - (Answers[2] - element.get("Answer15")).abs();
            num sum = one +
                two +
                three +
                four +
                five +
                six +
                seven +
                eight +
                nine +
                ten +
                eleven +
                twelve +
                thirteen +
                fourteen +
                fifteen;
            //compare compatibility with previous highest compatibilities, if higher update both lists
            //Only match guy to girl, vice versa
            //No repeat matches
//Dont need to check gender here
            if (sum > compatibility[0] && gender != element.get("gender")) {
              //Transfer match 1 to match 2, and match 2 to match 3
              Matches[2] = Matches[1];
              Matches[1] = Matches[0];
              Matches[0] = element.get("username");

              compatibility[2] = compatibility[1];
              compatibility[1] = compatibility[0];
              compatibility[0] = sum;
            } else if (sum > compatibility[1] &&
                gender != element.get("gender")) {
              Matches[2] = Matches[1];
              Matches[1] = element.get("username");

              compatibility[2] = compatibility[1];
              compatibility[1] = sum;
            } else if (sum > compatibility[2] &&
                gender != element.get("gender")) {
              Matches[2] = element.get("username");
              compatibility[2] = sum;
            }
          }
        }));
  }

  static void shareMatches() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //Add to db once, instead of many times in if statements
    for (int i = 1; i < 4; i++) {
      //If match is no current match ignore it
      //WARNING: if there is no one else in db, the first person will
      //not have subcollections made for them
      if (Matches[i - 1] != "No current match") {
        users.doc(username).collection('matches').doc('Match0$i').update({
          'username': Matches[i - 1],
          'percent': compatibility[i - 1] / 100,
          'Match0$i': 'Match0$i'
        });
        //Add messages subcollection
        users
            .doc(username)
            .collection("messages")
            .doc(Matches[i - 1])
            .set({'match': Matches[i - 1]});
        users
            .doc(username)
            .collection("messages")
            .doc(Matches[i - 1])
            .collection('matchConvo')
            .doc()
            .set({
          'message': "Hi, my name is $firstName",
          'time': Timestamp.now(),
          'type': "sender"
        });

        //Add message subcollection to our current match
        users
            .doc(Matches[i - 1])
            .collection("messages")
            .doc(username)
            .set({'match': username});
        users
            .doc(Matches[i - 1])
            .collection("messages")
            .doc(username)
            .collection('matchConvo')
            .doc()
            .set({
          'message': "Hi, my name is ${Matches[i - 1]}",
          'time': Timestamp.now(),
          'type': "sender"
        });

        //update message in our matches messages
        users
            .doc(Matches[i - 1])
            .collection("messages")
            .doc(username)
            .collection('matchConvo')
            .doc()
            .set({
          'message': "Hi, my name is $firstName",
          'time': Timestamp.now(),
          'type': "receiver"
        });

        //update message in our messages
        users
            .doc(username)
            .collection("messages")
            .doc(Matches[i - 1])
            .collection('matchConvo')
            .doc()
            .set({
          'message': "Hi, my name is ${Matches[i - 1]}",
          'time': Timestamp.now(),
          'type': "receiver"
        });

        //Update the matches collection for the current match
        //Make this a separate function so matchChange can use it too
        //and so you can keep the demons away
        List<String> names = [
          "No current match",
          "No current match",
          "No current match"
        ];
        List<num> nums = [-10.0, -10.0, -10.0];
        users
            .doc(Matches[i - 1])
            .collection('matches')
            .doc('Match01')
            .get()
            .then((element) => {
                  names[0] = element.get('username'),
                  nums[0] = element.get('percent')
                });
        users
            .doc(Matches[i - 1])
            .collection('matches')
            .doc('Match02')
            .get()
            .then((element) => {
                  names[1] = element.get('username'),
                  nums[1] = element.get('percent')
                });
        users
            .doc(Matches[i - 1])
            .collection('matches')
            .doc('Match03')
            .get()
            .then((element) => {
                  names[2] = element.get('username'),
                  nums[2] = element.get('percent')
                });

        //Now update the match order
//first match often incorrectly calculated, fix that later with queries see below
        final timer = Timer(
          const Duration(seconds: 2),
          () {
            if (compatibility[i - 1] > nums[0]) {
              if (names[2] != "No current match") {
                //Add a new document with Match03's info
                users.doc(Matches[i - 1]).collection('matches').doc().set({
                  'username': names[2],
                  'percent': nums[2],
                  'Match0$i': 'Match0$i'
                });
              }
              if (names[1] != "No current match") {
                //Update Match03 with Match02, then
                users
                    .doc(Matches[i - 1])
                    .collection('matches')
                    .doc('Match03')
                    .update({'username': names[1], 'percent': nums[1]});
              }
              if (names[0] != "No current match") {
                //Update Match02 with Match01, then
                users
                    .doc(Matches[i - 1])
                    .collection('matches')
                    .doc('Match02')
                    .update({'username': names[0], 'percent': nums[0]});
              }
              //Update Match01 with username and compatibility[i - 1] / 100
              users
                  .doc(Matches[i - 1])
                  .collection('matches')
                  .doc('Match01')
                  .update({
                'username': username,
                'percent': compatibility[i - 1] / 100
              });
            } else if (compatibility[i - 1] > nums[1]) {
              if (names[2] != "No current match") {
                //Add a new document with Match03's info
                users.doc(Matches[i - 1]).collection('matches').doc().set({
                  'username': names[2],
                  'percent': nums[2],
                  'Match0$i': 'Match0$i'
                });
              }
              if (names[1] != "No current match") {
                //Update Match03 with Match02, then
                users
                    .doc(Matches[i - 1])
                    .collection('matches')
                    .doc('Match03')
                    .update({'username': names[1], 'percent': nums[1]});
              }
              //Update Match02 with username and compatibility[i - 1] / 100
              users
                  .doc(Matches[i - 1])
                  .collection('matches')
                  .doc('Match02')
                  .update({
                'username': username,
                'percent': compatibility[i - 1] / 100
              });
            } else if (compatibility[i - 1] > nums[2]) {
              if (names[2] != "No current match") {
                //Add a new document with Match03's info
                users.doc(Matches[i - 1]).collection('matches').doc().set({
                  'username': names[2],
                  'percent': nums[2],
                  'Match0$i': 'Match0$i'
                });
              }
              //Update Match03 with username and compatibility[i - 1] / 100
              users
                  .doc(Matches[i - 1])
                  .collection('matches')
                  .doc('Match03')
                  .update({
                'username': username,
                'percent': compatibility[i - 1] / 100
              });
            }
          },
        );
      }
    }
    //Correct way to order matches
    /*users
        .doc(username)
        .collection('matches')
        .orderBy('percent', descending: true);
    int j = 0;
    users
        .doc(username)
        .collection('matches')
        .orderBy('percent', descending: true)
        .limit(3)
        .get()
        .then((doc) => doc.docs.forEach((element) {
              Matches[j] = element.get('username');
              j++;
            }));*/
  }

//check if new matches are in database, add message stuff like above for them
  //Add message buttons for every match in current user's match subcollection
  static void addMessageSlots() {
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    //One match case
    if (Matches[1] == "No current match") {
      String user = "";
      String last = "";
      String url = "";
      String percent = "";
      userCollection.doc(Matches[0]).get().then((value) => {
            user = value.get('username'),
            last = value.get('lastname'),
            url = value.get('picURL')
          });

      /*userCollection
          .doc(username)
          .collection('matches')
          .doc('Match01')
          .get()
          .then((value) => percent = value.get('percent').toString());*/
      final timer = Timer(const Duration(seconds: 2), () {
        messageSlots.add(MessageUsers(
            firstName: user, lastName: last, url: url /*, percent: percent*/));
      });
      //Two match case
    } else if (Matches[2] == "No current match") {
      String user = "";
      String last = "";
      String user2 = "";
      String last2 = "";
      String url1 = "";
      String url2 = "";
      String percent = "";

      userCollection.doc(Matches[0]).get().then((value1) => {
            user = value1.get('username'),
            last = value1.get('lastname'),
            url1 = value1.get('picURL')
          });
      final timer1 = Timer(const Duration(seconds: 2), () {
        messageSlots.add(MessageUsers(
            firstName: user, lastName: last, url: url1 /*, percent: percent*/));
      });

      userCollection.doc(Matches[1]).get().then((value2) => {
            user2 = value2.get('username'),
            last2 = value2.get('lastname'),
            url2 = value2.get('picURL')
          });
      final timer2 = Timer(const Duration(seconds: 2), () {
        messageSlots.add(MessageUsers(
            firstName: user2,
            lastName: last2,
            url: url2 /*, percent: percent*/));
      });
      //Three or more match case
    } else {
      userCollection
          .doc(username)
          .collection('matches')
          .get()
          .then((element1) => {
                element1.docs.forEach((element2) {
                  String user = "";
                  String last = "";
                  String url = "";
                  String percent = "";
                  userCollection
                      .doc(element2.get('username'))
                      .get()
                      .then((value) => {
                            user = value.get('username'),
                            last = value.get('lastname'),
                            url = value.get('picURL')
                          });

                  /*userCollection
                      .doc(username)
                      .collection('matches')
                      .doc('Match01')
                      .get()
                      .then(
                          (value) => percent = value.get('percent') as String);*/
                  final timer = Timer(const Duration(seconds: 1), () {
                    messageSlots.add(MessageUsers(
                        firstName: user,
                        lastName: last,
                        url: url /*, percent: percent*/));
                  });
                })
              });
    }
  }
  //old algorithm for checking if matches messages were updated, not needed
  //shows how to query and use query data
  //check if match is in messages, add it if its not there
  /*final matchExist = userCollection
          .doc(Matches[0])
          .collection('messages')
          .where('match', arrayContains: username)
          .get();
      matchExist.then((value) => {
            if (value.docs.isEmpty)
              {
                userCollection
                    .doc(Matches[0])
                    .collection("messages")
                    .doc(username)
                    .set({'match': username}),
                userCollection
                    .doc(Matches[0])
                    .collection("messages")
                    .doc(username)
                    .collection('matchConvo')
                    .doc()
                    .set({
                  'message': "Nice to meet you, $firstName. How are you today?",
                  'time': Timestamp.now(),
                  'type': "sender"
                })
              }
          });*/

  //Use this to find number of documents in collection
  //https://firebase.google.com/docs/firestore/query-data/aggregation-queries#:~:text=Cloud%20Firestore%20supports%20the%20count,in%20a%20collection%20or%20query.
  //Use this to get all documents, then use above link to iterate through them checking
  //looking at the answers for each
  //https://firebase.google.com/docs/firestore/query-data/get-data#get_all_documents_in_a_collection

  //Set first name
  static void setFirst(String name) {
    firstName = name;
  }

  //Set last name
  static void setLast(String name) {
    lastName = name;
  }

  //Set age
  static void setAge(String ageChange) {
    age = ageChange;
  }

  //Set description
  static void setDesc(String desc) {
    description = desc;
  }

  //Set username
  static void setUsername(String name) {
    username = name;
    allNames.add(username);
  }

  //Set password
  static void setPassword(String name) {
    password = name;
    allPasswords.add(password);
  }

  //Change Gender
  static void changeGender(String sex) {
    gender = sex;
  }

  //Set picture URL
  static void setPic(String url) {
    picURL = url;
  }

  //Add question answers into list
  static void addAnswer1(int answer) {
    Answers[0] = answer;
  }

  static void addAnswer2(int answer) {
    Answers[1] = answer;
  }

  static void addAnswer3(int answer) {
    Answers[2] = answer;
  }

  static void addAnswer4(int answer) {
    Answers[3] = answer;
  }

  static void addAnswer5(int answer) {
    Answers[4] = answer;
  }

  static void addAnswer6(int answer) {
    Answers[5] = answer;
  }

  static void addAnswer7(int answer) {
    Answers[6] = answer;
  }

  static void addAnswer8(int answer) {
    Answers[7] = answer;
  }

  static void addAnswer9(int answer) {
    Answers[8] = answer;
  }

  static void addAnswer10(int answer) {
    Answers[9] = answer;
  }

  static void addAnswer11(int answer) {
    Answers[10] = answer;
  }

  static void addAnswer12(int answer) {
    Answers[11] = answer;
  }

  static void addAnswer13(int answer) {
    Answers[12] = answer;
  }

  static void addAnswer14(int answer) {
    Answers[13] = answer;
  }

  static void addAnswer15(int answer) {
    Answers[14] = answer;
  }

  //Make a method to delete items from list (MAYBE)

}

// old check username and password methods

//search through db instead
/*static List<String> checkLogin(String username, String password) {
    List<String> identifiers = ["", ""];
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users.get().then((res) => {
          res.docs.forEach((element) {
            //print(element.get("username"));
            //print(username);
            //print(element.get("password"));
            //print(password);
            if (element.get("username") == username &&
                element.get("password") == password) {
              identifiers.add(element.get("username"));
              identifiers.add(element.get("password"));
              print("TRUE");
            }
          })
        });
    return identifiers;
  }*/

//Check if the username is already taken
/*static bool checkRegister(String username) {
    if (allNames.contains(username)) {
      return false;
    }
    return true;
  }*/



//___________________________________________________

//old get matches info algorithm

/*users
                    .doc(Matches[i - 1])
                    .collection('matches')
                    .get()
//somehow "no current matches is getting in here"
                    .then((docList) => docList.docs.forEach((element) {
//Might need to parse here to get it to equal match01 ugh icky
                          //This line is erroring, giving incorrect stuff
                          if (element.get('Match0$i') == 'Match03') {
                            names[2] = element.get('username');
                            nums[2] = element.get('percent');
                          } else if (element.get('Match0$i') == 'Match02') {
                            names[1] = element.get('username');
                            nums[1] = element.get('percent');
                          } else if (element.get('Match0$i') == 'Match01') {
                            names[0] = element.get('username');
                            nums[0] = element.get('percent');
                          }
                        }));
                        */

//_________________________________________________

//old matching algorithm, had recursion problems

/*
                int count = 0;
                //Get usernames and percents from top 3 matches in the matches matches list
                users
                    .doc(Matches[i - 1])
                    .collection('matches')
                    .doc('Match01')
                    .get()
                    .then(
                  (DocumentSnapshot doc1) {
                    //Data is organized with 'Match0x' at 0, percent at 1, and username at 2
                    final data1 = doc1.data() as Map<String, dynamic>;
                    users
                        .doc(Matches[i - 1])
                        .collection('matches')
                        .doc('Match02')
                        .get()
                        .then(
                      (DocumentSnapshot doc2) {
                        final data2 = doc2.data() as Map<String, dynamic>;
                        users
                            .doc(Matches[i - 1])
                            .collection('matches')
                            .doc('Match02')
                            .get()
                            .then(
                          (DocumentSnapshot doc3) {
                            //Data is organized with 'Match0x' at 0, percent at 1, and username at 2
                            final data3 = doc3.data() as Map<String, dynamic>;
                            if (count == 0) {
                              if (compatibility[i - 1] >
                                  num.parse(data1['percent'])) {
                                //Add a new document with Match03's info
                                //only do this once, make flag or something
                                if (data3['username'] != "No current match") {
                                  users
                                      .doc(Matches[i - 1])
                                      .collection('matches')
                                      .doc()
                                      .set({
                                    'username': data3['username'],
                                    'percent': data3['percent']
                                  });
                                }
                                //Update Match03 with Match02, then
                                if (data2['username'] != "No current match") {
                                  users
                                      .doc(Matches[i - 1])
                                      .collection('matches')
                                      .doc('Match03')
                                      .update({
                                    'username': data2['username'],
                                    'percent': data2['percent']
                                  });
                                }
                                //Update Match02 with Match01, then
                                users
                                    .doc(Matches[i - 1])
                                    .collection('matches')
                                    .doc('Match02')
                                    .update({
                                  'username': data1['username'],
                                  'percent': data1['percent']
                                });
                                //Update Match01 with username and compatibility[i - 1] / 100
                                users
                                    .doc(Matches[i - 1])
                                    .collection('matches')
                                    .doc('Match01')
                                    .update({
                                  'username': username,
                                  'percent': compatibility[i - 1] / 100
                                });
                                count++;
                              } else if (compatibility[i - 1] >
                                  num.parse(data2['percent'])) {
                                //Add a new document with Match03's info
                                if (data3['username'] != "No current match") {
                                  users
                                      .doc(Matches[i - 1])
                                      .collection('matches')
                                      .doc()
                                      .set({
                                    'username': data3['username'],
                                    'percent': data3['percent']
                                  });
                                }
                                //Update Match03 with Match02, then
                                if (data2['username'] != "No current match") {
                                  users
                                      .doc(Matches[i - 1])
                                      .collection('matches')
                                      .doc('Match03')
                                      .update({
                                    'username': data2['username'],
                                    'percent': data2['percent']
                                  });
                                }
                                //Update Match02 with username and compatibility[i - 1] / 100
                                users
                                    .doc(Matches[i - 1])
                                    .collection('matches')
                                    .doc('Match02')
                                    .update({
                                  'username': username,
                                  'percent': compatibility[i - 1] / 100
                                });
                                count++;
                              } else if (compatibility[i - 1] >
                                  num.parse(data3['percent'])) {
                                //Add a new document with Match03's info
                                if (data3['username'] != "No current match") {
                                  users
                                      .doc(Matches[i - 1])
                                      .collection('matches')
                                      .doc()
                                      .set({
                                    'username': data3['username'],
                                    'percent': data3['percent']
                                  });
                                }
                                //Update Match03 with username and compatibility[i - 1] / 100
                                users
                                    .doc(Matches[i - 1])
                                    .collection('matches')
                                    .doc('Match03')
                                    .update({
                                  'username': username,
                                  'percent': compatibility[i - 1] / 100
                                });
                                count++;
                              }
                            }
                          },
                        );
                      },
                    );
                  },
                );*/