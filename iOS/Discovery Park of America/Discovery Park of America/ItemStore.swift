//
//  ItemStore.swift
//  Discovery Park of America
//
//  Created by Paul Gosser on 9/15/17.
//  Copyright © 2017 Paul Gosser. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    var arrayClients = [[String:String]]() // do not use NSMutableArray in Swift
    var dictClients = [String:String]()
    
    @discardableResult func createItem(name: String, info: String) -> Item {
        let newItem = Item(name: name, info: info)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    init() {
        var fileString = [String]()
        if let asset = NSDataAsset(name: "exhibits1") {
            let data = asset.data
            // Parts of this are from https://stackoverflow.com/questions/41822966/how-do-you-read-data-from-a-text-file-in-swift-3-xcode-8
            do {
                let attibutedString = try NSAttributedString(data: data, documentAttributes: nil)
                
                let fullText = attibutedString.string
                let readings = fullText.components(separatedBy: CharacterSet.newlines)
                var i = 0
                for line in readings {
                    let clientData = line.components(separatedBy: "\n")
                    fileString.append(clientData[0])
                    if i % 2 == 1 {
                        createItem(name: fileString[i-1], info: fileString[i])
                    }
                    i += 1
                }
            } catch {
                print("Data not accessed.")
            }
        } else {
            print("fail")
        }
//        for i in 0..<fileString.count {
//            createItem(filename: fileString[i])
//        }
//        for _ in 0..<15 {
//            createItem(filename: "test")
//            //print("here")
//        }
    }
}
