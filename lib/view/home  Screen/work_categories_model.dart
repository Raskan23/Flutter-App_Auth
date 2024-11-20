import 'package:MahiGo_Fix/utils/constant/app_image.dart';
import 'package:MahiGo_Fix/utils/constant/app_string.dart';

//Worker Categories
class WorkCategories {
  String? image;
  String? name;

  WorkCategories({
    this.image,
    this.name,

  });
}
List<WorkCategories> categoriesModel = [
  WorkCategories(
    image: AppImages.ACRepairIco,
    name: AppText.ACRepairIco,
  ),
  WorkCategories(
    image: AppImages.CarpenterIco,
    name: AppText.CarpenterIco,
  ),WorkCategories(
    image: AppImages.ElectricianIco,
    name: AppText.ElectricianIco,
  ),WorkCategories(
    image: AppImages.GardeningIco,
    name: AppText.GardeningIco,
  ),
  WorkCategories(
    image: AppImages.MasonIco,
    name: AppText.MasonIco,
  ),
  WorkCategories(
    image: AppImages.MechanicIco,
    name: AppText.MechanicIco,
  ),
  WorkCategories(
    image: AppImages.PlumberIco,
    name: AppText.PlumberIco,
  ),
  WorkCategories(
    image: AppImages.RoofingIco,
    name: AppText.RoofingIco,
  ),
  WorkCategories(
    image: AppImages.WelderIco,
    name: AppText.WelderIco,
  ),
  WorkCategories(
    image: AppImages.painterIco,
    name: AppText.painterIco,
  ),

];

// nearest Worker Container Model
class ServicesDetails {
  String? image;
  String? title;
  String? placeFar;
  String? rating;
  String? rate;

  ServicesDetails({
    this.image,
    this.title,
    this.placeFar,
    this.rating,
    this.rate,
  });
}
List<ServicesDetails>  servicesDetails =[
  ServicesDetails(
    image: AppImages.repairingPerson,
    title: AppText.cleaner,
    placeFar: AppText.cleaningFar,
    rating: AppText.cleaningStar,
    rate: AppText.cleaningRate,
  ),
  ServicesDetails(
    image: AppImages.carpenterPerson,
    title: AppText.carpenter,
    placeFar: AppText.plumberFar,
    rating: AppText.plumberStar,
    rate: AppText.plumberRate,
  ),
  ServicesDetails(
    image: AppImages.plumberPerson,
    title: AppText.repairer,
    placeFar: AppText.repairerFar,
    rating: AppText.repairerStar,
    rate: AppText.repairerRate,
  ),
  ServicesDetails(
    image: AppImages.ElectricianNew,
    title: AppText.electriciantext,
    placeFar: AppText.cleaningFar,
    rating: AppText.cleaningStar,
    rate: AppText.cleaningRate,
  ),
  ServicesDetails(
    image: AppImages.PainterNew,
    title: AppText.painttext,
    placeFar: AppText.plumberFar,
    rating: AppText.plumberStar,
    rate: AppText.plumberRate,
  ),

];