import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqlite_employee_app/db_helper.dart';
import 'package:sqlite_employee_app/screens/login_screen.dart';

import '../employee_model.dart';
import 'employee_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool trueSubmit = false;
  DBHelper? dbHelper;
  final nameCtr = TextEditingController();
  final ageCtr = TextEditingController();
  final cntCtr = TextEditingController();
  final jobCtr = TextEditingController();
  final cityCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final genCtr = TextEditingController();
  final marCtr = TextEditingController();
  final ssnCtr = TextEditingController();

  late Future<List<EmpModel>> employeeList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    setState(() {});
    loadData();
  }

  loadData() async {
    employeeList = dbHelper!.getEmployeeList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xffECE3CE),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Are you sure you want to logout?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text("YES")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("NO")),
                          ],
                        );
                      });
                },
                icon: Icon(
                  Icons.logout_rounded,
                  color: Color(0xffECE3CE),
                ))
          ],
          backgroundColor: Color(0xff4F6F52),
          elevation: 10,
          title: const Text(
            "EMPLOYEE DETAILS",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xffECE3CE)),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: FutureBuilder(
              future: employeeList,
              builder: (context, AsyncSnapshot<List<EmpModel>> snapshot) {
                if (snapshot.hasData || snapshot.data != null) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 4,
                    ),
                    // reverse: true,
                    // shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(snapshot.data![index].id!);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeeDetailsScreen(
                                data: snapshot.data![index],
                                id: snapshot.data![index].id!,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          color: Color(0xffD2E3C8),
                          // width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 8),
                          elevation: 19,
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xff3A4D39),
                                    child: Center(
                                      child: Text(
                                        snapshot.data![index].name
                                            .substring(0, 1)
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffECE3CE)),
                                      ),
                                    ),
                                    radius: 40,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${snapshot.data?[index].name.toString()}",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                  Text(
                                    "${snapshot.data?[index].contact.toString()}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 16),
                                  ),
                                  Text(
                                    "${snapshot.data?[index].jobName.toString()}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0XFF739072),
          onPressed: () {
            print("float button pressed");
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text("Enter Employee Details"),
                    content: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameCtr,
                              decoration: const InputDecoration(
                                labelText: "Employee Name",
                                icon: Icon(Icons.account_box_rounded),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: ageCtr,
                              decoration: const InputDecoration(
                                labelText: "Employee Age",
                                icon: Icon(Icons.numbers_rounded),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: cntCtr,
                              decoration: const InputDecoration(
                                labelText: "Employee Contact",
                                icon: Icon(Icons.phone),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: jobCtr,
                              decoration: const InputDecoration(
                                labelText: "Employee Job Profile",
                                icon: Icon(Icons.work_rounded),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: cityCtr,
                              decoration: const InputDecoration(
                                labelText: "Employee City",
                                icon: Icon(Icons.location_city_rounded),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: genCtr,
                              decoration: const InputDecoration(
                                labelText: "Employee Gender",
                                icon: Icon(Icons.question_mark_rounded),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: emailCtr,
                              decoration: const InputDecoration(
                                labelText: "Employee Email",
                                icon: Icon(Icons.email_rounded),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: ssnCtr,
                              decoration: const InputDecoration(
                                labelText: "Employee SSN",
                                icon: Icon(
                                    Icons.format_list_numbered_rtl_rounded),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: marCtr,
                              decoration: const InputDecoration(
                                labelText: "Employee Marital Status",
                                icon: Icon(Icons.radio_button_off),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            "Are you sure you want to submit?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                              setState(() {
                                                trueSubmit = false;
                                              });
                                            },
                                            child: const Text("NO"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              dbHelper!
                                                  .insert(EmpModel(
                                                      name: nameCtr.text,
                                                      age: ageCtr.text,
                                                      contact: cntCtr.text,
                                                      jobName: jobCtr.text,
                                                      city: cityCtr.text,
                                                      email: emailCtr.text,
                                                      gender: genCtr.text,
                                                      maritalStatus:
                                                          marCtr.text,
                                                      socialSecNum:
                                                          ssnCtr.text))
                                                  .then((value) {
                                                print(
                                                    "data added into database");
                                                employeeList =
                                                    dbHelper!.getEmployeeList();
                                              }).onError((error, stackTrace) {
                                                print(error.toString());
                                              });
                                              Fluttertoast.showToast(
                                                  backgroundColor:
                                                      Colors.black12,
                                                  msg:
                                                      "Employee Details Added");
                                              nameCtr.clear();
                                              ageCtr.clear();
                                              cityCtr.clear();
                                              emailCtr.clear();
                                              jobCtr.clear();
                                              genCtr.clear();
                                              cntCtr.clear();
                                              emailCtr.clear();
                                              ssnCtr.clear();
                                              marCtr.clear();

                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetailsScreen()));
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                              setState(() {
                                                trueSubmit = true;
                                              });
                                            },
                                            child: const Text("YES"),
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: const Text("Submit"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          child: const Icon(
            Icons.add,
            color: Color(0xffECE3CE),
          ),
        ),
      ),
    );
  }
}
