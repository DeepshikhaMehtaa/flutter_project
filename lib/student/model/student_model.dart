import 'dart:convert';

 class Student {
   final String name;
   final String rollno;
  // final String image;
   Student({
     this.name,
     this.rollno,
     //this.image,
   });

   factory Student.fromJson(Map<String, dynamic>index)
   {
     return Student(
       name: index['name'],
       rollno: index['Rollno'],
  //     image: index['image'],
     );
   }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['name'] = this.name;
    data['Rollno'] = this.rollno;
  //   data['image'] = this.image;
     return data;
   }

 }