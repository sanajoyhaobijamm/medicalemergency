import 'package:flutter/material.dart';
import 'Doctorprofile/doctorprofile.dart';
import 'Model/DoctorCardmodel.dart';
import 'Model/doctormodel.dart';
import 'services/serviceapi.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  final controller_1 = TextEditingController();
  final controller_2 = TextEditingController();
  final controller_3 = TextEditingController();
  final controller_4 = TextEditingController();

  List<DoctorcardModel> doctorcardlist = [];
  List<DoctorModel> doctorlist = [];
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    var _user1 = await ServiceApi().getdoctorcard();
    var _user2 = await ServiceApi().getdoctors();

    setState(() {
      doctorcardlist = _user1!;
      doctorlist = _user2!;
    });
  }

  // ignore: non_constant_identifier_names, recursive_getters
  Object? get Selectedcard => Selectedcard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Choose Your Doctors',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.more_horiz),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorProfilePage(
                                    image: doctorlist[i].image,
                                    doctorname: doctorlist[i].doctorname,
                                    profession: doctorlist[i].profession,
                                    timing: doctorlist[i].timing,
                                    phone: doctorlist[i].phone,
                                  )));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child:
                              Image(image: NetworkImage(doctorlist[i].image))),
                    ),
                  ),
                );
              },
              itemCount: doctorlist.length,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 80,
            child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: ListView.builder(
                    itemCount: doctorcardlist.length,
                    itemBuilder: (c, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorProfilePage(
                                      image: doctorcardlist[i].doctorImagesPath,
                                      doctorname: doctorcardlist[i].doctorName,
                                      profession:
                                          doctorcardlist[i].doctorprofession,
                                      timing: doctorcardlist[i].timing,
                                      phone: doctorcardlist[i].phone)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                // pic of dr
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      doctorcardlist[i].doctorImagesPath,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),

                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //dr name
                                    Text(
                                      doctorcardlist[i].doctorName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    //dr tittle
                                    Text(
                                      doctorcardlist[i].doctorprofession,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      doctorcardlist[i].experience,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
