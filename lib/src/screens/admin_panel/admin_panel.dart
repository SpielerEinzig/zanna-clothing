import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zannas_clothing/src/services/user_database_service.dart';

import '../../widgets/app_drawer.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  late Stream<QuerySnapshot> stream;

  @override
  void initState() {
    super.initState();
    stream = FirebaseFirestore.instance.collection("users").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: Text("Manage users")),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: StreamBuilder<QuerySnapshot>(
            stream: stream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("An error occurred."
                      " If this persists,"
                      " contact the administrator"),
                );
              }

              List<String> docIds = snapshot.data!.docs
                  .map<String>((doc) => doc.id.toString())
                  .toList();

              return SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(64),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(100),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Center(
                            child: Text(
                          "NO.",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        Center(
                            child: Text(
                          "Email",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        Center(
                            child: Text(
                          "Role",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ],
                    ),
                    ...snapshot.data!.docs.map((userDoc) {
                      Map<String, dynamic> data =
                          userDoc.data()! as Map<String, dynamic>;
                      return TableRow(
                        children: <Widget>[
                          Center(
                              child: Text(
                            (docIds.indexOf(userDoc.id) + 1).toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          Center(
                              child: Text(
                            data['email'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                          TextButton(
                            onPressed: () async {
                              await DatabaseService().updateUserRole(
                                  role: data['role'] == "admin"
                                      ? "user"
                                      : "admin",
                                  id: userDoc.id);
                            },
                            child: Center(
                              child: Text(
                                data['role'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
