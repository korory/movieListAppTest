//
//  MovieListRouter.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation

protocol MovieListRouterProtocol:class {
    func navigateToDetailScreen(dto: PassMovieInformationToDetailScreenDTO)
}

class MovieListRouterImplementation: BaseRouter<MovieListPresenterProtocol> {
    
}

extension MovieListRouterImplementation: MovieListRouterProtocol {
    
    func navigateToDetailScreen(dto: PassMovieInformationToDetailScreenDTO) {
        
        //self.pushViewController(FindMyMovieDetailAssembly.movieListDetailViewController(), animated: true)
        
        self.present(FindMyMovieDetailAssembly.movieListDetailViewController(dto:dto), animated: true)
    }
}

