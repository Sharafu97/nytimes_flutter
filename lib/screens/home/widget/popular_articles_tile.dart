import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ny_times_flutter/config/routes.dart';
import 'package:ny_times_flutter/models/user_details_model.dart';
import 'package:ny_times_flutter/theme/colors.dart';
import 'package:ny_times_flutter/utils/build_context.dart';

class PopularArticleTile extends StatefulWidget {
  const PopularArticleTile({super.key, required this.article});
  final Articles article;
  @override
  State<PopularArticleTile> createState() => _PopularArticleTileState();
}

class _PopularArticleTileState extends State<PopularArticleTile> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.details,
          arguments: widget.article),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.responsive(20)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 15,
              child: CachedNetworkImage(
                imageUrl: widget.article.media != null &&
                        widget.article.media!.isNotEmpty
                    ? widget.article.media![0].mediaMetadata![0].url ?? ''
                    : '',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(width: context.responsive(8)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.article.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          widget.article.byline ?? '',
                          style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.formFieldText.withOpacity(0.8)),
                        ),
                      ),
                      const Icon(Icons.calendar_today, size: 12),
                      Text(
                        '\t ${widget.article.publishedDate}',
                        style: textTheme.bodyMedium!.copyWith(
                            height: 0.5,
                            fontWeight: FontWeight.w500,
                            color: AppColors.formFieldText.withOpacity(0.8)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: context.responsive(8)),
            const Icon(Icons.arrow_forward_ios_outlined, size: 16)
          ],
        ),
      ),
    );
  }
}
