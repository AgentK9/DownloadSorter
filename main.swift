//
//  main.swift
//  DownloadSorter
//
//  Created by Keegan on 11/19/20.
//

import Foundation

let fm = FileManager.default
let userHome = "/Users/keegan/"
let path = userHome + "Downloads/"
let desktopPath = userHome + "Desktop/"
var items: [String] = [String]()

do {
    items = try fm.contentsOfDirectory(atPath: path)
} catch {
    print("failed to read directory: " + path)
    // failed to read directory – bad permissions, perhaps?
}

for item in items {
    let currPath = path + item
    do {
        switch item.lowercased() {
        case _ where item.contains("bi141"):
            try fm.moveItem(atPath: currPath, toPath: desktopPath + "School/BI141/" + item)
        case _ where item.contains("chapter"):
            try fm.moveItem(atPath: currPath, toPath: desktopPath + "School/" + item)
        case _ where item.contains("report"):
            try fm.moveItem(atPath: currPath, toPath: desktopPath + "School/SC/Fall 2020/" + item)
        case _ where item.contains("proposal"):
            try fm.moveItem(atPath: currPath, toPath: desktopPath + "School/SC/Fall 2020/" + item)
        case _ where item.contains("sc "):
            try fm.moveItem(atPath: currPath, toPath: desktopPath + "School/SC/Fall 2020/" + item)
        default:
            if item == ".DS_Store" {
                continue
            }
            print("Found \(item)")
            try fm.moveItem(atPath: currPath, toPath: desktopPath + "Default/" + item)
        }
    } catch {
        print("Failed to move file \(path + item) with error \(error)")
    }
}
