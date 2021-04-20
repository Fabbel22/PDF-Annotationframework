
import { Component, OnInit } from '@angular/core';
import {
  LinkAnnotationService, BookmarkViewService, MagnificationService, ThumbnailViewService,
  ToolbarService, NavigationService, TextSearchService, AnnotationService, TextSelectionService, PrintService
} from '@syncfusion/ej2-angular-pdfviewer';

@Component({
  selector: 'app-container',
  // specifies the template string for the PDF Viewer component
  templateUrl:  './app.component.html',
  providers: [LinkAnnotationService, BookmarkViewService, MagnificationService,
    ThumbnailViewService, ToolbarService, NavigationService, AnnotationService, TextSearchService, TextSelectionService, PrintService]
})
export class AppComponent implements OnInit {
  public service = 'https://ej2services.syncfusion.com/production/web-services/api/pdfviewer';
  public document = '../assets/files/pdf-lib_form_creation_example.pdf';
  ngOnInit(): void {
  }
}
