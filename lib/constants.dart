import 'package:flutter/material.dart';

class Constants {
  static const String tasksBoxTitle = 'tasksToDoBox';
  static const String categoriesBoxTitle = 'categoriesToDoBox';
  static const String appTitle = 'Görevlerini Yönet';
  static const String emptyBoxTitle = 'Hiç görev bulunamadı!';
}

class TasksAddScreenConstants {
  final String okButtonTitle = 'Tamam';
  final String screenTitle = 'Yeni Görev Ekle';
  final String submitButtonTitle = 'Görevi Kaydet';
  final String titleControllerHintText = 'Görev Başlığı';
  final String descControllerHintText = 'Görev Açıklaması';
  final String emptyAlertTitle = 'Boş Alanları Doldurun Lütfen!';
}

class CategoryAddScreenConstants {
  final String okButtonTitle = 'Tamam';
  final String screenTitle = 'Yeni Kategori Ekle';
  final String submitButtonTitle = 'Kategoriyi Kaydet';
  final String categoryTitleControllerHintText = 'Kategori İsmi';
  final String colorDescription = 'Kategori Rengi';
  final String emptyAlertTitle = 'Boş Alanları Doldurun Lütfen!';
}

class LeftDrawerConstats {
  final String screenTitle = 'Görevlerini Yönet';
  final String completedPageTitle = 'Tamamlanan Görevler';
  final String recylePageTitle = 'Geri Dönüşüm Kutusu';
  final String settingsPageTitle = 'Ayarlar';
}

class HomePageConstats {
  final String pageTitle = 'Görevlerim';
  final String fabTitle = 'Yeni Görev Ekle';
  final String emptyBoxTitle = 'Tamamlanmayan görev bulunamadı.';
}

class ListTaskWidgetConstants {
  final String taskNotCompletedTitle = 'Görev tamamlandı olarak işaretlendi';
  final String taskCompletedTitle = 'Görev tamamlanmadı olarak işaretlendi';
  final String taskGoToRecyleTitle = 'Görev geri dönüşüme atıldı!';
  final String taskBackToRecyleTitle = 'Görev geri dönüşümden çıkarıldı!';
  final String taskDeletedTitle = 'Görev kalıcı olarak silindi!';
}

class SettingsPageConstants {
  final String pageTitle = 'Ayarlarım';
  final String darkModeTitle = 'Koyu Mod';
}

class ReyclePageConstants {
  final String pageTitle = 'Geri Dönüşüm Kutusu';
  final String emptyBoxTitle = 'Geri dönüşüm kutusu boş!';
  final String pageHintTitle =
      'Görevleri kalıcı olarak silmek için sağa kaydırın';
}

class CompletedPageConstants {
  final String pageTitle = 'Tamamlanan Görevler';
  final String emptyBoxTitle = 'Tamamlanan görev bulunamadı.';
}

class ColorConstants {
  final List<Color> allColor = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.brown,
    Colors.blue,
    Colors.grey,
    Colors.cyan,
    Colors.pink,
    Colors.teal,
  ];
}
