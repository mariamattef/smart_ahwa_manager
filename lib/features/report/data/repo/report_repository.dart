

import 'package:smart_ahwa_manager/features/order/data/models/top_selling_item.dart';

abstract class ReportRepository {
  Future<List<TopSellingItem>> getTopSellingItems();
}

class FakeReportRepository implements ReportRepository {
  @override
  Future<List<TopSellingItem>> getTopSellingItems() async {
  
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        TopSellingItem(
          imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuD6otVsWiZ5zwYd1xisOwNqDF52JrhRkBZamekvo2IQzZn8aaJ39qx2Q8AnBYk461bX-TfsO0WpoTKwgJQOpiMMON3xZ1v8ewBxf5idLFRSvuMW3LkoZVat0xyhx6C71KyKpZm6BmVn5Ybw3TOkk_AlCBm-4-vCKsCUDyTyh1LY2K0uFUVeKHJROquNTC27ATzzYpqBrqcM0c8HDI4ideCQ9u006X_JBJmOKuELk_LElLIXksRonAQB0jl2EcIp66p9UNfwW49z7_c",
          title: "Classic Ahwa",
          subtitle: "15 sold",
          rank: 1,
        ),
        TopSellingItem(
          imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDiMuYvefPrkVcH-QU7LGBj8Y8a6DycH-CkvlU6msqrM8Z-HBfX8Nmki6dcpY6v9hSeHly0ledl7j-wvZsEdakNUZS7A_KZJMk4ZSbTBr2gVFBJiU3saLGMm4suoe5L78piuaeZYs9AU1NaE9LQBNnkhV-Lc-tjIWYsItcRjJH3y-qxvqxy06OHrvT-BAULqfClMzO01d_OAGRUKCDegPf_hM0tRyF7aN40JKPeH9E5RWRIkU5ZJNKbpP44XVEkEnUZRm06nQ7xgps",
          title: "Mint Tea",
          subtitle: "12 sold",
          rank: 2,
        ),
        TopSellingItem(
          imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAJkHsSZ_Dsw76xCFghR7EtrgHWzk4hO9JX2xhfTKaHVCfaOKam2Ju5H0MIBAPMn7hSwpBegQRAnA_WtCeODilXgZfgm2wc15BydTc1FWcZHH0JNq9OR52AhJs3uL5-WBda_kayFLV3g96MLdTHF_PUVy5r3xoPSv1wrYFZHGQc6UERRxaXeRHk0us_CMHjn95hu2Pw2BcNWycnvehTtM9oQfldHqkCVQFuxUD0Lia3yZg_t5PToRyoNuAB30dbADcSFL9fVNbWFJE",
          title: "Karkadeh",
          subtitle: "10 sold",
          rank: 3,
        ),
        TopSellingItem(
          imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCyHmJXYbdi1QlSMkHZohIHGGSlsgB_I46zYnEUVF044axdx50xAS3rg_m3rXcpfmnSZfULgGoLBWIFp_kyJdwktHUsXnt7luUs6RtGXVhw4hoz_w7TVIJT5dFzJlixb1laG1dTSqV4K6uFEfjv-lzLUBKeJ8hbPgmq7jb0oMVgrYLprwwLsfttYA4St360dY3WhbtuxGbE-HDXQq-VPAFLdh8nhsiiAHfWmsSIFd66HqDeEvvyDFC-kv2y5vllykeVsHkV9SgaNRY",
          title: "Sahlab",
          subtitle: "8 sold",
          rank: 4,
        ),
      ],
    );
  }
}
