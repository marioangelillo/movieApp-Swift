//
//  Extensions.swift
//  MovieApp
//
//  Created by Mario Angelillo on 30/12/2021.
//

import Foundation
import UIKit

extension Data {
    
    func toDTO<Mario>(_ type: Mario.Type) -> Mario? where Mario : Decodable {
        return try? JSONDecoder().decode(type, from: self)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    
    func downloadImage(_ urlString: String, completion: @escaping (_ image: UIImage?) -> Void) {
        
        DispatchQueue.global(qos: .background).async {
            
            guard let url = URL(string: urlString) else {
                print("Error en la url")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            do {
                let data = try Data(contentsOf: url) //Esta es la descarga
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    completion(image)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
}
