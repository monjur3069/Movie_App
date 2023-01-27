import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DashBoardDrawer extends StatelessWidget {
  const DashBoardDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 200,
            color: Colors.blue.shade700,
          ),
          SizedBox(height: 10,),
          ListTile(
            title: const Text('LogOut'),
            trailing: IconButton(
              onPressed: (){},
              icon: Icon(Icons.logout),
            ),
          )
        ],
      ),
    );
  }
}

/*class DashBoardDrawer extends StatefulWidget {
  const DashBoardDrawer({Key? key}) : super(key: key);

  @override
  State<DashBoardDrawer> createState() => _DashBoardDrawerState();
}

class _DashBoardDrawerState extends State<DashBoardDrawer> {


  @override
  Widget build(BuildContext context) {

    var drawerWidth =MediaQuery.of(context).size.width/2 ;

    return Drawer(
      width: drawerWidth.w,
      child: Column(

        children: [
          Container(
            height: 200,
            color: Colors.blue.shade700,
          ),
          SizedBox(height: 10,),
          ListTile(
            title: const Text('LogOut'),
            trailing: IconButton(
              onPressed: (){},
              icon: Icon(Icons.logout),
            ),
          )
        ],
      ),
    );
  }
}*/
