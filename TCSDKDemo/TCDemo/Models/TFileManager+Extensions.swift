//
//  FileManager.swift
//  SmartLED
//
//  Created by Samuel on 2019/12/2.
//  Copyright © 2019 Haogang Chen. All rights reserved.
//

import Foundation

extension FileManager {
    
    static let userFileURL: URL? = {
        guard let docPath = FileManager.createDataPath() else { return nil }
        return docPath.appendingPathComponent("TUser.plist")
    }()
    
    static let privateDocsDir: URL = {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = paths.first!.appendingPathComponent("PrivateDocuments")
        do {
            try FileManager.default.createDirectory(at: documentsDirectoryURL, withIntermediateDirectories: true, attributes: nil)
        } catch {
            debugPrint("Couldn't create directory")
        }
        
        debugPrint(documentsDirectoryURL.absoluteString)
        return documentsDirectoryURL
    }()
    
    static func createDataPath() -> URL? {
        let docPath = privateDocsDir.appendingPathComponent("TCDemo", isDirectory: true)
        do {
            try FileManager.default.createDirectory(at: docPath, withIntermediateDirectories: true, attributes: nil)
            return docPath
        } catch {
            debugPrint("Couldn't create dataPath", error.localizedDescription)
            return nil
        }
    }
    
    func removeFileIfNecessary(at url: URL) throws {
        guard fileExists(atPath: url.path) else {
            return
        }
        
        do {
            try removeItem(at: url)
        } catch let error {
            debugPrint("Couldn't remove existing destination file: \(error)")
        }
    }
    
    static let documentsPath: String = {
        let array = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return array.first!
    }()

    static let usersDocumentsPath: String? = {
        let usersDocumentsPath = FileManager.documentsPath.appendingPathComponent("Users")
        guard createPath(path: usersDocumentsPath) else {
            return nil
        }
        debugPrint("usersDocumentsPath: \(usersDocumentsPath)")
        return usersDocumentsPath
    }()
    
    static let cachesPath: String = {
        let array = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        return array.first!
    }()
    
    static let usersCachePath: String? = {
        let usersCachePath = FileManager.cachesPath.appendingPathComponent("Users")
        guard createPath(path: usersCachePath) else {
            return nil
        }
        
        return usersCachePath
    }()
    
    static func createPath(path: String) -> Bool {
        var success = true
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                success = false
                debugPrint("FileManager create path=\(path) error:\(error)")
            }
        }
        
        return success
    }
    
    static func createFile(file: String) -> Bool {
        if !FileManager.default.fileExists(atPath: file) {
            return FileManager.default.createFile(atPath: file, contents: nil, attributes: nil)
        }
        
        return true
    }
    
    static func removeFile(atPath path: String) -> Bool {
        var success = true
        if FileManager.default.fileExists(atPath: path) {
            do  {
                try FileManager.default.removeItem(atPath: path)
            } catch {
                success = false
                debugPrint("FileManager remove file error:\(error)")
            }
        }
        return success
    }
}
