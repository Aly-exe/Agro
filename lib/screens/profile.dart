// // ignore_for_file: must_be_immutable

// import 'package:agro/Bloc/userStates.dart';
// import 'package:agro/Bloc/userbloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Profile extends StatelessWidget {
//   Profile({super.key});
//   var passwordconfirm = TextEditingController();
//   var firstnamecontroller = TextEditingController();
//   var lastnamecontroller = TextEditingController();
//   var emailcontroller = TextEditingController();
//   var passwordcontroller = TextEditingController();
//   var formkey = GlobalKey<FormState>();
//   var secformkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text(
//           "Edit Name",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: BlocProvider<UserBloc>(
//         create: (context) => UserBloc()..getUserData(),
//         child: BlocConsumer<UserBloc, UserStates>(
//           listener: ((context, state) {}),
//           builder: ((context, state) {
//             var cubit = UserBloc.get(context);

//             if (state is LoadingGetUserDataState) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is SuccessGetUserDataState ||
//                 state is ChangeEnableState ||
//                 state is ChangeEditButtonState ||
//                 state is SuccessUpdateUserDataState ||
//                 state is loadingUpdateUserDataState ||
//                 state is loadingUpdateAuthDataState ||
//                 state is SuccessUpdateUserEmailState ||
//                 state is SuccessUpdateUserPasswordState) {
//               return SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     children: [
//                       SizedBox(height: 10),
//                       CircleAvatar(
//                         radius: 50,
//                         backgroundImage: NetworkImage(
//                             'https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/382774846_1372248433677323_5559179412723157907_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEn9qht_dCqjYgsIxzNHCjUyRchHKY8R4LJFyEcpjxHgg_4jQcz6jpjzfZtE0Oxh41m9g84Lg39u1a4uOHTKY0S&_nc_ohc=UbeWdaLY32oQ7kNvgFvgJn4&_nc_ht=scontent.fcai19-4.fna&oh=00_AYAU7QyRBoIN06lXN9rZyIrE4i48Wc0UE-wseMFyR1Rdow&oe=666F9546'), // Replace with actual image URL
//                       ),
//                       SizedBox(height: 20),
//                       Form(
//                         key: formkey,
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               controller: firstnamecontroller,
//                               validator: (String? value) {
//                                 if (value!.isEmpty) {
//                                   return "First name can't be empty";
//                                 }
//                                 return null;
//                               },
//                               enabled: cubit.isenabled,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                     horizontal: 10.0, vertical: 10.0),
//                                 labelText: "First name",
//                                 labelStyle: TextStyle(
//                                     fontSize: 25.0, color: Color(0xff4793AF)),
//                                 hintText: cubit.userinfo!.f_name,
//                                 floatingLabelBehavior:
//                                     FloatingLabelBehavior.always,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20.0,
//                             ),
//                             TextFormField(
//                               controller: lastnamecontroller,
//                               validator: (String? value) {
//                                 if (value!.isEmpty) {
//                                   return "last name can't be empty";
//                                 }
//                                 return null;
//                               },
//                               enabled: cubit.isenabled,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                     horizontal: 10.0, vertical: 10.0),
//                                 labelText: "last name",
//                                 labelStyle: TextStyle(
//                                     fontSize: 25.0, color: Color(0xff4793AF)),
//                                 hintText: cubit.userinfo!.l_name,
//                                 floatingLabelBehavior:
//                                     FloatingLabelBehavior.always,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   height: 20.0,
//                             // ),
//                             // TextFormField(
//                             //   controller: emailcontroller,
//                             //   validator: (String? value) {
//                             //     if (value!.isEmpty) {
//                             //       return "Email must be filled";
//                             //     }
//                             //     return null;
//                             //   },
//                             //   enabled: cubit.isenabled,
//                             //   decoration: InputDecoration(
//                             //     contentPadding: EdgeInsets.symmetric(
//                             //         horizontal: 10.0, vertical: 10.0),
//                             //     labelText: "Email",
//                             //     labelStyle: TextStyle(
//                             //         fontSize: 25.0, color: Color(0xff4793AF)),
//                             //     hintText: cubit.userinfo!.email,
//                             //     floatingLabelBehavior:
//                             //         FloatingLabelBehavior.always,
//                             //   ),
//                             // ),
//                             // SizedBox(
//                             //   height: 20.0,
//                             // ),
//                             // TextFormField(
//                             //   controller: passwordcontroller,
//                             //   validator: (String? value) {
//                             //     if (value!.isEmpty) {
//                             //       return "password must be filled";
//                             //     }
//                             //     return null;
//                             //   },
//                             //   enabled: cubit.isenabled,
//                             //   obscureText: true,
//                             //   decoration: InputDecoration(
//                             //     contentPadding: EdgeInsets.symmetric(
//                             //         horizontal: 10.0, vertical: 10.0),
//                             //     labelText: "Password",
//                             //     labelStyle: TextStyle(
//                             //         fontSize: 25.0, color: Color(0xff4793AF)),
//                             //     hintText: "." *
//                             //         cubit.userinfo!.password.toString().length,
//                             //     hintStyle: TextStyle(
//                             //         fontWeight: FontWeight.bold,
//                             //         fontSize:
//                             //             20.0), // that place * times password length
//                             //     alignLabelWithHint: false,
//                             //     floatingLabelBehavior:
//                             //         FloatingLabelBehavior.always,
//                             //   ),
//                             // ),
//                             SizedBox(
//                               height: 20.0,
//                             ),
//                             Center(
//                               child: state is loadingUpdateUserDataState
//                                   ? CircularProgressIndicator()
//                                   : MaterialButton(
//                                       onPressed: () {
//                                         if (cubit.editorupdatetext == "Edit") {
//                                           showDialog(
//                                               context: context,
//                                               builder: (contxet) {
//                                                 return AlertDialog(
//                                                   title: Text(
//                                                       "Enter Your password"),
//                                                   titleTextStyle: TextStyle(
//                                                       fontSize: 25.0,
//                                                       color: Colors.black),
//                                                   content: Form(
//                                                     key: secformkey,
//                                                     child: TextFormField(
//                                                       validator: (value) {
//                                                         if (value !=
//                                                             cubit.userinfo!
//                                                                 .password) {
//                                                           return "password is incorrect";
//                                                         }
//                                                         return null;
//                                                       },
//                                                       controller:
//                                                           passwordconfirm,
//                                                       decoration:
//                                                           InputDecoration(
//                                                               labelText:
//                                                                   "password"),
//                                                     ),
//                                                   ),
//                                                   actions: [
//                                                     MaterialButton(
//                                                       onPressed: () {
//                                                         Navigator.pop(context);
//                                                         passwordconfirm.text =
//                                                             "";
//                                                       },
//                                                       child: Text(
//                                                         "Cancel",
//                                                         style: TextStyle(
//                                                             color:
//                                                                 Colors.white),
//                                                       ),
//                                                       minWidth: 60.0,
//                                                       color: Colors.red,
//                                                       shape:
//                                                           ContinuousRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(20.0),
//                                                       ),
//                                                     ),
//                                                     state is loadingUpdateUserDataState || state is loadingUpdateAuthDataState? CircularProgressIndicator():MaterialButton(
//                                                       onPressed: () {
//                                                         if (secformkey
//                                                             .currentState!
//                                                             .validate()) {
//                                                           cubit
//                                                               .changeButtonText();
//                                                           cubit
//                                                               .changeEnabledValue();
//                                                           Navigator.pop(
//                                                               context);
//                                                           passwordconfirm.text =
//                                                               "";
//                                                         }
//                                                       },
//                                                       child: Text(
//                                                         "Submit",
//                                                         style: TextStyle(
//                                                             color:
//                                                                 Colors.white),
//                                                       ),
//                                                       minWidth: 60.0,
//                                                       color: Colors.blue,
//                                                       shape:
//                                                           ContinuousRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(20.0),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 );
//                                               });
//                                         } else {
//                                           if (formkey.currentState!
//                                               .validate()) {
//                                             cubit.updateUserData(
//                                                 firstname:
//                                                     firstnamecontroller.text,
//                                                 lastname:
//                                                     lastnamecontroller.text,
//                                                 email: emailcontroller.text,
//                                                 password:
//                                                     passwordcontroller.text);
//                                             cubit.updateUserAuthData(
//                                                 email: emailcontroller.text,
//                                                 password:
//                                                     passwordcontroller.text);
//                                           }
//                                         }
//                                       },
//                                       child: Text(
//                                         cubit.editorupdatetext,
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       minWidth: 100.0,
//                                       color: Color(0xff4CAF50),
//                                       shape: ContinuousRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(20.0),
//                                       ),
//                                     ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             } else if (state is FailedGetUserDataState) {
//               return Center(child: Text("Failed to load user data"));
//             } else {
//               return Center(child: Text("Unexpected state"));
//             }
//           }),
//         ),
//       ),
//     );
//   }
// }
