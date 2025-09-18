import 'package:smart_ahwa_manager/features/order/data/models/top_selling_item.dart';

import '../models/order_view_model.dart';

// Liskov Substitution Principle (LSP):
//  Interface Segregation Principle (ISP): The interface is small and focused

abstract class IOrderRepository {
  Future<List<Order>> getPendingOrders();
}

abstract class ReportRepository {
  Future<List<TopSellingItem>> getTopSellingItems();
}

// Single Responsibility Principle SRP
class MockOrderRepository implements IOrderRepository {
  @override
  Future<List<Order>> getPendingOrders() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Order(
        id: '1',
        customerName: 'Omar Hassan',
        drinkName: 'Iced Latte',
        details: 'Extra shot, no sugar',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDZ3ezzAf_nbpYxR35aRFmW9WLDrhpR1YUGGa7O8orCkWFDeecPr8HJ4WaYkfxstv6rFBNTGFT0TewFONtYa53dFoIrVAApTVayJcIg41oMPBIcoZVNE-wfRPqidrwhFxWqg5PVl9q7kcHQv7w0MDjNJsa-SyBvXciB7m8D3sUJaILXKKn5gs9MhxrSOAKibzOscAthzKYTWtHz_NCRzYSXaZumv83uraSROM8TdS-tSnlCsg9OlkrVPJsA-KBDiysThEW_HLkTNSg',
      ),
      Order(
        id: '2',
        customerName: 'Layla Ali',
        drinkName: 'Cappuccino',
        details: 'Light foam',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBzaYyGwQjOe30YwnXyQqP4-i2U0r3o2vZWkqaTKzOP9f1b3ro6PpGCttzaThthV_4zJ2jtDrwk1fn6qJt_9n6MXvWVq15-WZ8hgP-LmKKR1_3phNe42ePNG4wo_4-Z4mKzlJJVtSQWiK5zjGU13u1019Rs93S2sGiO1NH410FiMPDLn80m06ZTdFAuSbKnGftHknmXZePPuNFRQsR05pVed00ZBmaKPsUinCDZHL_0tc2TUKpDLvfK1sbwv0BktT8FIwzrMGi9ufw',
      ),
      Order(
        id: '3',
        customerName: 'Ahmed Ibrahim',
        drinkName: 'Espresso',
        details: 'Double shot',
        imageUrl:
            "https://lh3.googleusercontent.com/aida-public/AB6AXuCukgjXFrpG8WFcyTo0E90Cmd3lff45hdRgRuJVrMYltr2seG-r_TFayzQDgvD28LS2CUWny2gBwUyHwTWriJMYYE4FhiYDQd-9pxvz20IPj7VnNockaJI3Irds5P-rezTTRYyJ680yFXLu1r-nVGAJdSJ6o_2E7Iup-5uoi3Omth0dhmNjaZGa1dOJT0dyuGVFJqw0W1yIbM_BM1kNIBTVn0cPjkcwlv9IVnyzN4qW_WuhEa4YxIjSbqx0ZzNwZzIIkqKp1E4ktgQ",
      ),
      Order(
        id: '4',
        customerName: 'Fatima Mahmoud',
        drinkName: 'Mocha',
        details: 'Whipped cream',
        imageUrl:
            "https://lh3.googleusercontent.com/aida-public/AB6AXuAt-8H9Ka6jZ_L6F7NxHcjQYeEdbNm5DcMQojJxmv-r-aS_MtF2m37zd1tIaGks2EW_ykEHXqC_WXFb60LPo2hzSVntqZ3f70L_8KnD6qXWKrEbQntNF9-6YcjSeLEPVfp_lMuMwFqFBA7Q7iKpvgW1kQrH_2wvv4tOAlX0hpKIBfyLlOdvOR1LY4XfNyh9fWRzXOfEkMB1CtSOhvpcn5GpLFmwZ8MTRvECXf0vwFM8WtKDx9ovs4kHGTRPDxI-SueSRY5YeKN_5Yg",
      ),
    ];
  }
}

class FakeReportRepository implements ReportRepository {
  @override
  Future<List<TopSellingItem>> getTopSellingItems() async {
    // In a real app, this would fetch data from an API or database
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        TopSellingItem(
          imageUrl:
              "https://lh3.googleusercontent.com/aida-public/AB6AXuD6otVsWiZ5zwYd1xisOwNqDF52JrhRkBZamekvo2IQzZn8aaJ39qx2Q8AnBYk461bX-TfsO0WpoTKwgJQOpiMMON3xZ1v8ewBxf5idLFRSvuMW3LkoZVat0xyhx6C71KyKpZm6BmVn5Ybw3TOkk_AlCBm-4-vCKsCUDyTyh1LY2K0uFUVeKHJROquNTC27ATzzYpqBrqcM0c8HDI4ideCQ9u006X_JBJmOKuELk_LElLIXksRonAQB0jl2EcIp66p9UNfwW49z7_c",
          title: "Classic Ahwa",
          subtitle: "15 sold",
          rank: 1,
        ),
        TopSellingItem(
          imageUrl:
              "https://lh3.googleusercontent.com/aida-public/AB6AXuDiMuYvefPrkVcH-QU7LGBj8Y8a6DycH-CkvlU6msqrM8Z-HBfX8Nmki6dcpY6v9hSeHly0ledl7j-wvZsEdakNUZS7A_KZJMk4ZSbTBr2gVFBJiU3saLGMm4suoe5L78piuaeZYs9AU1NaE9LQBNnkhV-Lc-tjIWYsItcRjJH3y-qxvqxy06OHrvT-BAULqfClMzO01d_OAGRUKCDegPf_hM0tRyF7aN40JKPeH9E5RWRIkU5ZJNKbpP44XVEkEnUZRm06nQ7xgps",
          title: "Mint Tea",
          subtitle: "12 sold",
          rank: 2,
        ),
        TopSellingItem(
          imageUrl:
              "https://lh3.googleusercontent.com/aida-public/AB6AXuAJkHsSZ_Dsw76xCFghR7EtrgHWzk4hO9JX2xhfTKaHVCfaOKam2Ju5H0MIBAPMn7hSwpBegQRAnA_WtCeODilXgZfgm2wc15BydTc1FWcZHH0JNq9OR52AhJs3uL5-WBda_kayFLV3g96MLdTHF_PUVy5r3xoPSv1wrYFZHGQc6UERRxaXeRHk0us_CMHjn95hu2Pw2BcNWycnvehTtM9oQfldHqkCVQFuxUD0Lia3yZg_t5PToRyoNuAB30dbADcSFL9fVNbWFJE",
          title: "Karkadeh",
          subtitle: "10 sold",
          rank: 3,
        ),
        TopSellingItem(
          imageUrl:
              "https://lh3.googleusercontent.com/aida-public/AB6AXuCyHmJXYbdi1QlSMkHZohIHGGSlsgB_I46zYnEUVF044axdx50xAS3rg_m3rXcpfmnSZfULgGoLBWIFp_kyJdwktHUsXnt7luUs6RtGXVhw4hoz_w7TVIJT5dFzJlixb1laG1dTSqV4K6uFEfjv-lzLUBKeJ8hbPgmq7jb0oMVgrYLprwwLsfttYA4St360dY3WhbtuxGbE-HDXQq-VPAFLdh8nhsiiAHfWmsSIFd66HqDeEvvyDFC-kv2y5vllykeVsHkV9SgaNRY",
          title: "Sahlab",
          subtitle: "8 sold",
          rank: 4,
        ),
      ],
    );
  }
}
