//
//  MovieListDetailPresenter.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 10/05/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation

protocol MovieListDetailPresenterProtocol: class{
    func getMovieInformation() -> Result?
    
}

class MovieListDetailPresenterImplementation: BasePresenter<MovieListDetailViewController, MovieListDetailRouterProtocol>  {
    
    var interactor: MovieListDetailInteractorProtocol?
    var assemblyDTO = PassMovieInformationToDetailScreenDTO()
        
    func getMovieInformation(dto: PassMovieInformationToDetailScreenDTO) {
        self.assemblyDTO = dto
    }
        
}

 extension MovieListDetailPresenterImplementation: MovieListDetailPresenterProtocol {

    func getMovieInformation() -> Result? {
        self.assemblyDTO.model
    }
}

