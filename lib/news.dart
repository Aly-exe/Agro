import 'package:agro/generated/l10n.dart';
import 'package:agro/models/wheatdatamodel.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class WheatNews extends StatelessWidget {
  WheatNews({super.key});

  List<WheatDataModel> wheatDataList = [
    WheatDataModel(
      img:
          'https://img.freepik.com/premium-photo/ripe-golden-wheat-field-sunny-daygenerative-ai_221128-24714.jpg?w=1060',
      title: 'Healthy Wheat',
      details:
          'Healthy wheat refers to wheat plants that are free from any diseases or pests. These plants exhibit vigorous growth with lush green leaves and sturdy stems. The leaves are typically uniform in color and show no signs of discoloration, spots, or lesions. The spikes or heads of healthy wheat plants are well-developed and filled with plump kernels. Healthy wheat plants play a crucial role in ensuring a successful harvest and optimal grain yield.',
    ),

    // Rust Wheat
    WheatDataModel(
      img: 'https://live.staticflickr.com/2839/9685492848_33a85eb8a3_b.jpg',
      title: 'Rust Wheat',
      details:
          'Rust is a common wheat disease caused by various fungal species belonging to the genera Puccinia and Phakopsora. It manifests as orange or reddish-brown lesions on the leaves, stems, and sometimes even the grains of wheat plants.',
    ),

    // Crown Root Wheat
    WheatDataModel(
      img:
          'https://www.theland.com.au/images/transform/v1/crop/frm/37uSWs3eyNM24fqefKJaatC/d940fc6a-6067-45b9-aaa7-1916214bfe74.png/r10_0_855_701_w1200_h678_fmax.jpg',
      title: 'Crown Root Wheat',
      details:
          'Crown rust is a fungal disease affecting wheat caused by the pathogen Puccinia coronata f. sp. avenae. It primarily affects the leaves of wheat plants, leading to the formation of distinctive yellowish pustules on the leaf surface.',
    ),

    // Stripe Wheat
    WheatDataModel(
      img:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGBZPSdncv13Naua4OJQB1RSRH6nbHgTKIX4IMDq85Rg&s',
      title: 'Stripe Wheat',
      details:
          'Stripe rust, also known as yellow rust, is a fungal disease caused by the pathogen Puccinia striiformis f. sp. tritici. It is one of the most economically important diseases affecting wheat worldwide.',
    ),

    // Loose Smut Wheat
    WheatDataModel(
      img: 'https://live.staticflickr.com/1403/5123744887_ef9b390a6e_b.jpg',
      title: 'Loose Smut Wheat',
      details:
          'Loose smut is a fungal disease affecting wheat heads caused by the fungus Ustilago tritici. It is characterized by the formation of black masses of spores on the heads of infected plants, leading to yield loss and reduction in grain quality.',
    ),
    WheatDataModel(
      img:
          'https://thumbs.dreamstime.com/b/wheat-grain-flour-22804776.jpg?w=360',
      title: 'Wheat in the Arab World',
      details:
          'Wheat is one of the essential agricultural crops grown in many Arab countries. It is used in the production of bread, pastries, and many other food products.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.fQjcqoU0bXB6xapfG8URKgHaEK?rs=1&pid=ImgDetMain',
      title: 'Wheat Production in Egypt',
      details:
          'Egypt is one of the largest wheat producers in the Arab world. Wheat is grown in various regions of Egypt and forms an important part of the Egyptian agricultural economy.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.DJ3uFk47x__tPnMyFDloKwHaHS?w=177&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'Different Types of Wheat',
      details:
          'There are many different types of wheat grown around the world, including hard wheat and soft wheat, each with its own uses in cooking and baking.',
    ),
    WheatDataModel(
      img:
          'https://www.kayawell.com/Data/SummerNoteImage/1b48556d-b34f-4298-ad46-2213589b347b.jpg',
      title: 'Health Benefits of Wheat',
      details:
          'Wheat is rich in many important nutrients such as fiber, vitamins, and minerals, and is beneficial for digestive health and the heart.',
    ),
    WheatDataModel(
      img:
          'https://static.agcanada.com/wp-content/uploads/2023/04/getty_saudi_arabia_alfalfa.jpeg',
      title: 'Wheat Cultivation in Saudi Arabia',
      details:
          'Saudi Arabia is working to increase its wheat production by using modern agricultural techniques and developing varieties suitable for the desert environment.',
    ),
    WheatDataModel(
      img:
          'https://www.visualcapitalist.com/wp-content/uploads/2022/07/wheat-production-by-country-2000-2020.jpg',
      title: 'Wheat and the Global Economy',
      details:
          'Wheat plays an important role in the global economy as one of the most traded crops worldwide, affecting food prices.',
    ),
    WheatDataModel(
      img:
          'https://2.bp.blogspot.com/-eCj4OfVCwU4/Udc7rXHCiMI/AAAAAAAAKYM/Hkw83WZNiVs/s1600/Roasted-Green-Wheat-with-Chicken.jpg',
      title: 'Wheat in Arab Cuisine',
      details:
          'Wheat is used in many traditional recipes in Arab cuisine, such as bread, pastries, and sweets.',
    ),
    WheatDataModel(
      img:
          'https://sustainablefarming.com.au/wp-content/uploads/2018/06/Wheat-Heads-Sustainable-Farming-Solutions.jpg',
      title: 'Sustainable Wheat Farming',
      details:
          'Sustainable farming aims to preserve natural resources and use techniques that minimize the environmental impact of wheat cultivation.',
    ),
    WheatDataModel(
      img: 'https://i.ytimg.com/vi/ZoCeXhpLntc/maxresdefault.jpg',
      title: 'History of Wheat Cultivation',
      details:
          'The cultivation of wheat dates back thousands of years and has been one of the most important crops contributing to the development of human civilizations.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.IG_k-zIh93UxNR_hS8fxagAAAA?rs=1&pid=ImgDetMain',
      title: 'Wheat Harvesting Techniques',
      details:
          'Wheat harvesting techniques have evolved over the years from simple hand tools to modern machines that increase harvesting efficiency.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.9tNorD8lg1hGiEHVlR0vsQHaFi?w=234&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'Organic Wheat',
      details:
          'Organic wheat is grown without the use of chemical pesticides or synthetic fertilizers, making it a healthy and environmentally friendly option.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.k2mzTvxfQeUElY0VrX4wNgHaEL?w=281&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'Wheat in Morocco',
      details:
          'Morocco is one of the countries that grows wheat in large quantities and uses it in many traditional dishes like couscous.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.vmUXSbgDUxvOF-zfn0GBbAHaD4?w=317&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'Challenges of Wheat Farming',
      details:
          'Wheat farming faces many challenges such as climate change and agricultural pests that affect productivity.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.3-fkRc9CUGp5mVYDhpazygHaE7?w=271&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'Wheat and Global Warming',
      details:
          'Global warming affects wheat cultivation by changing weather patterns and increasing temperatures, requiring the development of drought-resistant varieties.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.tmB7RkphhnVFuTSWrUfeGQAAAA?w=317&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'Wheat in Arab Culture',
      details:
          'Wheat holds a special place in Arab culture, symbolizing goodness and blessing, and is used in many traditional celebrations.',
    ),
    //________________________________________________
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/R.da1b3abdc917f7f63b3466d9d5d6e34f?rik=Q7tB3X4OxkWvwA&pid=ImgRaw&r=0',
      title: 'Wheat Consumption Trends',
      details:
          'Wheat consumption trends have evolved over the years, with a growing preference for whole grain products due to their health benefits. Whole wheat products are rich in fiber, vitamins, and minerals, which are beneficial for digestive health and reducing the risk of chronic diseases. There is also an increasing demand for gluten-free alternatives, leading to innovations in wheat processing to remove gluten while retaining nutritional value.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.sY9tnqg49hYlOXiGgAOx0gHaF7?rs=1&pid=ImgDetMain',
      title: 'Economic Impact of Wheat Trade',
      details:
          'Wheat trade has a significant economic impact on both exporting and importing countries. Major wheat exporters like the United States, Canada, and Russia play a crucial role in global food security. The trade dynamics affect prices, market stability, and the livelihoods of millions of farmers. Trade policies, tariffs, and international agreements are critical in shaping the global wheat market.',
    ),
    WheatDataModel(
      img:
          'https://www.herbazest.com/imgs/d/2/9/38336/wheat-nutrition-facts-940857-section.png',
      title: 'Nutritional Value of Wheat',
      details:
          'Wheat is a powerhouse of nutrition, providing essential nutrients such as carbohydrates, protein, fiber, and various vitamins and minerals. Whole wheat, in particular, is a good source of B vitamins, iron, magnesium, and zinc. These nutrients are vital for energy production, immune function, and overall health. Incorporating whole wheat into the diet can help manage weight, lower cholesterol levels, and improve gut health.',
    ),
    WheatDataModel(
      img:
          'https://www.iemed.org/wp-content/uploads/2022/05/2022-04-12T162020Z_1437440633_RC2SLT9ZCM64_RTRMADP_3_EGYPT-WHEAT-770x432.jpg',
      title: 'Wheat and Food Security',
      details:
          'Wheat plays a pivotal role in ensuring food security, especially in developing countries. It is a staple food for billions of people and provides a significant portion of daily caloric intake. Enhancing wheat production through improved farming practices and resilient crop varieties is essential to meet the growing global demand. Efforts to ensure access to wheat at affordable prices are crucial in combating hunger and malnutrition.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIF.VIO3YfXwHkirQ3nUop8aRA?w=233&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'Wheat Allergies and Intolerances',
      details:
          'Wheat allergies and intolerances, such as celiac disease, affect a small but significant portion of the population. These conditions can cause severe reactions to wheat proteins, necessitating strict dietary restrictions. Advances in food science have led to the development of gluten-free products, allowing those with wheat-related disorders to enjoy a varied diet without adverse health effects.',
    ),
    WheatDataModel(
      img:
          'https://www.foodbusinessnews.net/ext/resources/2019/9/WheatDroughtChart_Embedded.jpg',
      title: 'Impact of Climate Change on Wheat Production',
      details:
          'Climate change poses significant challenges to wheat production, with rising temperatures, altered precipitation patterns, and increased frequency of extreme weather events. These changes can affect wheat yields and quality, necessitating the development of heat-resistant and drought-tolerant wheat varieties. Farmers are also adopting new agricultural practices to mitigate the impact of climate change on wheat farming.',
    ),
    WheatDataModel(
      img: 'https://i.ytimg.com/vi/rZJWbkId3bk/maxresdefault.jpg',
      title: 'Organic Wheat Farming',
      details:
          'Organic wheat farming is gaining popularity as consumers seek healthier and more sustainable food options. This method avoids synthetic pesticides and fertilizers, focusing on natural soil enrichment and pest control techniques. Organic wheat farming promotes biodiversity, soil health, and environmental conservation. While organic wheat may have higher production costs, it offers benefits such as improved taste, nutritional value, and reduced chemical exposure.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/R.c5d44a9027174c81c4c8c71438e4fa48?rik=RgzC0FoLii1G3g&riu=http%3a%2f%2feattomorrow.com%2fblog%2fwp-content%2fuploads%2f2015%2f07%2fwheat_2012_processing_021-120702.jpg&ehk=05QguNxv6LtuQP9f9GNF5KHz5XSV1aHd9fOGCMu2H%2fg%3d&risl=&pid=ImgRaw&r=0',
      title: 'Wheat Processing Techniques',
      details:
          'Wheat processing involves several steps to transform raw grain into various products such as flour, bran, and germ. Milling is a crucial process where wheat is ground into flour of different textures and grades. Modern milling techniques ensure the efficient separation of wheat components, maximizing yield and quality. Advances in processing technology have also led to the production of enriched and fortified wheat products to enhance nutritional content.',
    ),
    WheatDataModel(
      img:
          'https://www.world-grain.com/ext/resources/Article-Images/2018/11--November/Wheat_Biotechnology_Photo-cred-Adobestock_E.jpg?height=488&t=1542723721&width=650',
      title: 'Genetic Improvement of Wheat',
      details:
          'Genetic improvement of wheat involves selective breeding and biotechnology to develop superior wheat varieties. These improvements aim to enhance yield, disease resistance, and adaptability to different environmental conditions. Genetically modified wheat can exhibit traits such as improved nutritional content, reduced need for chemical inputs, and better resilience to climate change. Ongoing research and innovation in wheat genetics are essential for sustainable agriculture.',
    ),
    WheatDataModel(
      img:
          'https://seedsofdiscovery.org/wp-content/uploads/sites/52/2014/10/IMG_2334-wheat-diversity-species-fan-ID.jpg',
      title: 'Wheat and Biodiversity',
      details:
          'Wheat cultivation has a complex relationship with biodiversity. While large-scale wheat farming can lead to monocultures and reduced biodiversity, sustainable practices can promote ecological balance. Crop rotation, intercropping, and the use of cover crops are strategies that enhance soil health and biodiversity. Protecting and preserving wild wheat relatives is also crucial for maintaining genetic diversity and developing resilient wheat varieties.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.1W8ObUzKqX7KrwluztWT3QHaHa?rs=1&pid=ImgDetMain',
      title: 'Historical Trade Routes of Wheat',
      details:
          'Historical trade routes played a vital role in the spread of wheat across different regions and cultures. The Silk Road, for example, facilitated the exchange of wheat and other goods between Asia, the Middle East, and Europe. These trade routes contributed to the diffusion of agricultural practices, culinary traditions, and economic development. Understanding the historical significance of wheat trade helps appreciate its impact on global history and cultural exchanges.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.7xzDWc7Z86kORAbItGZbUQHaD9?rs=1&pid=ImgDetMain',
      title: 'The Cultural Significance of Wheat Festivals',
      details:
          'Wheat festivals are celebrated in many cultures to mark the harvest season and honor the importance of wheat in local traditions. These festivals often include rituals, dances, and feasts that celebrate the bounty of the harvest. They are a testament to the deep cultural and historical connections people have with wheat, showcasing its role in community bonding and cultural heritage.',
    ),
    WheatDataModel(
      img:
          'https://www.azolifesciences.com/image.axd?picture=2020%2f7%2fshutterstock_700905340.jpg',
      title: 'Sustainable Wheat Farming Practices',
      details:
          'Sustainable wheat farming practices aim to protect the environment while maintaining high yields. Techniques such as crop rotation, reduced tillage, and organic farming help preserve soil health and reduce the use of synthetic chemicals. These practices contribute to long-term agricultural sustainability, ensuring that wheat can continue to be a reliable food source for future generations.',
    ),
    WheatDataModel(
      img: 'https://www.solaripedia.com/images/large/2613.gif',
      title: 'Wheat as a Biofuel Source',
      details:
          'Wheat can be used as a source of biofuel, providing an alternative to fossil fuels. Wheat straw and other by-products can be converted into ethanol, which can be used as a renewable energy source. This application of wheat helps in reducing carbon emissions and promotes sustainable energy solutions.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.5jt2z1YDp9sn1mdrZdvu2gHaFj?rs=1&pid=ImgDetMain',
      title: 'Soil Impact on Wheat Cultivation',
      details:
          'Soil quality and its impact on wheat cultivation are critical factors in productivity. Soil rich in organic matter and essential nutrients such as nitrogen, phosphorus, and potassium supports healthy wheat growth. Soil management techniques, such as crop rotation and the use of organic fertilizers, enhance soil health and increase crop yields.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/R.bf4c745bec0b07208cb624d48b13d6dd?rik=%2fY65oVT2%2fS%2fmSw&pid=ImgRaw&r=0',
      title: 'Challenges of Wheat Cultivation in Arid Regions',
      details:
          'Wheat cultivation in arid regions poses significant challenges due to water scarcity and harsh climatic conditions. Agricultural practices in these regions rely on efficient irrigation techniques and the cultivation of drought-resistant wheat varieties. Agricultural research contributes to developing solutions to improve wheat production in arid environments.',
    ),
    WheatDataModel(
      img:
          'https://images.squarespace-cdn.com/content/v1/57cf08d6bebafbc9907bae3a/1586061325932-SM2KGPNXU6K1CRQOPJZL/ke17ZwdGBToddI8pDm48kGns10gQWquDGk3O8tfBFZFZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpx5CO7Drpx5yjUxv8aId0gEbkUlSKW4Cfd_d5SLRKRrcw5jS_83x65K-dI47mD5sBg/image-asset.png',
      title: 'Local Varieties of Wheat',
      details:
          'Local varieties of wheat are adapted to the specific environmental conditions of each region. These varieties are characterized by their resistance to local diseases and pests. Preserving the diversity of local wheat varieties contributes to food security and helps in developing new varieties that adapt to climate changes.',
    ),
  ];
  List<WheatDataModel> wheatDataListArabic = [
    WheatDataModel(
      img: 'https://live.staticflickr.com/2839/9685492848_33a85eb8a3_b.jpg',
      title: 'صدأ القمح',
      details:
          'صدأ القمح هو مرض شائع في القمح يسببه مجموعة من الفطريات التابعة لأجناس بوسينيا وفاكوبسورا. يتمثل في ظهور بقع برتقالية أو بنية حمراء على الأوراق والسيقان، وفي بعض الأحيان حتى الحبوب لنباتات القمح.',
    ),
    WheatDataModel(
      img:
          'https://www.theland.com.au/images/transform/v1/crop/frm/37uSWs3eyNM24fqefKJaatC/d940fc6a-6067-45b9-aaa7-1916214bfe74.png/r10_0_855_701_w1200_h678_fmax.jpg',
      title: 'صدأ التاجي للقمح',
      details:
          'صدأ التاجي هو مرض فطري يؤثر على القمح يسببه مسبب فطري بوسينيا كوروناتا f. sp. avenae. يؤثر بشكل أساسي على أوراق نباتات القمح، مما يؤدي إلى ظهور بثور صفراء مميزة على سطح الورقة.',
    ),
    WheatDataModel(
      img:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGBZPSdncv13Naua4OJQB1RSRH6nbHgTKIX4IMDq85Rg&s',
      title: 'صدأ الشريطي للقمح',
      details:
          'صدأ الشريطي، المعروف أيضًا باسم الصدأ الأصفر، هو مرض فطري يسببه مسبب الفطر Puccinia striiformis f. sp. tritici. إنه أحد أهم الأمراض اقتصاديًا التي تؤثر على القمح على الصعيدين المحلي والعالمي.',
    ),
    WheatDataModel(
      img: 'https://live.staticflickr.com/1403/5123744887_ef9b390a6e_b.jpg',
      title: 'صدأ البذور للقمح',
      details:
          'صدأ البذور هو مرض فطري يؤثر على رؤوس القمح ويسببه فطر Ustilago tritici. يتميز بتكوين كتل سوداء من البذور على رؤوس النباتات المصابة، مما يؤدي إلى فقدان العائد وتقليل جودة الحبوب.',
    ),
    WheatDataModel(
      img:
          'https://thumbs.dreamstime.com/b/wheat-grain-flour-22804776.jpg?w=360',
      title: 'القمح في العالم العربي',
      details:
          'القمح هو أحد المحاصيل الزراعية الأساسية التي تُزرع في العديد من الدول العربية. يُستخدم القمح في إنتاج الخبز والمعجنات والعديد من المنتجات الغذائية الأخرى.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.fQjcqoU0bXB6xapfG8URKgHaEK?rs=1&pid=ImgDetMain',
      title: 'إنتاج القمح في مصر',
      details:
          'تعتبر مصر من أكبر منتجي القمح في العالم العربي. يتم زراعة القمح في مختلف المناطق المصرية ويشكل جزءًا هامًا من الاقتصاد الزراعي المصري.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.DJ3uFk47x__tPnMyFDloKwHaHS?w=177&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'أنواع القمح المختلفة',
      details:
          'هناك العديد من أنواع القمح المختلفة التي تُزرع حول العالم، منها القمح الصلب والقمح الطري، ولكل منها استخداماته الخاصة في الطهي والخبز.',
    ),
    WheatDataModel(
      img:
          'https://www.kayawell.com/Data/SummerNoteImage/1b48556d-b34f-4298-ad46-2213589b347b.jpg',
      title: 'فوائد القمح الصحية',
      details:
          'القمح غني بالعديد من العناصر الغذائية الهامة مثل الألياف والفيتامينات والمعادن، وهو مفيد لصحة الجهاز الهضمي والقلب.',
    ),
    WheatDataModel(
      img:
          'https://static.agcanada.com/wp-content/uploads/2023/04/getty_saudi_arabia_alfalfa.jpeg',
      title: 'زراعة القمح في السعودية',
      details:
          'تسعى السعودية لزيادة إنتاجها من القمح من خلال استخدام التقنيات الحديثة في الزراعة وتطوير الأصناف الملائمة للبيئة الصحراوية.',
    ),
    WheatDataModel(
      img:
          'https://www.visualcapitalist.com/wp-content/uploads/2022/07/wheat-production-by-country-2000-2020.jpg',
      title: 'القمح والاقتصاد العالمي',
      details:
          'يلعب القمح دورًا هامًا في الاقتصاد العالمي حيث يُعتبر من أكثر المحاصيل تداولًا على مستوى العالم ويؤثر على أسعار المواد الغذائية.',
    ),
    WheatDataModel(
      img:
          'https://2.bp.blogspot.com/-eCj4OfVCwU4/Udc7rXHCiMI/AAAAAAAAKYM/Hkw83WZNiVs/s1600/Roasted-Green-Wheat-with-Chicken.jpg',
      title: 'القمح في المطبخ العربي',
      details:
          'يُستخدم القمح في العديد من الوصفات التقليدية في المطبخ العربي، مثل الخبز والمعجنات والحلويات.',
    ),
    WheatDataModel(
      img:
          'https://sustainablefarming.com.au/wp-content/uploads/2018/06/Wheat-Heads-Sustainable-Farming-Solutions.jpg',
      title: 'الزراعة المستدامة للقمح',
      details:
          'الزراعة المستدامة تسعى للحفاظ على الموارد الطبيعية واستخدام التقنيات التي تقلل من الأثر البيئي لزراعة القمح.',
    ),
    WheatDataModel(
      img: 'https://i.ytimg.com/vi/ZoCeXhpLntc/maxresdefault.jpg',
      title: 'تاريخ زراعة القمح',
      details:
          'تعود زراعة القمح إلى آلاف السنين وقد كانت أحد أهم المحاصيل التي ساهمت في تطور الحضارات البشرية.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.IG_k-zIh93UxNR_hS8fxagAAAA?rs=1&pid=ImgDetMain',
      title: 'تقنيات حصاد القمح',
      details:
          'تطورت تقنيات حصاد القمح على مر السنين من الأدوات اليدوية البسيطة إلى الآلات الحديثة التي تزيد من كفاءة الحصاد.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.9tNorD8lg1hGiEHVlR0vsQHaFi?w=234&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'القمح العضوي',
      details:
          'القمح العضوي يُزرع بدون استخدام المبيدات الكيميائية أو الأسمدة الصناعية، مما يجعله خيارًا صحيًا وصديقًا للبيئة.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.k2mzTvxfQeUElY0VrX4wNgHaEL?w=281&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'القمح في المغرب',
      details:
          'يُعتبر المغرب من الدول التي تزرع القمح بكميات كبيرة ويُستخدم القمح في العديد من الأطباق التقليدية مثل الكسكس.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.vmUXSbgDUxvOF-zfn0GBbAHaD4?w=317&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'تحديات زراعة القمح',
      details:
          'تواجه زراعة القمح العديد من التحديات مثل التغيرات المناخية والآفات الزراعية التي تؤثر على الإنتاجية.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.3-fkRc9CUGp5mVYDhpazygHaE7?w=271&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'القمح والاحتباس الحراري',
      details:
          'تؤثر ظاهرة الاحتباس الحراري على زراعة القمح من خلال تغيير أنماط الطقس وزيادة درجات الحرارة، مما يتطلب تطوير أصناف مقاومة للجفاف.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.tmB7RkphhnVFuTSWrUfeGQAAAA?w=317&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'القمح في الثقافة العربية',
      details:
          'للقمح مكانة خاصة في الثقافة العربية حيث يُعتبر رمزًا للخير والبركة ويُستخدم في العديد من الاحتفالات التقليدية.',
    ),
    //____________________________________
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.sEs1lG-TTwWSwb0skuArDwHaEc?w=228&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'التقدم التكنولوجي في زراعة القمح',
      details:
          'لقد أحدثت التطورات التكنولوجية الأخيرة ثورة في زراعة القمح، مما جعلها أكثر كفاءة واستدامة. تسمح تقنيات الزراعة الدقيقة مثل المعدات الموجهة بنظام تحديد المواقع والطائرات بدون طيار للمزارعين بتحسين الزراعة والري والتسميد. تساعد هذه التقنيات على زيادة المحاصيل مع تقليل التأثير البيئي. بالإضافة إلى ذلك، أدت التطورات في الهندسة الوراثية إلى تطوير أصناف القمح المقاومة للآفات والأمراض.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/R.da1b3abdc917f7f63b3466d9d5d6e34f?rik=Q7tB3X4OxkWvwA&pid=ImgRaw&r=0',
      title: 'اتجاهات استهلاك القمح',
      details:
          'لقد تطورت اتجاهات استهلاك القمح على مر السنين، مع تزايد التفضيل للمنتجات المصنوعة من الحبوب الكاملة بسبب فوائدها الصحية. المنتجات المصنوعة من القمح الكامل غنية بالألياف والفيتامينات والمعادن، مما يفيد صحة الجهاز الهضمي ويقلل من خطر الأمراض المزمنة. هناك أيضًا طلب متزايد على البدائل الخالية من الغلوتين، مما يؤدي إلى ابتكارات في معالجة القمح لإزالة الغلوتين مع الحفاظ على القيمة الغذائية.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.sY9tnqg49hYlOXiGgAOx0gHaF7?rs=1&pid=ImgDetMain',
      title: 'التأثير الاقتصادي لتجارة القمح',
      details:
          'لتجارة القمح تأثير اقتصادي كبير على كل من الدول المصدرة والمستوردة. تلعب الدول المصدرة الكبرى مثل الولايات المتحدة وكندا وروسيا دورًا حاسمًا في الأمن الغذائي العالمي. تؤثر ديناميات التجارة على الأسعار واستقرار السوق وسبل عيش الملايين من المزارعين. تعتبر السياسات التجارية والرسوم الجمركية والاتفاقيات الدولية أمورًا حاسمة في تشكيل سوق القمح العالمي.',
    ),
    WheatDataModel(
      img:
          'https://www.herbazest.com/imgs/d/2/9/38336/wheat-nutrition-facts-940857-section.png',
      title: 'القيمة الغذائية للقمح',
      details:
          'يعتبر القمح مصدرًا غذائيًا قويًا، حيث يوفر العناصر الغذائية الأساسية مثل الكربوهيدرات والبروتين والألياف والفيتامينات والمعادن المختلفة. القمح الكامل على وجه الخصوص هو مصدر جيد لفيتامينات ب والحديد والمغنيسيوم والزنك. هذه العناصر الغذائية ضرورية لإنتاج الطاقة، ووظائف الجهاز المناعي، والصحة العامة. يمكن أن يساعد دمج القمح الكامل في النظام الغذائي على إدارة الوزن، وخفض مستويات الكوليسترول، وتحسين صحة الأمعاء.',
    ),
    WheatDataModel(
      img:
          'https://www.iemed.org/wp-content/uploads/2022/05/2022-04-12T162020Z_1437440633_RC2SLT9ZCM64_RTRMADP_3_EGYPT-WHEAT-770x432.jpg',
      title: 'القمح والأمن الغذائي',
      details:
          'يلعب القمح دورًا محوريًا في ضمان الأمن الغذائي، خاصة في الدول النامية. إنه طعام أساسي لمليارات الأشخاص ويوفر جزءًا كبيرًا من السعرات الحرارية اليومية. تعزيز إنتاج القمح من خلال تحسين الممارسات الزراعية وتطوير أصناف المحاصيل المقاومة أمر أساسي لتلبية الطلب العالمي المتزايد. الجهود لضمان الوصول إلى القمح بأسعار معقولة أمر حاسم في مكافحة الجوع وسوء التغذية.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIF.VIO3YfXwHkirQ3nUop8aRA?w=233&h=180&c=7&r=0&o=5&pid=1.7',
      title: 'حساسيات وعدم تحمل القمح',
      details:
          'حساسيات وعدم تحمل القمح، مثل مرض السيلياك، تؤثر على جزء صغير ولكن مهم من السكان. هذه الحالات يمكن أن تسبب ردود فعل شديدة تجاه بروتينات القمح، مما يستدعي قيودًا صارمة على النظام الغذائي. أدت التقدم في علم الأغذية إلى تطوير منتجات خالية من الغلوتين، مما يسمح لأولئك الذين يعانون من اضطرابات متعلقة بالقمح بالاستمتاع بنظام غذائي متنوع دون آثار صحية سلبية.',
    ),
    WheatDataModel(
      img:
          'https://www.foodbusinessnews.net/ext/resources/2019/9/WheatDroughtChart_Embedded.jpg',
      title: 'تأثير تغير المناخ على إنتاج القمح',
      details:
          'يطرح تغير المناخ تحديات كبيرة على إنتاج القمح، مع ارتفاع درجات الحرارة، وتغير أنماط هطول الأمطار، وزيادة تكرار الأحداث الجوية القاسية. يمكن أن تؤثر هذه التغييرات على غلة وجودة القمح، مما يستدعي تطوير أصناف القمح المقاومة للحرارة والجفاف. يتبنى المزارعون أيضًا ممارسات زراعية جديدة لتخفيف تأثير تغير المناخ على زراعة القمح.',
    ),
    WheatDataModel(
      img: 'https://i.ytimg.com/vi/rZJWbkId3bk/maxresdefault.jpg',
      title: 'الزراعة العضوية للقمح',
      details:
          'تزداد شعبية الزراعة العضوية للقمح حيث يسعى المستهلكون إلى خيارات غذائية أكثر صحة واستدامة. تتجنب هذه الطريقة المبيدات الحشرية والأسمدة الاصطناعية، مع التركيز على تحسين التربة الطبيعي وتقنيات مكافحة الآفات. تعزز الزراعة العضوية للقمح التنوع البيولوجي وصحة التربة والحفاظ على البيئة. بينما قد يكون للقمح العضوي تكاليف إنتاج أعلى، فإنه يقدم فوائد مثل الطعم المحسن، والقيمة الغذائية، وتقليل التعرض للمواد الكيميائية.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/R.c5d44a9027174c81c4c8c71438e4fa48?rik=RgzC0FoLii1G3g&riu=http%3a%2f%2feattomorrow.com%2fblog%2fwp-content%2fuploads%2f2015%2f07%2fwheat_2012_processing_021-120702.jpg&ehk=05QguNxv6LtuQP9f9GNF5KHz5XSV1aHd9fOGCMu2H%2fg%3d&risl=&pid=ImgRaw&r=0',
      title: 'تقنيات معالجة القمح',
      details:
          'تشمل معالجة القمح عدة خطوات لتحويل الحبوب الخام إلى منتجات مختلفة مثل الدقيق والنخالة والجنين. الطحن هو عملية حاسمة يتم فيها طحن القمح إلى دقيق بمختلف القوام والدرجات. تضمن تقنيات الطحن الحديثة الفصل الفعال لمكونات القمح، مما يزيد من الإنتاجية والجودة. أدت التطورات في تكنولوجيا المعالجة أيضًا إلى إنتاج منتجات قمح مدعمة ومحسنة لتعزيز المحتوى الغذائي.',
    ),
    WheatDataModel(
      img:
          'https://www.world-grain.com/ext/resources/Article-Images/2018/11--November/Wheat_Biotechnology_Photo-cred-Adobestock_E.jpg?height=488&t=1542723721&width=650',
      title: 'تحسين وراثة القمح',
      details:
          'يتضمن تحسين وراثة القمح التربية الانتقائية والتكنولوجيا الحيوية لتطوير أصناف القمح الفائقة. تهدف هذه التحسينات إلى زيادة الغلة، ومقاومة الأمراض، والقدرة على التكيف مع الظروف البيئية المختلفة. يمكن أن تظهر القمح المعدل وراثيًا خصائص مثل تحسين المحتوى الغذائي، وتقليل الحاجة إلى المدخلات الكيميائية، ومزيد من المرونة في مواجهة تغير المناخ. البحث والابتكار المستمر في وراثة القمح أمر ضروري للزراعة المستدامة.',
    ),
    WheatDataModel(
      img:
          'https://seedsofdiscovery.org/wp-content/uploads/sites/52/2014/10/IMG_2334-wheat-diversity-species-fan-ID.jpg',
      title: 'القمح والتنوع البيولوجي',
      details:
          'لدى زراعة القمح علاقة معقدة مع التنوع البيولوجي. بينما يمكن أن تؤدي زراعة القمح على نطاق واسع إلى تكوين المحاصيل الأحادية وتقليل التنوع البيولوجي، يمكن أن تعزز الممارسات المستدامة التوازن البيئي. تعتبر تدوير المحاصيل والزراعة المشتركة واستخدام محاصيل الغطاء استراتيجيات تعزز صحة التربة والتنوع البيولوجي. إن حماية وحفظ أقارب القمح البرية أمر حيوي للحفاظ على التنوع الجيني وتطوير أصناف القمح المقاومة.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.1W8ObUzKqX7KrwluztWT3QHaHa?rs=1&pid=ImgDetMain',
      title: 'طرق التجارة التاريخية للقمح',
      details:
          'لعبت طرق التجارة التاريخية دورًا حيويًا في انتشار القمح عبر مختلف المناطق والثقافات. على سبيل المثال، سهل طريق الحرير تبادل القمح والسلع الأخرى بين آسيا والشرق الأوسط وأوروبا. ساهمت هذه الطرق التجارية في نشر الممارسات الزراعية والتقاليد الطهوية والتنمية الاقتصادية. فهم الأهمية التاريخية لتجارة القمح يساعد في تقدير تأثيره على التاريخ العالمي والتبادل الثقافي.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.7xzDWc7Z86kORAbItGZbUQHaD9?rs=1&pid=ImgDetMain',
      title: 'الأهمية الثقافية لمهرجانات القمح',
      details:
          'تحتفل العديد من الثقافات بمهرجانات القمح للاحتفال بموسم الحصاد وتكريم أهمية القمح في التقاليد المحلية. تشمل هذه المهرجانات غالبًا طقوسًا ورقصات ومآدب تحتفل بوفرة الحصاد. إنها شهادة على الروابط الثقافية والتاريخية العميقة التي تربط الناس بالقمح، مما يُبرز دوره في الترابط المجتمعي والتراث الثقافي.',
    ),
    WheatDataModel(
      img:
          'https://www.azolifesciences.com/image.axd?picture=2020%2f7%2fshutterstock_700905340.jpg',
      title: 'ممارسات زراعة القمح المستدامة',
      details:
          'تهدف ممارسات زراعة القمح المستدامة إلى حماية البيئة مع الحفاظ على غلات عالية. تقنيات مثل تدوير المحاصيل، وتقليل الحرث، والزراعة العضوية تساعد في الحفاظ على صحة التربة وتقليل استخدام المواد الكيميائية الاصطناعية. تساهم هذه الممارسات في استدامة الزراعة على المدى الطويل، مما يضمن أن يظل القمح مصدرًا غذائيًا موثوقًا للأجيال القادمة.',
    ),
    WheatDataModel(
      img: 'https://www.solaripedia.com/images/large/2613.gif',
      title: 'القمح كمصدر للوقود الحيوي',
      details:
          'يمكن استخدام القمح كمصدر للوقود الحيوي، مما يوفر بديلاً للوقود الأحفوري. يمكن تحويل قش القمح وغيرها من المنتجات الثانوية إلى إيثانول، يمكن استخدامه كمصدر للطاقة المتجددة. يساعد هذا التطبيق للقمح في تقليل انبعاثات الكربون ويعزز حلول الطاقة المستدامة.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/OIP.5jt2z1YDp9sn1mdrZdvu2gHaFj?rs=1&pid=ImgDetMain',
      title: 'تأثير التربة على زراعة القمح',
      details:
          'تعتبر جودة التربة وتأثيرها على زراعة القمح عاملاً مهماً في الإنتاجية. التربة الغنية بالمواد العضوية والعناصر الغذائية الأساسية مثل النيتروجين والفوسفور والبوتاسيوم تدعم نمو القمح الصحي. تعمل تقنيات إدارة التربة، مثل الدورات الزراعية واستخدام الأسمدة العضوية، على تحسين صحة التربة وزيادة غلة المحاصيل.',
    ),
    WheatDataModel(
      img:
          'https://th.bing.com/th/id/R.bf4c745bec0b07208cb624d48b13d6dd?rik=%2fY65oVT2%2fS%2fmSw&pid=ImgRaw&r=0',
      title: 'تحديات زراعة القمح في المناطق القاحلة',
      details:
          'تشكل زراعة القمح في المناطق القاحلة تحديات كبيرة بسبب نقص المياه والظروف المناخية القاسية. تعتمد الممارسات الزراعية في هذه المناطق على تقنيات الري الفعّالة وزراعة أصناف القمح المقاومة للجفاف. تساهم البحوث الزراعية في تطوير حلول لتحسين إنتاج القمح في البيئات القاحلة.',
    ),
    WheatDataModel(
      img:
          'https://images.squarespace-cdn.com/content/v1/57cf08d6bebafbc9907bae3a/1586061325932-SM2KGPNXU6K1CRQOPJZL/ke17ZwdGBToddI8pDm48kGns10gQWquDGk3O8tfBFZFZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpx5CO7Drpx5yjUxv8aId0gEbkUlSKW4Cfd_d5SLRKRrcw5jS_83x65K-dI47mD5sBg/image-asset.png',
      title: 'الأصناف المحلية للقمح',
      details:
          'تشمل الأصناف المحلية للقمح تلك التي تتكيف مع الظروف البيئية الخاصة بكل منطقة. تتسم هذه الأصناف بقدرتها على مقاومة الأمراض والآفات المحلية. الحفاظ على تنوع الأصناف المحلية للقمح يساهم في الأمن الغذائي ويساعد في تطوير أصناف جديدة تتكيف مع التغيرات المناخية.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Positioned(
                    child:
                        Image.asset("assets/images/pexels-pixabay-248824.jpg")),
                // ALl you need about Wheat plant
                Positioned(
                    top: height * .24,
                    left: width * .05,
                    right: width * .05,
                    child: Text(
                      S.of(context).explor_Main_title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: wheatDataList.length,
            itemBuilder: (context, index) => CashHelper.getData(key: 'lang') ==
                    "en"
                ? WheatCardWidget(
                    width: width,
                    height: height,
                    title: wheatDataList[index].title,
                    image: wheatDataList[index].img,
                    details: wheatDataList[index].details,
                    onTap: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(wheatDataList[index].title),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(wheatDataList[index].img),
                                SizedBox(height: 10),
                                Text(wheatDataList[index].details),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          ),
                        ))
                : WheatCardWidget(
                    width: width,
                    height: height,
                    title: wheatDataListArabic[index].title,
                    image: wheatDataListArabic[index].img,
                    details: wheatDataListArabic[index].details,
                    onTap: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(wheatDataListArabic[index].title),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(wheatDataListArabic[index].img),
                                SizedBox(height: 10),
                                Text(wheatDataListArabic[index].details),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(S.of(context).close),
                              ),
                            ],
                          ),
                        )),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class WheatCardWidget extends StatelessWidget {
  WheatCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.image,
    required this.details,
    required this.onTap,
  });

  final double width;
  final double height;
  String? title;
  String? image;
  String? details;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(width * .04444),
        child: Container(
          height: height * .1984,
          width: width * .972,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xffF1EEDC),
          ),
          child: Row(
            children: [
              Container(
                width: width * .3888,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * .04444),
                      bottomLeft: Radius.circular(width * .04444)),
                  image: DecorationImage(
                    image: NetworkImage(
                      "${image}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: width * .02777),
              Container(
                width: width * .4583,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * .001,
                      ),
                      Text(
                        title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * .005,
                      ),
                      Text(
                        details!,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
