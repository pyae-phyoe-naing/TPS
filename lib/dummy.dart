import 'package:tps_ros/model/category.dart';
import 'package:tps_ros/model/menu.dart';
import 'package:tps_ros/model/note.dart';

List<Category> categories = [
  Category(id: 1, name: 'Tea'),
  Category(id: 2, name: 'Juice'),
  Category(id: 3, name: 'Fried rice'),
  Category(id: 4, name: 'Noodle'),
  Category(id: 5, name: 'Noodle'),
  Category(id: 6, name: 'Noodle'),
  Category(id: 7, name: 'Noodle'),
  Category(id: 8, name: 'Noodle'),
  Category(id: 9, name: 'Noodle'),
  Category(id: 10, name: 'Noodle'),
];

List<Menu> menus = [
  Menu(id: 1, categoryId: 3, name: 'Fried rice(chicken)'),
  Menu(id: 2, categoryId: 3, name: 'Fried rice(pig)'),
  Menu(id: 3, categoryId: 2, name: 'Orange Juice'),
  Menu(id: 4, categoryId: 4, name: 'Shan Noodle (chicken)'),
  Menu(id: 5, categoryId: 3, name: 'Fried rice(sea food)'),
  Menu(id: 6, categoryId: 1, name: 'Tea(sweet)'),
  Menu(id: 7, categoryId: 2, name: 'Apple Juice'),
  Menu(id: 8, categoryId: 1, name: 'Tea(light sweet)'),
  Menu(id: 9, categoryId: 1, name: 'Tea(normal)'),
  Menu(id: 10, categoryId: 3, name: 'Fried rice(plane)'),
  Menu(id: 11, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 12, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 13, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 14, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 15, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 16, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 17, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 18, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 19, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 20, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 21, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 22, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 23, categoryId: 3, name: 'Fried rice(fried eggs)'),
  Menu(id: 24, categoryId: 2, name: 'Banana Juice'),
];

List<Note> notes = [
  Note(id: 1, categoryId: 3, note: 'no spicy'),
  Note(id: 2, categoryId: 4, note: 'no parsley'),
  Note(id: 3, categoryId: 3, note: 'spicy'),
  Note(id: 4, categoryId: 3, note: 'no onion'),
  Note(id: 5, categoryId: 3, note: 'no carrot'),
  Note(id: 6, categoryId: 1, note: 'less sugar'),
  Note(id: 7, categoryId: 1, note: 'more sugar'),
  Note(id: 8, categoryId: 3, note: 'Task3'),
  Note(id: 9, categoryId: 4, note: 'Task-4'),
  Note(id: 10, categoryId: 2, note: 'Task-2'),
  Note(id: 11, categoryId: 3, note: 'Task-33'),
];

class Dummy {
  static List selectedMenu = [];

  static reduceMenu(Menu menu, {int noteId = 0}) {
    if (noteId != 0) {
      var qty = selectedMenu.firstWhere(
          (m) => m['menu'].id == menu.id && m['noteId'] == noteId,
          orElse: () => 0)['qty'];
      if (qty > 1) {
        selectedMenu.firstWhere(
            (m) => m['menu'].id == menu.id && m['noteId'] == noteId,
            orElse: () => 0)['qty']--;
      } else {
        selectedMenu.removeWhere(
            (m) => m['menu'].id == menu.id && m['noteId'] == noteId);
      }
      return;
    }
    var data = selectedMenu.firstWhere(
        (m) => m['menu'].id == menu.id && m['noteId'] == 0,
        orElse: () => 0);

    if (data['qty'] > 1) {
      data['qty']--;
      return;
    }else{
      selectedMenu.removeWhere(
              (m) => m['menu'].id == menu.id && m['noteId'] == noteId);
    }
  }

