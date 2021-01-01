import 'package:flutter/material.dart';
import 'package:news_app/apperance/categorymodel.dart';

List<CategoryModel> getcategories()
{
  List<CategoryModel> category=new List<CategoryModel>();


  CategoryModel categorymodel=new CategoryModel();
  categorymodel.imageurl="https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1532692365000/photosp/31e3986d-d479-4505-b68b-dbaf776dbaa1/stock-photo-business-communication-cooperation-teamwork-professional-meeting-business-person-partnership-successful-31e3986d-d479-4505-b68b-dbaf776dbaa1.jpg";
  categorymodel.categoryname="Business";
  category.add(categorymodel);





  categorymodel=new CategoryModel();
  categorymodel.imageurl="https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1532692365000/photosp/31e3986d-d479-4505-b68b-dbaf776dbaa1/stock-photo-business-communication-cooperation-teamwork-professional-meeting-business-person-partnership-successful-31e3986d-d479-4505-b68b-dbaf776dbaa1.jpg";
  categorymodel.categoryname="Entertainment";
  category.add(categorymodel);

  categorymodel=new CategoryModel();
  categorymodel.imageurl="https://www.liberty.edu/champion/wp-content/uploads/2020/03/SPORTS-800x280.jpg";
  categorymodel.categoryname="Sports";
  category.add(categorymodel);



  categorymodel=new CategoryModel();
  categorymodel.imageurl="https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1532692365000/photosp/31e3986d-d479-4505-b68b-dbaf776dbaa1/stock-photo-business-communication-cooperation-teamwork-professional-meeting-business-person-partnership-successful-31e3986d-d479-4505-b68b-dbaf776dbaa1.jpg";
  categorymodel.categoryname="Science";
  category.add(categorymodel);


  categorymodel=new CategoryModel();
  categorymodel.imageurl="https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1532692365000/photosp/31e3986d-d479-4505-b68b-dbaf776dbaa1/stock-photo-business-communication-cooperation-teamwork-professional-meeting-business-person-partnership-successful-31e3986d-d479-4505-b68b-dbaf776dbaa1.jpg";
  categorymodel.categoryname="Technology";
  category.add(categorymodel);


  categorymodel=new CategoryModel();
  categorymodel.imageurl="https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1532692365000/photosp/31e3986d-d479-4505-b68b-dbaf776dbaa1/stock-photo-business-communication-cooperation-teamwork-professional-meeting-business-person-partnership-successful-31e3986d-d479-4505-b68b-dbaf776dbaa1.jpg";
  categorymodel.categoryname="Entertainment";
  category.add(categorymodel);




  return category;

}