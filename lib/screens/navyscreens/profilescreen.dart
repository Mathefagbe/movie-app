import 'package:flutter/material.dart';
import 'package:movie_app/const/Circleavarta.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullname = "Joseph";
  String emaildetail = "Fagbemi65@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView(
        children: [
          Text(
            "Profile",
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.maxFinite,
            height: 80,
            child: ListTile(
              contentPadding: const EdgeInsets.all(5),
              leading: avatar,
              title:
                  Text(fullname, style: Theme.of(context).textTheme.headline2),
              subtitle: Text(
                emaildetail,
                style: Theme.of(context).textTheme.headline4,
              ),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: double.maxFinite,
            height: 120,
            child: ListTile(
                leading: Icon(Icons.card_membership),
                title: Text(
                  "Premium Member",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                subtitle: Text(
                  "New movies are coming for you.",
                  style: Theme.of(context).textTheme.headline6,
                )),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    tileMode: TileMode.clamp,
                    stops: [0.1, 0.5],
                    end: Alignment.centerRight,
                    begin: Alignment.centerLeft,
                    colors: [
                      Color.fromARGB(255, 255, 153, 0),
                      Color.fromARGB(207, 249, 228, 2)
                    ]),
                borderRadius: BorderRadius.circular(20)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.maxFinite,
            height: 300,
            child: Column(
              children: [
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(Icons.send_time_extension_rounded),
                  title: const Text("send us feedback"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_sharp)),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(Icons.book_outlined),
                  title: const Text("Terms of use"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_sharp)),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("privacy settings"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_sharp)),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("logout"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_sharp)),
                ),
              ],
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Version"),
                Text("V 1.0.9"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
