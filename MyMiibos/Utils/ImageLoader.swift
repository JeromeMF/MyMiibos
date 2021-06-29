//
//  ImageLoader.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 29/06/2021.
//

import Foundation
import SwiftUI

class ImageLoader {
    
    func loadImage(image: String) -> UIImage {
        do {
            guard let url = URL(string: image) else {
                return UIImage()
            }
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        return UIImage()
    }
}
