//
//  FakeAppDelegate.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

class FakeAppDelegate: NSObject {
    
    private let filename = "log_tests.txt"
    
    private var filepath: URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError() }
        return path.appendingPathComponent(filename)
    }
    
    private var logMessageData: Data {
        let timestamp = Date().timeIntervalSince1970
        let textMessage = "Test started at \(timestamp)"
        guard let data = "\(textMessage)\n".data(using: .utf8, allowLossyConversion: false) else { fatalError() }
        return data
    }
    
    override init() {
        super.init()
        
        writeTestLog()
    }
    
    private func writeTestLog() {
        if FileManager.default.fileExists(atPath: filepath.path) {
            appendLog()
        } else {
            writeFirstLog()
        }
    }
    
    private func appendLog() {
        if let fileHandle = FileHandle(forWritingAtPath: filepath.path) {
            fileHandle.seekToEndOfFile()
            fileHandle.write(logMessageData)
            fileHandle.closeFile()
        }
    }
    
    private func writeFirstLog() {
        do {
            try logMessageData.write(to: filepath, options: .atomicWrite)
        } catch { }
    }
}
