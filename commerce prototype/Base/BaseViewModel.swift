//
//  BaseViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel {
	
	var disposeBag: DisposeBag = DisposeBag()
	var pageTitle: BehaviorRelay<String> = BehaviorRelay(value: "")
	
}
