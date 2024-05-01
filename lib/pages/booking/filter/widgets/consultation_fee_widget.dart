import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum ConsultationFee { free, range1, range2, range3, range4 }

class ConsultationFeeWidget extends StatefulWidget {
  final Color color;

  const ConsultationFeeWidget({Key? key, required this.color})
      : super(key: key);
  @override
  _ConsultationFeeWidgetState createState() => _ConsultationFeeWidgetState();
}

class _ConsultationFeeWidgetState extends State<ConsultationFeeWidget> {
  ConsultationFee _consultationFee = ConsultationFee.free;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          color: widget.color,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              'consultaion_fee'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        RadioListTile(
          value: ConsultationFee.free,
          onChanged: (ConsultationFee? value) {
            setState(() {
              _consultationFee = value!;
            });
          },
          groupValue: _consultationFee,
          title: Text('free'.tr()),
        ),
        RadioListTile(
          value: ConsultationFee.range1,
          onChanged: (ConsultationFee? value) {
            setState(() {
              _consultationFee = value!;
            });
          },
          groupValue: _consultationFee,
          title: Text('1-50'),
        ),
        RadioListTile(
          value: ConsultationFee.range2,
          onChanged: (ConsultationFee? value) {
            setState(() {
              _consultationFee = value!;
            });
          },
          groupValue: _consultationFee,
          title: Text('51-100'),
        ),
        RadioListTile(
          value: ConsultationFee.range3,
          onChanged: (ConsultationFee? value) {
            setState(() {
              _consultationFee = value!;
            });
          },
          groupValue: _consultationFee,
          title: Text('101-150'),
        ),
        RadioListTile(
          value: ConsultationFee.range4,
          onChanged: (ConsultationFee? value) {
            setState(() {
              _consultationFee = value!;
            });
          },
          groupValue: _consultationFee,
          title: Text('151+'),
        )
      ],
    );
  }
}
