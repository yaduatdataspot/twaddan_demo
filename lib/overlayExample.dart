import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  OverlayEntry? _overlayEntry;
  final ScrollController _scrollController = ScrollController();
  Offset _popupPosition = Offset.zero;

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: _popupPosition.dx,
        top: _popupPosition.dy,
        child: Material(
          color: Colors.transparent,
          child: _PopupContent(),
        ),
      ),
    );
  }

  void _showOverlay(BuildContext context, Offset position) {
    _popupPosition = position;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)!.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _updateOverlayPosition() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)!.insert(_overlayEntry!);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateOverlayPosition);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateOverlayPosition);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Custom Popup Example'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
            onTap: () {
              RenderBox renderBox = context.findRenderObject() as RenderBox;
              Offset position = renderBox.localToGlobal(Offset.zero);
              if (_overlayEntry == null) {
                _showOverlay(context, position);
              } else {
                _hideOverlay();
              }
            },
          );
        },
      ),
    );
  }
}

class _PopupContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Custom Popup'),
          ElevatedButton(
            onPressed: () {
              // Add your action here
            },
            child: Text('Action'),
          ),
        ],
      ),
    );
  }
}