import 'dart:core';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class CT_METERS extends StatefulWidget {
  const CT_METERS({super.key});

  @override
  State<CT_METERS> createState() => _CT_METERSState();
}

class _CT_METERSState extends State<CT_METERS> {
  String? selectedDivision;
  String? selectedSubDivision;
  String? selectedSection;
  DateTime? selectedDate;

  String? selectedService;

  String? selectedComplaint1;
  String? selectedComplaint2;
  String? selectedComplaint3;
  String? selectedSecurity;
  String? selectedMeterRatio;
  String? selectedMeterMakeName;
  String? selectMeterWarranty;
  String? meterSatisfaction;

  final TextEditingController _controllerPO = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _meter_serial_no = TextEditingController();
  final TextEditingController _kwh = TextEditingController();

  final TextEditingController _kvah = TextEditingController();
  final TextEditingController _md = TextEditingController();
  final TextEditingController _kwhError = TextEditingController();
  final TextEditingController _importKWH = TextEditingController();
  final TextEditingController _exportKWH = TextEditingController();
  final TextEditingController _importKVAH = TextEditingController();
  final TextEditingController _exportKVAH = TextEditingController();
  final TextEditingController _importMD = TextEditingController();
  final TextEditingController _exportMD = TextEditingController();
  final TextEditingController _remarks = TextEditingController();
  final TextEditingController _kwhErrorInSolar = TextEditingController();

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Validation"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
bool isChecked=false;
 

  void _checkField() {
    if (selectedDivision == null || selectedDivision!.isEmpty) {
      _showAlertDialog("Please Select your Division !");
    } else if (selectedSubDivision == null || selectedSubDivision!.isEmpty) {
      _showAlertDialog("Please Select your Sub Division !");
    } else if (selectedSection == null || selectedSection!.isEmpty) {
      _showAlertDialog("Please Select your Section !");
    } 
     else if (selectedDate == null) {
      _showAlertDialog("Please Select Date of Inspection");
    }
    else if (selectedComplaint1 == null || selectedComplaint1!.isEmpty) {
      _showAlertDialog("Please Select Complaint  !");
    } else if (selectedComplaint2 == null || selectedComplaint2!.isEmpty) {
      _showAlertDialog("Please Select Complaint!");
    } else if (selectedComplaint3 == null || selectedComplaint3!.isEmpty) {
      _showAlertDialog("Please Select Complaint !");
    }
    // else if (selectedService == null || selectedService!.isEmpty) {
    //   _showAlertDialog("Please Select your Service !");
    // } 
    else if (selectedMeterMakeName == null ||
        selectedMeterMakeName!.isEmpty) {
      _showAlertDialog("Please Select Your Meter Make Name");
    } else if (_meter_serial_no.text.trim().isEmpty) {
      _showAlertDialog("Please enter Meter Serial NO.");
    } else if (selectedMeterRatio == null || selectedMeterRatio!.isEmpty) {
      _showAlertDialog("Please Select Meter Ratio");
    } else if (selectMeterWarranty == null || selectMeterWarranty!.isEmpty) {
      _showAlertDialog("Please Select Your Meter Warranty");
    } else if (_controllerPO.text.trim().isEmpty) {
      _showAlertDialog("Please Enter Your PO");
    } 
    else if (!isChecked && _kwh.text.trim().isEmpty) {
      _showAlertDialog("Please Enter KWH");
    } else if (!isChecked && _kvah.text.trim().isEmpty) {
      _showAlertDialog("Please Enter KVAH");
    } else if (!isChecked &&  _md.text.trim().isEmpty) {
      _showAlertDialog("Please Enter MD");
    } else if (!isChecked &&  _kwhError.text.trim().isEmpty) {
      _showAlertDialog("Please Enter KWH ERROR");
    } else if (!isChecked &&  meterSatisfaction == null || meterSatisfaction!.isEmpty) {
      _showAlertDialog("Please Check the METER SATISFACTION");
    } 
    
    else if (isChecked &&  _importKWH.text.trim().isEmpty) {
      _showAlertDialog("Please Enter IMPORT KWH ");
    } else if (isChecked &&  _exportKWH.text.trim().isEmpty) {
      _showAlertDialog("Please Enter EXPORT  KWH");
    } else if (isChecked &&  _importKVAH.text.trim().isEmpty) {
      _showAlertDialog("Please Enter IMPORT KVAH");
    } else if (isChecked &&  _exportKVAH.text.trim().isEmpty) {
      _showAlertDialog("Please Enter EXPORT  KAVH");
    } else if (isChecked &&  _importMD.text.trim().isEmpty) {
      _showAlertDialog("Please Enter IMPORT  MD");
    } else if (isChecked &&  _exportMD.text.trim().isEmpty) {
      _showAlertDialog("Please Enter EXPORT  MD");
    } else if (isChecked &&  _kwhErrorInSolar.text.trim().isEmpty) {
      _showAlertDialog("Please Enter KWH ERROR IN SOLAR");
    } else if (isChecked &&  meterSatisfaction == null || meterSatisfaction!.isEmpty) {
      _showAlertDialog("Please Check the METER SATISFACTION");
    } else if (_remarks.text.trim().isEmpty) {
      _showAlertDialog("Please fill the REMARKS");
    }  else {
      _showAlertDialog("All Fields is filled ✅");
    }
  }

