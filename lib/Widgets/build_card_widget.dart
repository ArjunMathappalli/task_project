import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'build_text_widget.dart';

class BuildCardWidget extends StatefulWidget {
  final String name;
  final String course;
  final String uniqueId;
  final String branch;
  final String startDate;
  final String endDate;
  final String totalDays;

  const BuildCardWidget({super.key, required this.name, required this.course, required this.uniqueId, required this.branch, required this.startDate, required this.endDate, required this.totalDays});

  @override
  State<BuildCardWidget> createState() => _BuildCardWidgetState();
}

class _BuildCardWidgetState extends State<BuildCardWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:
      MediaQuery.of(context).size.height / 3.8,
      // width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
          horizontal: 5, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage(
              "assests/background_image/Rectangle 681 (1).png"),
          fit: BoxFit.cover,
        ),

      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            BuildTextWidget(
              text: widget.course,
              size: 15,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                BuildTextWidget(
                  text: widget.name,
                  size: 15,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  width: 50,
                ),
                BuildTextWidget(
                    text:
                    "ID : ${widget.uniqueId.split(' ').first}",
                    size: 13,
                    fontWeight: FontWeight.w300),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            BuildTextWidget(
                text: '${widget.totalDays} Days (${widget.startDate} to ${widget.endDate})',
                size: 13,
                fontWeight: FontWeight.w300),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                 const BuildTextWidget(
                  text: "CSP : ",
                  fontWeight: FontWeight.w600,
                  size: 13,
                ),
                BuildTextWidget(
                    text:widget.branch,
                    size: 13,

                    fontWeight: FontWeight.w600),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                          "assests/icon_image/attendc.svg"),
                      const SizedBox(height: 5),
                      const BuildTextWidget(
                        text: "Attendance",
                        size: 11,

                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                          "assests/icon_image/qf_work.svg"),
                      const SizedBox(height: 5),
                      const BuildTextWidget(
                        text: "QF Work",
                        size: 11,
                        fontWeight: FontWeight.w200,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                          "assests/icon_image/Student_view.svg"),
                      const SizedBox(height: 5),
                      const BuildTextWidget(
                        text: "Stuednt View",
                        size: 11,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                          "assests/icon_image/Assesment.svg"),
                      const SizedBox(height: 5),
                      const BuildTextWidget(
                        text: "Assessment",
                        size: 11,
                        fontWeight: FontWeight.w100,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
