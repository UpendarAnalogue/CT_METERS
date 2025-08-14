import 'dart:core';
// import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';

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
  String? selectsecurity;
  String? selectmeterctratio;
  String? selectmetermakename;
  String? selectMeterWarranty;

  final TextEditingController _controller = TextEditingController();

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

  bool isChecked = false;


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
                            .where((item) => item
                                .toLowerCase()
                                .contains(value.toLowerCase()))
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
              )
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
            Text('#PRT20250805003162', style: TextStyle(fontSize: 18)),
            Text(
              '11KV BREAKER',
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

                      DropdownButtonFormField<String>(
                        value: selectedDivision,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        hint: const Text("SELECT"), // placeholder
                        items: selectDivision
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDivision = value;
                            selectedSubDivision =
                                selectSubDivision[0]; // reset next
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

                      DropdownButtonFormField<String>(
                        value: selectedSubDivision,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        // hint: const Text("Select"), // placeholder
                        items: selectSubDivision
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: selectedDivision == null
                            ? null // disabled until division selected
                            : (value) {
                                setState(() {
                                  selectedSubDivision = value;
                                  selectedSection =
                                      selectSection[0]; // reset next
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

                      DropdownButtonFormField<String>(
                        value: selectedSection,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        // hint: const Text("Select"), // placeholder
                        items: selectSection
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: selectedSubDivision == null
                            ? null // disabled until sub-division selected
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
                      DropdownButtonFormField<String>(
                        value: selectedComplaint1,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.red),
                          border: OutlineInputBorder(),
                        ),
                        items:
                            [
                                  "Cable Change",
                                  "Phase down Rectification",
                                  "Phase down-Meter Replaced",
                                  "No Display-Meter Replaced",
                                  " Meter Burnt-Meter Replaced",
                                  " Meter Burnt-Meter(No Display) Replaced",
                                  " Meter Defective-Meter Replaced",
                                ]
                                .map(
                                  (div) => DropdownMenuItem(
                                    value: div,
                                    child: Text(div),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedComplaint1 = value;
                          });
                        },
                      ),
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
                      DropdownButtonFormField<String>(
                        value: selectedComplaint2,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.red),
                          border: OutlineInputBorder(),
                        ),
                        items:
                            [
                                  "Not Applicable",
                                  "Cable Change",
                                  "Phase down Rectification",
                                  "Phase down-Meter Replaced",
                                  "No Display-Meter Replaced",
                                  " Meter Burnt-Meter Replaced",
                                  " Meter Burnt-Meter(No Display) Replaced",
                                  " Meter Defective-Meter Replaced",
                                ]
                                .map(
                                  (sub) => DropdownMenuItem(
                                    value: sub,
                                    child: Text(sub),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedComplaint2 = value;
                          });
                        },
                      ),
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
                      DropdownButtonFormField<String>(
                        value: selectedComplaint3,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.red),
                          border: OutlineInputBorder(),
                        ),
                        items:
                            [
                                  "Not Applicable",
                                  "Cable Change",
                                  "Phase down Rectification",
                                  "Phase down-Meter Replaced",
                                  "No Display-Meter Replaced",
                                  " Meter Burnt-Meter Replaced",
                                  " Meter Burnt-Meter(No Display) Replaced",
                                  " Meter Defective-Meter Replaced",
                                ]
                                .map(
                                  (status) => DropdownMenuItem(
                                    value: status,
                                    child: Text(status),
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
                            child: DropdownButtonFormField<String>(
                              value: selectedService,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(color: Colors.red),
                                border: OutlineInputBorder(),
                              ),
                              items:allData
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
                              color: Colors.grey, // Icon background color
                              shape: BoxShape.rectangle,
                            ),
                            child: IconButton(
                              onPressed:_openSearchDialog,
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        color: Colors.grey.shade300, // light grey line
                        thickness: 1, // line thickness
                      ),

                      Row(
                        children: [
                          Text("SC.NO/USCNO"),
                          Spacer(), // takes up all available space
                          Text("22 22 129371/15855182"),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300, // light grey line
                        thickness: 1, // line thickness
                      ),
                      Row(
                        children: [
                          Text("NAME"),
                          Spacer(),
                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.end, // align right
                            children: [
                              Text("OWNERS WELFARE ASSOCIATION"),
                              Text(
                                "AMI",
                                //style: TextStyle(fontSize: 12, color: Colors.grey), // smaller subline
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300, // light grey line
                        thickness: 1, // line thickness
                      ),
                      Row(
                        children: [
                          Text("CAT/MF"),
                          Spacer(), // takes up all available space
                          Text("1/1.0"),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300, // light grey line
                        thickness: 1, // line thickness
                      ),
                      Row(
                        children: [
                          Text("DISTRIBUTION"),
                          Spacer(), // takes up all available space
                          Text("12221-NAGENDRA NAGAR"),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300, // light grey line
                        thickness: 1, // line thickness
                      ),
                      Row(
                        children: [
                          Text("CMD"),
                          Spacer(), // takes up all available space
                          Text("10.0"),
                        ],
                      ),
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
                      DropdownButtonFormField<String>(
                        value: selectsecurity,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.red),
                          border: OutlineInputBorder(),
                        ),
                        items: ["SECURI"]
                            .map(
                              (div) => DropdownMenuItem(
                                value: div,
                                child: Text(div),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectsecurity = value;
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

              //fifth card
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
                      DropdownButtonFormField<String>(
                        value: selectmetermakename,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.red),
                          border: OutlineInputBorder(),
                        ),
                        items: ["SECURI"]
                            .map(
                              (div) => DropdownMenuItem(
                                value: div,
                                child: Text(div),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectmetermakename = value;
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "METER CT RATIO",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      DropdownButtonFormField<String>(
                        value: selectmeterctratio,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.red),
                          border: OutlineInputBorder(),
                        ),
                        items: ["100/5A", "125/5A", "200/5A"]
                            .map(
                              (div) => DropdownMenuItem(
                                value: div,
                                child: Text(div),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectmeterctratio = value;
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
                      DropdownButtonFormField<String>(
                        value: selectMeterWarranty,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.red),
                          border: OutlineInputBorder(),
                        ),
                        items: ["WGP", "RGP", "BGP"]
                            .map(
                              (div) => DropdownMenuItem(
                                value: div,
                                child: Text(div),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectMeterWarranty = value;
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
                          // labelText: "Enter Meter Make",
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
                          const SizedBox(
                            width: 10,
                          ), // space between text and TextField
                          Expanded(
                            // makes TextField take remaining space
                            child: TextField(
                              controller: _controller,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // allow only digits
                                LengthLimitingTextInputFormatter(
                                  4,
                                ), // max 4 digits (MMYY)
                                TextInputFormatter.withFunction((
                                  oldValue,
                                  newValue,
                                ) {
                                  var text = newValue.text;
                                  if (text.length >= 3) {
                                    text =
                                        text.substring(0, 2) +
                                        '/' +
                                        text.substring(2);
                                  }
                                  return TextEditingValue(
                                    text: text,
                                    selection: TextSelection.collapsed(
                                      offset: text.length,
                                    ),
                                  );
                                }),
                              ],
                              decoration: InputDecoration(
                                hintText: "MM/YY",
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
                                textAlign:
                                    TextAlign.right, // Align text to the right
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
                                textAlign:
                                    TextAlign.right, // Align text to the right
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
                                textAlign:
                                    TextAlign.right, // Align text to the right
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
                                textAlign:
                                    TextAlign.right, // Align text to the right
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
                              flex: 2, // controls width ratio
                              child: DropdownButtonFormField<String>(
                                decoration: myTextFieldDecoration,

                                value: null, // initial value
                                onChanged: (String? newValue) {
                                  // handle value change
                                },
                                items: const [
                                  DropdownMenuItem(
                                    value: "Yes",
                                    child: Text("Yes"),
                                  ),
                                  DropdownMenuItem(
                                    value: "No",
                                    child: Text("No"),
                                  ),
                                ],
                              ),
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
                                textAlign:
                                    TextAlign.right, // Align text to the right
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
                                textAlign:
                                    TextAlign.right, // Align text to the right
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
                                textAlign:
                                    TextAlign.right, // Align text to the right
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
                                textAlign:
                                    TextAlign.right, // Align text to the right
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("IMPORT MD")),
                            // const Spacer(),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                textAlign:
                                    TextAlign.right, // Align text to the right
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("EXPORT MD")),
                            // const Spacer(),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                textAlign:
                                    TextAlign.right, // Align text to the right
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
                                textAlign:
                                    TextAlign.right, // Align text to the right
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
                            // const Spacer(),
                            Expanded(
                              flex: 2, // controls width ratio
                              child: DropdownButtonFormField<String>(
                                decoration: myTextFieldDecoration,

                                value: null, // initial value
                                onChanged: (String? newValue) {
                                  // handle value change
                                },
                                items: const [
                                  DropdownMenuItem(
                                    value: "Yes",
                                    child: Text("Yes"),
                                  ),
                                  DropdownMenuItem(
                                    value: "No",
                                    child: Text("No"),
                                  ),
                                ],
                              ),
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
                        minLines: 5, // Minimum number of lines (height)
                        maxLines: null, // Unlimited lines — expands as you type
                        keyboardType: TextInputType
                            .multiline, // Ensures 'Enter' key works for new line
                        decoration: InputDecoration(
                          hintText: "Enter your remarks here...",
                          border: OutlineInputBorder(), // Full box border
                        ),
                        onChanged: (value) {
                          // Handle input change
                        },
                      ),

                      // Division Dropdown
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                height: 60,
                width: double.infinity,
                color: Colors.red,

                // decoration:BoxDecoration(
                //   borderRadius: BorderRadius.circular(2),
                // ),
                child: TextButton(
                  onPressed: () {},
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
