import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  //Static has to go once db in, it no good

  //User Profile properties
  static late String username;
  static late String password;
  static late String age;

  static String firstName = "";
  static String lastName = "";
  static String gender = "";
  static String description = "";

  //Dont need these anymore
  static List<String> allNames = [];
  static List<String> allPasswords = [];

  //Store important match data might need to move to db
  static List<int> Answers = [];
  static List<String> Matches = [
    "No current matches",
    "No current matches",
    "No current Matches"
  ];
  static List<num> compatibility = [-10000, -10000, -10000];

  //Add a new user to database
  static Future<void> addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    //Make new user
    users
        .doc(username)
        .set({
          'username': username,
          'password': password,
          'firstname': firstName,
          'lastname': lastName,
          'age': age,
          'description': description,
          'gender': gender,
          'Answer01': Answers[0],
          'Answer02': Answers[1],
          'Answer03': Answers[2]
        })
//These next two lines can be commented out after testing
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
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
        res.docs.forEach((element) {
          //sum up answers using math below
          num one = 4 - (Answers[0] - element.get("Answer01"));
          num two = 4 - (Answers[1] - element.get("Answer02"));
          num three = 4 - (Answers[2] - element.get("Answer03"));
          num sum = one + two + three;
          //compare compatibility with previous highest compatibilities, if higher update both lists
          if (sum > compatibility[0]) {
            compatibility[0] = sum;
            Matches[0] = element.get("username");
          } else if (sum > compatibility[1]) {
            compatibility[1] = sum;
            Matches[1] = element.get("username");
          } else if (sum > compatibility[2]) {
            compatibility[2] = sum;
            Matches[2] = element.get("username");
          }
        }));
  }
  //Use this to find number of documents in collection
  //https://firebase.google.com/docs/firestore/query-data/aggregation-queries#:~:text=Cloud%20Firestore%20supports%20the%20count,in%20a%20collection%20or%20query.
  //Use this to get all documents, then use above link to iterate through them checking
  //looking at the answers for each
  //https://firebase.google.com/docs/firestore/query-data/get-data#get_all_documents_in_a_collection

  // check username and password
//search through db instead
  static Future<bool> checkLogin(String username, String password) {
    Future<bool> temp = false as Future<bool>;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Future.delayed(
        const Duration(seconds: 2),
        () => users.get().then((res) => {
              res.docs.forEach((element) {
                print(element.get("username"));
                print(username);
                print(element.get("password"));
                print(password);
                if (element.get("username") == username &&
                    element.get("password") == password) {
                  temp = true as Future<bool>;
                  print("TRUE");
                }
              })
            }));
    return temp;
  }

  //Check if the username is already taken
  static bool checkRegister(String username) {
    if (allNames.contains(username)) {
      return false;
    }
    return true;
  }

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

  //Add question answers into list
  static void addAnswer(int answer) {
    Answers.add(answer);
  }

  //Change Gender
  static void changeGender(String sex) {
    gender = sex;
  }

  //Make a method to delete items from list

}
