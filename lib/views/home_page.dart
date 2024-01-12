import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:vimes_test/models/model.dart';
import 'package:vimes_test/services/cloud_service.dart';
import 'package:vimes_test/utils/constant.dart';
import 'package:vimes_test/views/list_page.dart';
import 'package:vimes_test/widget/input_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  int total = 0;
  late MoneyFormatter fmf;
  //
  CloudService cloudService = CloudService();
  //dropdown value
  String dropdownKhoValue = listKho.first;
  String dropdownBoPhanValue = listBoPhan.first;
  String dropdownDonViValue = listDonvi.first;
  String dropdownDonViTinhValue = listDonviTinh.first;
  //
  DateTime? _selectedDate;
  //text controller
  TextEditingController nguoiLapPhieu = TextEditingController();
  TextEditingController nguoiGiaoHang = TextEditingController();
  TextEditingController thuKho = TextEditingController();
  TextEditingController keToanTruong = TextEditingController();
  TextEditingController so = TextEditingController();
  TextEditingController no = TextEditingController();
  TextEditingController co = TextEditingController();
  TextEditingController diaDiem = TextEditingController();
  TextEditingController tenSanPham = TextEditingController();
  TextEditingController maSo = TextEditingController();
  TextEditingController soLuongCT = TextEditingController();
  TextEditingController soLuongTN = TextEditingController();
  TextEditingController donGia = TextEditingController();

  //validate key
  final nguoiLapPhieuKey = GlobalKey<FormState>();
  final nguoiGiaoHangKey = GlobalKey<FormState>();
  final thuKhoKey = GlobalKey<FormState>();
  final keToanTruongKey = GlobalKey<FormState>();
  final soKey = GlobalKey<FormState>();
  final coKey = GlobalKey<FormState>();
  final diaDiemKey = GlobalKey<FormState>();
  final tenSanPhamKey = GlobalKey<FormState>();
  final maSoKey = GlobalKey<FormState>();
  final soLuongCTKey = GlobalKey<FormState>();
  final donGiaKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fmf = MoneyFormatter(amount: total.toDouble());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: const Text("VIMES TEST"),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width > 900
                ? 900
                : MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // thong tin chung
                thongTinChung(),
                const SizedBox(
                  height: 10,
                ),
                // thong tin san pham
                thongTinSanPham(),
                //button
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              saveData();
                            },
                            child: const Text("Ghi dữ liệu"))),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ListPage(),
                              ));
                            },
                            child: const Text("Xem danh sách"))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveData() {
    if (nguoiLapPhieuKey.currentState!.validate() &&
        nguoiGiaoHangKey.currentState!.validate() &&
        thuKhoKey.currentState!.validate() &&
        keToanTruongKey.currentState!.validate() &&
        diaDiemKey.currentState!.validate() &&
        tenSanPhamKey.currentState!.validate() &&
        maSoKey.currentState!.validate() &&
        soKey.currentState!.validate() &&
        coKey.currentState!.validate() &&
        soLuongCTKey.currentState!.validate() &&
        donGiaKey.currentState!.validate()) {
      cloudService.addData(
        model: Model(
          nguoiLapPhieu: nguoiLapPhieu.text,
          nguoiGiaoHang: nguoiGiaoHang.text,
          thuKho: thuKho.text,
          keToanTruong: keToanTruong.text,
          donVi: dropdownDonViValue,
          boPhan: dropdownBoPhanValue,
          nhapTaiKho: dropdownKhoValue,
          so: so.text,
          no: int.parse(no.text.isEmpty ? '0' : no.text),
          co: int.parse(co.text),
          diaDiem: diaDiem.text,
          tenSanPham: tenSanPham.text,
          maSo: maSo.text,
          donViTinh: dropdownDonViTinhValue,
          soLuongCT: int.parse(soLuongCT.text),
          soLuongTN: int.parse(soLuongTN.text.isEmpty ? '0' : soLuongTN.text),
          donGia: int.parse(donGia.text),
          ngayThangNam:
              DateFormat('d/M/y').format(_selectedDate ?? DateTime.now()),
          thanhTien: total,
        ),
      );
    }
  }

  Widget thongTinChung() {
    return Flexible(
        child: Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Thông tin chung",
              style: headerTextStyle,
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Wrap(
                          children: [
                            InputTextWidget(
                              title: "Người lập phiếu",
                              width: 180,
                              controller: nguoiLapPhieu,
                              formKey: nguoiLapPhieuKey,
                            ),
                            InputTextWidget(
                                title: "Người giao hàng",
                                width: 180,
                                controller: nguoiGiaoHang,
                                formKey: nguoiGiaoHangKey),
                            InputTextWidget(
                              title: "Thủ kho",
                              width: 180,
                              controller: thuKho,
                              formKey: thuKhoKey,
                            ),
                            InputTextWidget(
                              title: "Kế toán trưởng",
                              width: 180,
                              controller: keToanTruong,
                              formKey: keToanTruongKey,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Wrap(
                          spacing: 0.5,
                          runSpacing: 0.5,
                          children: [
                            dropdownWidget(
                              title: "Đơn vị",
                              listValue: listDonvi,
                              dropdownValue: dropdownDonViValue,
                              onChanged: (val) {
                                setState(() {
                                  dropdownDonViValue = val!;
                                });
                              },
                            ),
                            dropdownWidget(
                              title: "Bộ phận",
                              listValue: listBoPhan,
                              dropdownValue: dropdownBoPhanValue,
                              onChanged: (val) {
                                setState(() {
                                  dropdownBoPhanValue = val!;
                                });
                              },
                            ),
                            dropdownWidget(
                              title: "Nhập tại kho",
                              listValue: listKho,
                              dropdownValue: dropdownKhoValue,
                              onChanged: (val) {
                                setState(() {
                                  dropdownKhoValue = val!;
                                });
                              },
                            ),
                            datePicker(),
                            InputTextWidget(
                              title: "Số",
                              width: 80,
                              controller: so,
                              formKey: soKey,
                            ),
                            InputTextWidget(
                              title: "Nợ",
                              width: 80,
                              keyboardType: TextInputType.number,
                              controller: no,
                            ),
                            InputTextWidget(
                              title: "Có",
                              width: 80,
                              keyboardType: TextInputType.number,
                              controller: co,
                              formKey: coKey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  InputTextWidget(
                    title: "Địa điểm",
                    controller: diaDiem,
                    formKey: diaDiemKey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget thongTinSanPham() {
    return Flexible(
        child: Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Thông tin sản phẩm",
              style: headerTextStyle,
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      InputTextWidget(
                        title: "Tên sản phẩm",
                        width: 300,
                        controller: tenSanPham,
                        formKey: tenSanPhamKey,
                      ),
                      InputTextWidget(
                        title: "Mã số",
                        width: 100,
                        controller: maSo,
                        formKey: maSoKey,
                      ),
                      dropdownWidget(
                        title: "Đơn vị tính",
                        listValue: listDonviTinh,
                        dropdownValue: dropdownDonViTinhValue,
                        onChanged: (val) {
                          setState(() {
                            dropdownDonViTinhValue = val!;
                          });
                        },
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      InputTextWidget(
                        title: "Số lượng theo chứng từ",
                        width: 180,
                        keyboardType: TextInputType.number,
                        controller: soLuongCT,
                        formKey: soLuongCTKey,
                        onChanged: (val) {
                          if (val != "" && donGia.text != "") {
                            setState(() {
                              total = int.parse(val) * int.parse(donGia.text);
                            });
                          } else {
                            setState(() {
                              total = 0;
                            });
                          }
                        },
                      ),
                      InputTextWidget(
                        title: "Số lượng thực nhập",
                        width: 180,
                        keyboardType: TextInputType.number,
                        controller: soLuongTN,
                      ),
                    ],
                  ),
                  InputTextWidget(
                    title: "Đơn giá",
                    width: 300,
                    keyboardType: TextInputType.number,
                    controller: donGia,
                    formKey: donGiaKey,
                    onChanged: (val) {
                      if (val != "" && soLuongCT.text != "") {
                        setState(() {
                          total = int.parse(val) * int.parse(donGia.text);
                        });
                      } else {
                        setState(() {
                          total = 0;
                        });
                      }
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: RichText(
                      text: TextSpan(
                          text: "Thành tiền:",
                          style: headerTextStyle,
                          children: [
                            TextSpan(
                                text: '\t${fmf.output.nonSymbol} đ',
                                style: const TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.none))
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget dropdownWidget(
      {required String title,
      required List<String> listValue,
      required String dropdownValue,
      required void Function(String?)? onChanged}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleTextStyle,
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.only(
              top: 5,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 1)),
            child: DropdownButton<String>(
              value: dropdownValue,
              focusColor: Colors.transparent,
              underline: Container(),
              padding: const EdgeInsets.all(5),
              style: bodyTextStyle,
              items: listValue.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: bodyTextStyle,
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget datePicker() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ngày tháng năm',
            style: titleTextStyle,
          ),
          InkWell(
            splashColor: Colors.blue.shade400,
            hoverColor: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(5),
            onTap: () async {
              DateTime? newSelectedDate = await showDatePicker(
                context: context,
                initialDate: _selectedDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(DateTime.now().year + 1),
              );
              if (newSelectedDate != null) {
                setState(() {
                  _selectedDate = newSelectedDate;
                });
              }
            },
            child: Container(
              width: 120,
              height: 35,
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  //color: Colors.amber,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Row(
                children: [
                  Text(
                    DateFormat('d/M/y').format(_selectedDate ?? DateTime.now()),
                    style: bodyTextStyle,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.timer,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
