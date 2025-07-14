import 'package:get/get.dart';

class StatisticsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }


  final List<Map<String, dynamic>> appData = [
    {
      'icon': 'whatsapp',
      'name': 'WhatsApp',
      'time': '25m 10s',
      'progress': 0.9, // 90%
    },
    {
      'icon': 'snapchat',
      'name': 'Snapchat',
      'time': '12m 05s',
      'progress': 0.4,
    },
    {
      'icon': 'instagram',
      'name': 'Instagram',
      'time': '12m 05s',
      'progress': 0.2, 
    },
    {
      'icon': 'whatsapp',
      'name': 'WhatsApp',
      'time': '25m 10s',
      'progress': 0.9,
    },
    {
      'icon': 'snapchat',
      'name': 'Snapchat',
      'time': '12m 05s',
      'progress': 0.4, 
    },
    {
      'icon': 'instagram',
      'name': 'Instagram',
      'time': '12m 05s',
      'progress': 0.2, 
    },
   
  ];

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
