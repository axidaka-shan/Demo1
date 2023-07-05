//
//  ContentView.swift
//  Demo1
//
//  Created by axidakaon 2020/6/5.
//  Copyright © 2020 shan. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
  let destinations: [AnyView] = [
        
    AnyView(EnvironmentDemoView3().environmentObject(MyEnvironmentObject())),
    
    AnyView(EnvironmentDemoView3ChildView().environmentObject(MyEnvironmentObject())),

    AnyView(GestureDemoView()),

    AnyView(TupleDemoView()),
    
    AnyView(DragDemoView(title: "aadad")),
    AnyView(DragDemoView2()),
    AnyView(DragDemoView3()),

    AnyView(StorageDemoView()),
    
    AnyView(FrameDemoView()),
    AnyView(FrameDemoView2()),
    AnyView(FrameDemoView3()),
    AnyView(FrameDemoView4()),
    AnyView(FrameDemoView5()),

    AnyView(LabelDemoView()),
              
    AnyView(TextDemoView()),
    AnyView(TextDemoView2()),
    AnyView(TextDemoView3()),

    AnyView(ButtonDemoView()),
    AnyView(ButtonDemoView2()),

    AnyView(ImageDemoView()),
    
    AnyView(TextFeildDemoView()),
    AnyView(TextFeildDemoView2()),
    AnyView(TextFeildDemoView3()),
    AnyView(TextFeildDemoView4()),

    AnyView(TextViewDemoView()),
    
    AnyView(StackDemoView()),
    AnyView(StackDemo2View()),
    AnyView(StackDemo3View()),
    
    AnyView(ListDemoView()),
    AnyView(ListDemoView2()),
    AnyView(ListHideSeparatorDemoView()),
    AnyView(ListDemoView3()),
    AnyView(ListDemoView4()),
    AnyView(ListDemoView5()),
    
    AnyView(VGridDemoView()),
    AnyView(HGridDemoView()),
    
    AnyView(TableDemoView()),
    
    AnyView(ScrollDemoView()),
    AnyView(ScrollDemoView2()),
    AnyView(ScrollDemoView3()),
    AnyView(ScrollDemoView4()),
    AnyView(ScrollViewDemoView()),

    AnyView(GroupDemoView()),
    
    AnyView(PushDemoView()),
    AnyView(PushDemoView2()),
    
    AnyView(DatePickerDemoView()),
    AnyView(DatePickerDemo2View()),
    AnyView(DatePickerDemo3View()),
    AnyView(DatePickerDemo4View()),
    
    AnyView(NotificationDemoView()),
    AnyView(NotificationDemoView2()),
    
    AnyView(ContextMenuDemoView(items: [Item(id: 1, name: "aaaaaa"), Item(id: 2, name: "bbbb")])),
    AnyView(DialogDemoView()),
    AnyView(ActionSheetDemoView()),
    AnyView(PopoverDemoView()),
    AnyView(SheetDemoPreviousView()),
    AnyView(SheetDemoView()),
    
    AnyView(AlertDemoView()),
    AnyView(AlertControllerDemoView()),
    AnyView(AlertControllerDemoView2()),
    
    AnyView(MapDemoView()),
    
    AnyView(ChangeColorDemoView()),
    AnyView(TimerDemoView()),
    
    AnyView(ToggleDemoView()),
    AnyView(BindingDemoView()),
    
    AnyView(RegisterDemoView()),
    AnyView(RegisterDemo2View()),
    
    AnyView(LoginDemoView())

      ]
  
  let textArray: [String] = [
    "EnvironmentDemoView3",
    "EnvironmentDemoView3ChildView",
    
    "GestureDemoView",
    "TupleDemoView",
    
    "DragDemoView",
    "DragDemoView2",
    "DragDemoView3",
    
    "StorageDemoView",
    
    "FrameDemoView",
    "FrameDemoView2",
    "FrameDemoView3",
    "FrameDemoView4",
    "FrameDemoView5",
    
    "LabelDemoView",
    
    "TextDemoView",
    "TextDemoView2",
    "TextDemoView3",

    "ButtonDemoView",
    "ButtonDemoView2",

    "ImageDemoView",
    
    "TextFeildDemoView",
    "TextFeildDemoView2",
    "TextFeildDemoView3",
    "TextFeildDemoView4",

    "TextViewDemoView",
    
    "StackDemoView",
    "StackDemo2View",
    "StackDemo3View",

    "ListDemoView",
    "ListDemoView2",
    "ListHideSeparatorDemoView",
    "ListDemoView3",
    "ListDemoView4",
    "ListDemoView5",
    
    "VGridDemoView",
    "HGridDemoView",
    
    "TableDemoView",
    
    "ScrollDemoView",
    "ScrollDemoView2",
    "ScrollDemoView3",
    "ScrollDemoView4",
    "ScrollViewDemoView",

    "GroupDemoView",
    
    "PushDemoView",
    "PushDemoView2",
    
    "DatePickerDemoView",
    "DatePickerDemo2View",
    "DatePickerDemo3View",
    "DatePickerDemo4View",
    
    "NotificationDemoView",
    "NotificationDemoView2",
    
    "ContextMenuDemoView",
    "DialogDemoView",
    "ActionSheetDemoView",
    "PopoverDemoView",
    "SheetDemoPreviousView",
    "SheetDemoView",
    
    "AlertDemoView",
    "AlertControllerDemoView",
    "AlertControllerDemoView2",
    
    "MapDemoView",
    
    "ChangeColorDemoView",
    "TimerDemoView",
    
    "ToggleDemoView",
    "BindingDemoView",
    
    "RegisterDemoView",
    "RegisterDemo2View",
    
    "LoginDemoView"
]
  
 
  
  var body: some View {
      NavigationView {
          List {
            ForEach(self.destinations.indices, id: \.self) { index in
                  NavigationLink(destination: self.destinations[index]) {
                      Text(textArray[index])
                  }
              }
          }
          .navigationBarTitle("列表")
      }
  }
  
}

