/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 10/03/2026, 01:33
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> _overlayNavigatorKey = GlobalKey<NavigatorState>();

void showOverlay({required BuildContext context}) {
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) {
      return FocusScope(
        autofocus: true,
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;

            // Cek navigator internal overlay
            if (_overlayNavigatorKey.currentState?.canPop() ?? false) {
              _overlayNavigatorKey.currentState?.maybePop();
            } else {
              overlayEntry.remove(); // Jika sudah di root overlay, baru close
            }
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_overlayNavigatorKey.currentState?.canPop() ?? false) {
                      _overlayNavigatorKey.currentState?.pop();
                    } else {
                      overlayEntry.remove();
                    }
                  },
                  child: Container(color: Colors.black45),
                ),
                Center(
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Navigator(
                        key: _overlayNavigatorKey,
                        onGenerateRoute: (settings) {
                          return MaterialPageRoute(
                            builder: (navContext) => _buildStatusPage(navContext, overlayEntry),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  );
  Overlay.of(context).insert(overlayEntry);
}

Widget _buildStatusPage(BuildContext context, OverlayEntry entry) {
  return Scaffold(
    appBar: AppBar(title: Text("Pilih Status"), leading: CloseButton(onPressed: () => entry.remove())),
    body: ListTile(
      title: Text("Status"),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (c) => _buildCheckboxPage(c)),
        );
      },
    ),
  );
}

Widget _buildCheckboxPage(BuildContext context) {
  return PopScope(
    canPop: false,
    onPopInvokedWithResult: (didPop, result) {
      if (didPop) return;
      Navigator.pop(context);
    },
    child: Scaffold(
      appBar: AppBar(title: Text("Detail Aktif")),
      body: Column(
        children: [
          Expanded(
            child: CheckboxListTile(
              title: Text("Aktif"),
              value: true,
              onChanged: (val) {},
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: Text("Tidak Aktif"),
              value: false,
              onChanged: (val) {},
            ),
          ),
        ],
      ),
    ),
  );
}