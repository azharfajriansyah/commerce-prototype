//
//  FileHelper.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

class FileHelper {
	
	static func getPath(for fileName: String) -> URL? {
		return URL.documentDirectory().appendingPathComponent(fileName)
	}
	
	static func archiveEncodable<T: Encodable>(_ object: T, fileName: String) throws {
		guard let path = getPath(for: fileName) else {
			throw NSError(domain: "FileHelper", code: 0, userInfo: [NSLocalizedDescriptionKey : "Unable to get path"])
		}
		
		do {
			let object = try PropertyListEncoder().encode(object)
			let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: true)
			try data.write(to: path)
		} catch {
			throw NSError(domain: "FileHelper", code: 0, userInfo: [NSLocalizedDescriptionKey : "Unable to save data"])
		}
	}
	
	static func unarchiveDecodable<T: Decodable>(_ object: T.Type, fileName: String) -> T? {
		guard let path = getPath(for: fileName) else { return nil }
		guard let archivedData = NSData(contentsOfFile: path.path) else { return nil }
		
		do {
			guard let data = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(archivedData as Data) as? Data else { return nil }
			return try PropertyListDecoder().decode(object, from: data)
		} catch {
			return nil
		}
	}
	
}
