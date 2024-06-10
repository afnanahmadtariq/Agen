import 'dart:typed_data';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:async';


class View extends StatefulWidget {
  const View({super.key, this.progressExample = false});

  final bool progressExample;

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/tes.pdf');

    setState(() => _isLoading = false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDFViewer'),
      ),
      body: Center(
        child: _isLoading ? const Center(child: CircularProgressIndicator()) : 
        PDFViewer(
          document: document,
          lazyLoad: false,
          zoomSteps: 2,
          numberPickerConfirmWidget: const Text( "Confirm",),
          //uncomment below line to preload all pages
          // lazyLoad: false,
          // uncomment below line to scroll vertically
          scrollDirection: Axis.vertical,
          //uncomment below code to replace bottom navigation with your own
          // navigationBuilder:(context, page, totalPages, jumpToPage, animateToPage) {
          //   return ButtonBar(
          //     alignment: MainAxisAlignment.spaceEvenly,
          //     children: <Widget>[
          //       IconButton(
          //         icon: const Icon(Icons.first_page),
          //         onPressed: () {
          //           jumpToPage(page: 0);
          //         },
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.arrow_back),
          //         onPressed: () {
          //           animateToPage(page: page! - 2);
          //         },
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.arrow_forward),
          //         onPressed: () {
          //           animateToPage(page: page);
          //         },
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.last_page),
          //         onPressed: () {
          //           jumpToPage(page: totalPages! - 1);
                  // },
                // ),
              // ],
            // );
          // }, 
        ),
      ),
    );
  }
}


class PDFScreen extends StatefulWidget {
  final String? path;

  const PDFScreen({super.key, this.path});

  @override
  // ignore: library_private_types_in_public_api
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Document"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
                false, // if set to true the link is handled in flutter
            onRender: (pages) {
              setState(() {
                pages = pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              label: Text("Go to ${pages! ~/ 2}"),
              onPressed: () async {
                await snapshot.data!.setPage(pages! ~/ 2);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}