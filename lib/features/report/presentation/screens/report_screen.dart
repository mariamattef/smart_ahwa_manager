import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ahwa_manager/core/helper/app_color.dart';
import 'package:smart_ahwa_manager/features/order/data/repo/iorder_repository.dart';
import 'package:smart_ahwa_manager/features/report/data/models/report_view_model.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReportViewModel(reportRepository: FakeReportRepository()),
      child: Scaffold(
        backgroundColor: AppColors.gray50,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          shadowColor: Colors.black.withValues(alpha: 0.1),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.gray700,
            ),
            onPressed: () {
              // Handle back button press
            },
          ),
          title: const Text(
            'Reports',
            style: TextStyle(
              color: AppColors.gray900,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          actions: const [SizedBox(width: 48)],
        ),
        body: Consumer<ReportViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle('Date Range'),
                  const SizedBox(height: 12),
                  DateRangeSelector(viewModel: viewModel),
                  const SizedBox(height: 24),
                  TopSellingSection(viewModel: viewModel),
                  const SizedBox(height: 24),
                  const SectionTitle('Total Orders Served'),
                  const SizedBox(height: 16),
                  const TotalOrdersCard(),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.gray800,
      ),
    );
  }
}

class DateRangeSelector extends StatelessWidget {
  final ReportViewModel viewModel;
  const DateRangeSelector({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: List.generate(viewModel.dateRangeOptions.length, (index) {
          final isSelected = viewModel.selectedDateRangeIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => viewModel.onDateRangeChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    viewModel.dateRangeOptions[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.primary600
                          : AppColors.gray500,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class TopSellingSection extends StatelessWidget {
  final ReportViewModel viewModel;
  const TopSellingSection({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SectionTitle('Top-Selling Drinks'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey[300]!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: viewModel.selectedDrinkFilter,
                  icon: const Icon(Icons.expand_more, color: AppColors.gray700),
                  items: viewModel.drinkFilterOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray700,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) =>
                      viewModel.onDrinkFilterChanged(newValue),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        viewModel.isLoading
            ? const CircularProgressIndicator()
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.topSellingItems.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = viewModel.topSellingItems[index];
                  return TopSellingItemWidget(
                    imageUrl: item.imageUrl,
                    title: item.title,
                    subtitle: item.subtitle,
                    rank: item.rank,
                  );
                },
              ),
      ],
    );
  }
}

class TopSellingItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int rank;

  const TopSellingItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTopRank = rank == 1;
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray900,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.gray500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '#$rank',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isTopRank ? AppColors.primary600 : AppColors.gray700,
            ),
          ),
        ],
      ),
    );
  }
}

class TotalOrdersCard extends StatelessWidget {
  const TotalOrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.primary500,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary500.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Orders",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
              const Text(
                '45',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.local_cafe, color: Colors.white, size: 36),
          ),
        ],
      ),
    );
  }
}
