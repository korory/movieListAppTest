//
//  FindMyMovieDetailAssembly.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 10/05/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation

final public class FindMyMovieDetailAssembly {
    
    static func movieListDetailViewController(dto: PassMovieInformationToDetailScreenDTO?)-> MovieListDetailViewController {
        let vc = MovieListDetailViewController(nibName: "MovieListDetailViewController", bundle: nil)
        
        vc.presenter = presentMovieListDetail(vc: vc, dto: dto!)
        
        return vc
    }
    
    private static func presentMovieListDetail(vc: MovieListDetailViewController, dto: PassMovieInformationToDetailScreenDTO) -> MovieListDetailPresenterProtocol {
        let presenter = MovieListDetailPresenterImplementation(viewController: vc)
        
        presenter.router = routerMovieListDetail(vc: vc, presenter: presenter)
        presenter.interactor = interactorMovieListDetail(presenter: presenter)
        presenter.getMovieInformation(dto:dto)
        
        return presenter
    }
    
    private static func routerMovieListDetail(vc: MovieListDetailViewController, presenter: MovieListDetailPresenterProtocol) -> MovieListDetailRouterProtocol {
        
        let router = MovieListDetailRouterImplementation(viewController: vc, presenter: presenter)
        
        return router
    }
    
    private static func interactorMovieListDetail(presenter: MovieListDetailPresenterProtocol)-> MovieListDetailInteractorProtocol {
        
        let interactor = MovieListInteractorDetailImplementation()
        
        //interactor.provider = self.providerMovieList()
        
        interactor.presenter = presenter
        
        return interactor
        
    }
}


struct PassMovieInformationToDetailScreenDTO {
    
    var model: Result?
    
    init() {
    }
    
    init(model: Result) {
        
        self.model = model
    }
}