  //for dropdown code
  List<String> selectDivision = [
    "SELECT",
    "HANAMKONDA TOWN",
    "HANAMKONDA RURAL",
  ];
  List<String> selectSubDivision = [
    "SELECT",
    "KAZIPET",
    "HANAMKONDA",
    "NAYEEMANAGAR",
  ];
  List<String> selectSection = [
    "SELECT",
    "NIT",
    "MADIKONDA",
    "KAZIPET",
    "KADIPIKONDA",
    "WADDEPALLY",
  ];
  //

  final InputDecoration myTextFieldDecoration = const InputDecoration(
    border: UnderlineInputBorder(),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 4),
  );

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

 

  @override
  void initState() {
    super.initState();
    selectedComplaint3 = "Not Applicable";
    selectedComplaint2 = "Not Applicable";
  }

 
  List<String> allData = [
    "Alpha",
    "Beta",
    "Gamma",
    "Delta",
    "Epsilon",
    "Zeta",
    "Theta",
    "Iota",
    "Kappa",
  ]; // Sample data
  List<String> filteredData = [];
  void _openSearchDialog() {
    filteredData = List.from(allData);

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Search Service Details"),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: "Search...",
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setDialogState(() {
                          filteredData = allData
                              .where(
                                (item) => item.toLowerCase().contains(
                                  value.toLowerCase(),
                                ),
                              )
                              .toList();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filteredData[index]),
                            onTap: () {
                              // Update parent dropdown
                              setState(() {
                                selectedService = filteredData[index];
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 156, 188),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('CT METERS', style: TextStyle(fontSize: 18)),
            Text(
              'COMPLAINT',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "SECTION DETAILS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Division Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SELECT DIVISION",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedDivision,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: selectDivision
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDivision = value;
                            selectedSubDivision = null;
                            //selectSubDivision[0]; // reset next
                            selectedSection = null; // reset third
                          });
                        },
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SELECT SUB-DIVISION",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedSubDivision,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: selectSubDivision
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: selectedDivision == null
                            ? null
                            : (value) {
                                setState(() {
                                  selectedSubDivision = value;
                                  selectedSection = null;
                                  // selectedSection = selectSection[0];
                                });
                              },
                      ),

                      const SizedBox(height: 12),

                      // Status Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SELECT SECTION",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedSection,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: selectSection
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: selectedSubDivision == null
                            ? null
                            : (value) {
                                setState(() {
                                  selectedSection = value;
                                });
                              },
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Date of Inspection",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: _pickDate,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            selectedDate != null
                                ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                : "TAP HERE",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "WORK DETAILS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Division Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "NATURE OF COMPLAINT",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedComplaint1,
                        decoration: InputDecoration(
                          hintText: "Select",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items:
                            [
                                  "Cable Change",
                                  "Phase down Rectification",
                                  "Phase down-Meter Replaced",
                                  "No Display-Meter Replaced",
                                  "Meter Burnt-Meter Replaced",
                                  "Meter Burnt-Meter(No Display) Replaced",
                                  "Meter Defective-Meter Replaced",
                                ]
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedComplaint1 = value;
                          });
                        },
                      ),

                      // ),
                      const SizedBox(height: 12),

                      // Sub-Division Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "NATURE OF COMPLAINT 2",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedComplaint2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items:
                            [
                                  "Not Applicable",
                                  "Cable Change",
                                  "Phase down Rectification",
                                  "Phase down-Meter Replaced",
                                  "No Display-Meter Replaced",
                                  "Meter Burnt-Meter Replaced",
                                  "Meter Burnt-Meter(No Display) Replaced",
                                  "Meter Defective-Meter Replaced",
                                ]
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedComplaint2 = value;
                          });
                        },
                      ),

                      //),
                      const SizedBox(height: 12),

                      // Status Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "NATURE OF COMPLAINT 3",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedComplaint3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items:
                            [
                                  "Not Applicable",
                                  "Cable Change",
                                  "Phase down Rectification",
                                  "Phase down-Meter Replaced",
                                  "No Display-Meter Replaced",
                                  "Meter Burnt-Meter Replaced",
                                  "Meter Burnt-Meter(No Display) Replaced",
                                  "Meter Defective-Meter Replaced",
                                ]
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedComplaint3 = value;
                          });
                        },
                      ),

                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),

              //third card
              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "SERVICE DETAILS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SERVICE NO",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField2<String>(
                              value: selectedService,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(color: Colors.red),
                                border: OutlineInputBorder(),
                              ),
                              items: allData
                                  .map(
                                    (status) => DropdownMenuItem(
                                      value: status,
                                      child: Text(status),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedService = value;
                                });
                              },
                            ),
                          ),

                          const SizedBox(width: 8),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.rectangle,
                            ),
                            child: IconButton(
                              onPressed: _openSearchDialog,
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Divider(color: Colors.grey.shade300, thickness: 1),

                      Row(
                        children: [
                          Text("SC.NO/USCNO"),
                          Spacer(),
                          Text("22 22 129371/15855182"),
                        ],
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),
                      Row(
                        children: [
                          Text("NAME"),
                          Spacer(),
                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.end, // align right
                            children: [
                              Text("OWNERS WELFARE ASSOCIATION"),
                              Text("AMI"),
                            ],
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),
                      Row(children: [Text("CAT/MF"), Spacer(), Text("1/1.0")]),
                      Divider(color: Colors.grey.shade300, thickness: 1),
                      Row(
                        children: [
                          Text("DISTRIBUTION"),
                          Spacer(),
                          Text("12221-NAGENDRA NAGAR"),
                        ],
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),
                      Row(children: [Text("CMD"), Spacer(), Text("10.0")]),
                    ],
                  ),
                ),
              ),

              //fourth card
              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "METER DETAILS AS PER EBS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Division Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "METER MAKE",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedSecurity,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),

                          // labelText: 'Select Complaint 2',
                        ),
                        items: ["SECURI"]
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedSecurity = value;
                          });
                        },
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "METER SERIAL NO",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                          // labelText: "Enter Meter Make",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          // Handle input change
                        },
                      ),

                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "METER DETAILS AS PER FIELD",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Division Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "METER MAKE",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedMeterMakeName,
                        decoration: InputDecoration(
                          // hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: ["SECURI"]
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMeterMakeName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "METER SERIAL NO",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      TextField(
                        controller: _meter_serial_no,
                        decoration: InputDecoration(
                          // labelText: "Enter Meter Make",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          // Handle input change
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "METER CT RATIO",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedMeterRatio,
                        decoration: InputDecoration(
                          // hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: ["100/5A", "125/5A", "200/5A"]
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMeterRatio = value;
                          });
                        },
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "METER WARRANTY",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectMeterWarranty,
                        decoration: InputDecoration(
                          // hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: ["WGP", "RGP", "BGP"]
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectMeterWarranty = value;
                            //     });
                          });
                        },
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "METER PO NO",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          // Handle input change
                        },
                      ),
                      SizedBox(height: 12),

                      Row(
                        children: [
                          const Text(
                            "PO MONTH YEAR(MM/YY)",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _controllerPO,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(
                                  6,
                                ), // MMYYYY (digits only, no slash)
                                TextInputFormatter.withFunction((
                                  oldValue,
                                  newValue,
                                ) {
                                  String digits = newValue.text.replaceAll(
                                    '/',
                                    '',
                                  );

                                  // Auto-prepend '0' if month is single digit and > 1
                                  if (digits.length == 1 &&
                                      int.tryParse(digits) != null) {
                                    int m = int.parse(digits);
                                    if (m > 1) {
                                      digits = '0' + digits; // e.g., 3 → 03
                                    }
                                  }

                                  // Validate month
                                  if (digits.length >= 2) {
                                    int month =
                                        int.tryParse(digits.substring(0, 2)) ??
                                        0;
                                    if (month < 1 || month > 12) {
                                      return oldValue; // Reject invalid month
                                    }
                                  }

                                  // Limit to 6 digits (MMYYYY)
                                  if (digits.length > 6) {
                                    digits = digits.substring(0, 6);
                                  }

                                  // Insert slash after month
                                  String formatted = digits;
                                  if (digits.length > 2) {
                                    formatted =
                                        digits.substring(0, 2) +
                                        '/' +
                                        digits.substring(2);
                                  }

                                  return TextEditingValue(
                                    text: formatted,
                                    selection: TextSelection.collapsed(
                                      offset: formatted.length,
                                    ),
                                  );
                                }),
                              ],
                              decoration: InputDecoration(
                                hintText: "MM/YYYY",
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //sixth card
              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "EXISTING METER READING DETAILS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Division Dropdown
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                          const Text("SOLAR METER"),
                        ],
                      ),
                      if (!isChecked) ...[
                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("KWH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _kwh,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("KVAH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _kvah,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("MD")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _md,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("KWH ERROR %")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _kwhError,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: const Text("METER SATISFACTORY"),
                            ),
                            Expanded(
                              flex: 2,
                              child: 
                             DropdownButtonFormField2<String>(
  decoration: myTextFieldDecoration,
  value: meterSatisfaction,
  hint: const Text("Select"),
  items: ["Yes", "No"].map(
    (e) => DropdownMenuItem<String>(
      value: e,
      child: Text(e),
    ),
  ).toList(),
  onChanged: (value) {
    setState(() {
      meterSatisfaction = value;
    });
  },
)
                            ),
                          ],
                        ),
                      ] else ...[
                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("IMPORT KWH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _importKWH,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("EXPORT KWH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _exportKWH,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("IMPORT KVAH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _importKVAH,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("EXPORT KVAH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _exportKVAH,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("IMPORT MD")),

                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _importMD,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("EXPORT MD")),

                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _exportMD,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("KWH ERROR %")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _kwhErrorInSolar,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: const Text("METER SATISFACTORY"),
                            ),

                            Expanded(
                              flex: 2,
                              child:     DropdownButtonFormField2<String>(
  decoration: myTextFieldDecoration,
  value: meterSatisfaction,
  hint: const Text("Select"),
  items: ["Yes", "No"].map(
    (e) => DropdownMenuItem<String>(
      value: e,
      child: Text(e),
    ),
  ).toList(),
  onChanged: (value) {
    setState(() {
      meterSatisfaction = value;
    });
  },
)
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              //remarks
              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "REMARKS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "REMARKS",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ],
                      ),
                      TextField(
                        controller: _remarks,
                        minLines: 5,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Enter your remarks here...",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {},
                      ),

                      // Division Dropdown
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //This is modified
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                    10,
                  ), // Adjust radius as needed
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // Same radius here for clipping
                    ),
                  ),
                  onPressed: _checkField,
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
