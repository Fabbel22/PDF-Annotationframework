import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PdfDocumentComponent } from './pdf-document/pdf-document.component';
import {DocumentViewerModule} from '@txtextcontrol/tx-ng-document-viewer';

@NgModule({
  declarations: [
    AppComponent,
    PdfDocumentComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    DocumentViewerModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
