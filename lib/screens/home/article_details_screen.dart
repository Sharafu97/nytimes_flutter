import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ny_times_flutter/models/user_details_model.dart';

import '../../theme/colors.dart';

class ArticleDetails extends StatefulWidget {
  const ArticleDetails({super.key, required this.article});

  final Articles? article;

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          if (widget.article!.media != null && widget.article!.media!.isNotEmpty
              ? widget.article!.media![0].mediaMetadata != null &&
                  widget.article!.media![0].mediaMetadata!.isNotEmpty
              : false) ...[
            CachedNetworkImage(
              imageUrl: widget.article!.media![0].mediaMetadata![2].url ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Text(
              widget.article!.media != null && widget.article!.media!.isNotEmpty
                  ? widget.article!.media![0].caption ?? ''
                  : '',
              style: textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ],
          Column(
            children: [
              const SizedBox(height: 25),
              Text(
                widget.article!.title ?? '',
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 15),
              Text(
                widget.article?.abstract ?? '',
                style: textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
