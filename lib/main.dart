
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:voidapp/app/routes/app_pages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  runApp(
    Sizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
            title: "Void",
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
           
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                data: data.copyWith(
                  textScaler: const TextScaler.linear(1.1),
                  viewInsets: data.viewInsets,
                ),
                child: child ?? Container(),
              );
            },
          );
       
      }
    )
  );
}