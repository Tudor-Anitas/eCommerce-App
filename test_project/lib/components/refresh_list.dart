import 'package:flutter/material.dart';

class RefreshList extends StatefulWidget {
  final Widget child;
  final Future Function() onRefresh;

  const RefreshList({required this.onRefresh, required this.child});

  @override
  _RefreshListState createState() => _RefreshListState();
}

class _RefreshListState extends State<RefreshList> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: widget.child, 
      onRefresh: widget.onRefresh
      );
  }
}
