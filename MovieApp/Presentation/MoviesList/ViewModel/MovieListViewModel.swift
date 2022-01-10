//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Mario Angelillo on 28/12/2021.
//

import Foundation
import UIKit

class MovieListViewModel {
    
    var popularMovies: [Movie] = [Movie]()
    let movieServices: MovieServices = MovieServices()
    
    func fetchPopularMovies() {
        movieServices.getPopularMovies { popularMovies in
            self.popularMovies = (popularMovies?.results.map({ dto in
                Movie(dto: dto)
            })) ?? []
        }
    }
    
    func animatedCell(cell: UITableViewCell) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 500, -500)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.75
        
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
}