  static selectMenu(Menu menu, {int noteId = 0}) {
    if (noteId != 0) {
      List exist = selectedMenu.where((m) => m['menu'].id == menu.id).toList();

      var data =
          exist.firstWhere((ex) => ex['noteId'] == noteId, orElse: () => 0);
      if (data == 0 && exist.length != 1) {
        Map obj = {'qty': 1, 'menu': menu, 'noteId': noteId};
        selectedMenu.add(obj);
        var qty = selectedMenu.firstWhere(
            (m) => m['menu'].id == menu.id && m['noteId'] == 0,
            orElse: () => 0)['qty'];
        if (qty == 1) {
          selectedMenu
              .removeWhere((m) => m['menu'].id == menu.id && m['noteId'] == 0);
        } else {
          selectedMenu.firstWhere(
              (m) => m['menu'].id == menu.id && m['noteId'] == 0,
              orElse: () => 0)['qty']--;
        }
        return;
      } else {
        if (exist.length == 1 &&
            selectedMenu.length == 1 &&
            exist[0]['noteId'] == 0) {
          var qty = selectedMenu.firstWhere(
              (m) => m['menu'].id == menu.id && m['noteId'] == 0,
              orElse: () => 0)['qty'];
          if (qty == 1) {
            selectedMenu.removeWhere(
                (m) => m['menu'].id == menu.id && m['noteId'] == 0);
          } else {
            selectedMenu.firstWhere(
                (m) => m['menu'].id == menu.id && m['noteId'] == 0)['qty']--;
          }
          Map obj = {'qty': 1, 'menu': menu, 'noteId': noteId};
          selectedMenu.add(obj);
          return;
        } else if (selectedMenu
            .where((ex) => ex['menu'].id == menu.id && ex['noteId'] == noteId)
            .toList()
            .isNotEmpty) {
          selectedMenu
              .where((ex) => ex['menu'].id == menu.id && ex['noteId'] == noteId)
              .toList()[0]['qty']++;
          var data = selectedMenu
              .where((ex) => ex['menu'].id == menu.id && ex['noteId'] == 0)
              .toList();
          if (data.isNotEmpty) {
            if (data[0]['qty'] == 1) {
              selectedMenu.removeWhere(
                  (ex) => ex['menu'].id == menu.id && ex['noteId'] == 0);
            } else {
              data[0]['qty']--;
            }
          }

          return;
        } else if (selectedMenu.length > 1) {
          var qty = selectedMenu.firstWhere(
              (m) => m['menu'].id == menu.id && m['noteId'] == 0,
              orElse: () => 0)['qty'];
          if (qty == 1) {
            selectedMenu.removeWhere(
                (ex) => ex['menu'].id == menu.id && ex['noteId'] == 0);
          } else {
            selectedMenu.firstWhere(
                (m) => m['menu'].id == menu.id && m['noteId'] == 0,
                orElse: () => 0)['qty']--;
          }
          Map obj = {'qty': 1, 'menu': menu, 'noteId': noteId};
          selectedMenu.add(obj);
          return;
        } else {
          Map obj = {'qty': 1, 'menu': menu, 'noteId': noteId};
          selectedMenu.add(obj);
          var qty = selectedMenu.firstWhere(
              (m) => m['menu'].id == menu.id && m['noteId'] == 0,
              orElse: () => 0)['qty'];
          if (qty > 1) {
            qty--;
          }
          return;
        }
      }
    }

    List exist = selectedMenu
        .where((m) => m['menu'].id == menu.id && m['noteId'] == 0)
        .toList();

    if (exist.isNotEmpty && exist[0]['noteId'] == 0) {
      exist[0]['qty']++;
      return;
    }
    if (exist.length > 1) {
      var data = exist.firstWhere(
          (m) => m['menu'].id == menu.id && m['noteId'] == 0,
          orElse: () => 0);
      if (data == 0) {
        Map obj = {'qty': 1, 'menu': menu, 'noteId': 0};
        selectedMenu.add(obj);
      }

      return;
    }

    Map obj = {'qty': 1, 'menu': menu, 'noteId': 0};
    selectedMenu.add(obj);
  }

  static getNote(int id) {
    return notes.where((n) => n.id == id).toList();
  }

  static List<Menu> selectCatByMenus(int catId) {
    return menus.where((m) => m.categoryId == catId).toList();
  }

  static List<Note> selectCatBNotes(int catId) {
    return notes.where((n) => n.categoryId == catId).toList();
  }

  static findById(list, int id) {
    findById(obj) => obj.id == id;
    var result = list.where(findById);
    return result.length > 0 ? result.first : null;
  }
}
