import 'package:belajar/data/model_user.dart';
import 'package:belajar/data/user.dart';
import 'package:belajar/pages/utilis.dart';
import 'package:belajar/widgets/scroll_able.dart';
import 'package:belajar/widgets/text.dart';

import 'package:flutter/material.dart';

class EditablePage extends StatefulWidget {

  String url = ''; 


  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ScrollableWidget(child: buildDataTable()),
        ),
      ),
    );
  }

  Widget buildDataTable() {
    final columns = ['jenis', 'massa(kg)','durasi(min)','kadar_air_awal','suhu(C)','kadar_air_akhir(%)','keterangan'];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: getColumns(columns),
        rows: getRows(users),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(
          column,
          textAlign: TextAlign.center,
        ),
      );
    }).toList();
  }

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.jenis, user.massa, user.durasi, user.kadar_air_awal,user.suhu,user.kadar_air_akhir,user.keterangan];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0 || index == 1;

            return DataCell(
              Text(
                '$cell',
                textAlign: TextAlign.center,
              ),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    editjenis(user);
                    break;
                  case 1:
                    editmassa(user);
                    break;


                }
              },
            );
          }),
        );
      }).toList();

  Future editjenis(User editUser) async {
    final jenis = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editUser.jenis,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(jenis: jenis) : user;
        }).toList());
  }

  Future editmassa(User editUser) async {
    final massa = await showTextDialog(
      context,
      title: 'Change Last Name',
      value: editUser.massa,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(massa: massa) : user;
        }).toList());
  }
}
