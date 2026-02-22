import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w4_practice/2_download_app/ui/theme/theme.dart';
import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key});

  //final DownloadController controller;

  // Get the icon based on download status
  IconData _downloadIcon(DownloadStatus status) {
    switch (status) {
      case DownloadStatus.notDownloaded:
        return Icons.download;
      case DownloadStatus.downloading:
        return Icons.downloading_outlined;
      case DownloadStatus.downloaded:
        return Icons.folder;
    }
  }

  @override
  Widget build(BuildContext context) {
    final DownloadController controller = context.watch<DownloadController>();

    String title = controller.ressource.name;
    String subTitle = controller.status == DownloadStatus.downloading || controller.status == DownloadStatus.downloaded
        ? "${controller.progress * 100} % completed - ${controller.downLoadSize} of ${controller.ressource.size}"
        : "";
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: TextStyle(color: AppColors.text)),
        subtitle: Text(subTitle, style: TextStyle(color: AppColors.textLight)),
        trailing: IconButton(
          onPressed: () => controller.startDownload(),
          icon: Icon(_downloadIcon(controller.status), color: AppColors.iconNormal),
        ),
      ),
    );
  }
}
