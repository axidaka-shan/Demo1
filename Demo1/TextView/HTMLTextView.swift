//
//  HTMLTextView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/24.
//  Copyright © 2023 shan. All rights reserved.
//

import UIKit
import SwiftUI
struct HTMLTextView: UIViewRepresentable {
  let htmlString: String
  let textColor: UIColor?
  let textFont: UIFont?
  let linkColor: UIColor?
  let linkFont: UIFont?

    func makeUIView(context: Context) -> UITextView {
      let textView = UITextView()
      textView.linkTextAttributes = [:]
      textView.dataDetectorTypes = UIDataDetectorTypes.link
      textView.isEditable = false
      textView.isUserInteractionEnabled = true
      textView.isScrollEnabled = true
      textView.showsVerticalScrollIndicator = false
      textView.showsHorizontalScrollIndicator = false
      textView.backgroundColor = UIColor.gray
//      textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: self.linkColor ?? UIColor.blue, NSAttributedString.Key.font: self.linkFont ?? UIFont.systemFont(ofSize: 13)]
      return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
      self.handleAttributedString(textView: uiView)
    }
  
  func handleAttributedString(textView: UITextView) {
    textView.text = htmlString
    
    guard let handleHtmlStr = htmlString.removingPercentEncoding, let data = handleHtmlStr.data(using: .utf8) else {
          return
    }
    
    var attrStr: NSAttributedString?

    do {
        attrStr = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
    } catch {
    }
    
    guard let attrString = attrStr else {
          return
    }
    
    let mutableAttrStr = NSMutableAttributedString(attributedString: attrString)
    attrString.enumerateAttributes(in: NSRange(location: 0, length: attrString.string.count), options: NSAttributedString.EnumerationOptions.reverse, using: { (attrs, range, _) in
        
        mutableAttrStr.removeAttribute(NSAttributedString.Key.font, range: range)
        mutableAttrStr.removeAttribute(NSAttributedString.Key.foregroundColor, range: range)
        if attrs[NSAttributedString.Key.link] != nil {
          mutableAttrStr.addAttributes([NSAttributedString.Key.font: self.linkFont ?? UIFont.systemFont(ofSize: 13)], range: range)
            mutableAttrStr.addAttributes([NSAttributedString.Key.foregroundColor: self.linkColor ?? UIColor.blue], range: range)
        } else {
            mutableAttrStr.addAttributes([NSAttributedString.Key.font: self.textFont ?? UIFont.systemFont(ofSize: 13)], range: range)
            mutableAttrStr.addAttributes([NSAttributedString.Key.foregroundColor: self.textColor ?? UIColor.black], range: range)
        }
    })
    textView.attributedText = mutableAttrStr
  }
}
