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
    
    @discardableResult func createItem(filename: String) -> Item {
        var fileString = [String]()
        if let asset = NSDataAsset(name: filename) {
            let data = asset.data
            
            // From https://stackoverflow.com/questions/41822966/how-do-you-read-data-from-a-text-file-in-swift-3-xcode-8
            do {
                let attibutedString = try NSAttributedString(data: data, documentAttributes: nil)
                
                let fullText = attibutedString.string
                let readings = fullText.components(separatedBy: CharacterSet.newlines)
                for line in readings {
                    let clientData = line.components(separatedBy: "\n")
                    fileString.append(clientData[0])
                }
            } catch {
                print("Data not accessed.")
            }
        } else {
            print("fail")
        }
        
        let newItem = Item(name: fileString[0], info: fileString[1])
        
        allItems.append(newItem)
        
        return newItem
    }
    
    init() {
        var fileString = [String]()
        if let asset = NSDataAsset(name: "FileNames") {
            let data = asset.data
            do {
                let attibutedString = try NSAttributedString(data: data, documentAttributes: nil)
                
                let fullText = attibutedString.string
                let readings = fullText.components(separatedBy: CharacterSet.newlines)
                for line in readings {
                    let clientData = line.components(separatedBy: "\n")
                    fileString.append(clientData[0])
                }
            } catch {
                print("Data not accessed.")
            }
        } else {
            print("fail")
        }
        for i in 0..<fileString.count {
            createItem(filename: fileString[i])
        }
//        for _ in 0..<15 {
//            createItem(filename: "test")
//            //print("here")
//        }
    }
}
