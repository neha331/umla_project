import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:umla_project/view/Display_medicine.dart';
import 'package:umla_project/view/add_medicine_details.dart';
import 'package:umla_project/controller/showNetworkDialog.dart';

class HomeScreen extends StatefulWidget {

  final TextEditingController medicineNameController =TextEditingController();
  final TextEditingController passwor =TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  HomeScreen({super.key});
  
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 100, 182, 241),
        title:const  Text('Hi User!'),
        actions: [
          Icon(Icons.shopping_bag_sharp),
          Container(
            decoration:const  BoxDecoration(
              shape:BoxShape.circle,
              color:Colors.blue,
            ),
            child:const Icon(
              Icons.person_3,
              color:Color.fromARGB(255, 5, 5, 5),
            ),
          )
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () async{
                 bool isConnected = await checkNetworkAvailability(context);
                 if(isConnected){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddMedicineDetails()));
                 }else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Error while adding medicine")),
                      );
                    }
        },
        
        backgroundColor: Colors.black,
        child:const Icon(
          Icons.add,
          color:Colors.white
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          
          items:[
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                MedicineDisplayScreen())); 
                      },
                child: Icon(Icons.home)
                ),
                
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Report',
            ),
          ],
          selectedItemColor: Colors.blue,
        ),
     
    );
  }
}
