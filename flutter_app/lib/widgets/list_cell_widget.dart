import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/listable.dart';

class ListCellWidget<T extends Listable> extends StatefulWidget {
  final T item;
  final Function()? onTap;

  const ListCellWidget({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  State<ListCellWidget> createState() => _ListCellWidgetState();
}

class _ListCellWidgetState extends State<ListCellWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.item.title),
            Text(widget.item.subtitle),
          ],
        ),
      ),
      onTap: widget.onTap ?? () {},
    );
  }
}