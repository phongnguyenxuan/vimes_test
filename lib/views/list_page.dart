import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:vimes_test/models/model.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh Sách"),
        automaticallyImplyLeading: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: (context, snapshot) {
          List<Model> listModel = [];
          if (snapshot.hasData) {
            for (var element in snapshot.data!.docs) {
              listModel.add(Model.fromMap(element.data()));
            }
            return DataTable2(
              scrollController: controller,
              isHorizontalScrollBarVisible: true,
              isVerticalScrollBarVisible: true,
              columnSpacing: 0,
              horizontalMargin: 10,
              dividerThickness: 1,
              headingRowColor: const MaterialStatePropertyAll(Colors.orange),
              border: TableBorder.all(width: 1.0, color: Colors.grey),
              fixedColumnsColor: Colors.grey[300],
              fixedCornerColor: Colors.grey[400],
              bottomMargin: 10,
              smRatio: 1,
              lmRatio: 1,
              columns: const [
                DataColumn2(
                    label: Center(child: Text('Tên sản phẩm')),
                    numeric: true),
                DataColumn2(
                  label: Center(child: Text('Mã số')),
                ),
                DataColumn2(
                  label: Center(child: Text('Số lượng theo CT')),
                ),
                DataColumn2(
                  label: Center(child: Text('Số lượng theo TN')),
                ),
                DataColumn2(
                  label: Center(child: Text('Đơn vị tính')),
                  numeric: true,
                ),
                DataColumn2(
                  label: Center(child: Text('Đơn giá')),
                ),
                DataColumn2(
                  label: Center(child: Text('Thành tiền')),
                ),
                DataColumn2(
                  label: Center(child: Text('Người lập phiếu')),
                ),
                DataColumn2(
                  label: Center(child: Text('Người giao hàng')),
                ),
                DataColumn2(
                  label: Center(child: Text('Thủ kho')),
                ),
                DataColumn2(
                  label: Center(child: Text('Kế toán trưởng')),
                ),
                DataColumn2(
                  label: Center(child: Text('Đơn vị')),
                ),
                DataColumn2(
                  label: Center(child: Text('Bộ phận')),
                ),
                DataColumn2(
                  label: Center(child: Text('Nhập tại kho')),
                ),
                DataColumn2(
                  label: Center(child: Text('Địa điểm')),
                ),
                DataColumn2(
                  label: Center(child: Text('Ngày tháng năm')),
                ),
                DataColumn2(
                  label: Center(child: Text('Số')),
                ),
                DataColumn2(
                  label: Center(child: Text('Nợ')),
                ),
                DataColumn2(
                  label: Center(child: Text('Có')),
                ),
              ],
              rows: List<DataRow>.generate(
                listModel.length,
                (index) {
                  Model model = listModel[index];
                  return DataRow(
                    cells: [
                      DataCell(Center(child: Text(model.tenSanPham))),
                      DataCell(Center(child: Text(model.maSo))),
                      DataCell(Center(child: Text(model.soLuongCT.toString()))),
                      DataCell(Center(child: Text(model.soLuongTN.toString()))),
                      DataCell(Center(child: Text(model.donViTinh))),
                      DataCell(Center(child: Text(model.donGia.toString()))),
                      DataCell(Center(child: Text(model.thanhTien.toString()))),
                      DataCell(Center(child: Text(model.nguoiLapPhieu))),
                      DataCell(Center(child: Text(model.nguoiGiaoHang))),
                      DataCell(Center(child: Text(model.thuKho))),
                      DataCell(Center(child: Text(model.keToanTruong))),
                      DataCell(Center(child: Text(model.donVi))),
                      DataCell(Center(child: Text(model.boPhan))),
                      DataCell(Center(child: Text(model.nhapTaiKho))),
                      DataCell(Center(child: Text(model.diaDiem))),
                      DataCell(Center(child: Text(model.ngayThangNam))),
                      DataCell(Center(child: Text(model.so))),
                      DataCell(Center(child: Text(model.no.toString()))),
                      DataCell(Center(child: Text(model.co.toString()))),
                    ],
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
