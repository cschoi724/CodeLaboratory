//
//  CodeLaboratoryTests.swift
//  CodeLaboratoryTests
//
//  Created by cschoi on 2/26/24.
//

import XCTest
import RxSwift
import RxCocoa
@testable import CodeLaboratory

final class RxSwiftTests: XCTestCase {

    var bag: DisposeBag!
    
    override func setUpWithError() throws {
        bag = DisposeBag()
    }

    override func tearDownWithError() throws {
        bag = DisposeBag()
    }
    
    func testExample() throws {
        let first = Observable.of(1,2,3)
        let second = Observable.of(4,5,6)
                
        let observables = Observable
            .concat([first,second])
            
        observables
            .subscribe(onNext: { sequnce in
            print(sequnce)
        })
        .disposed(by: bag)
        
        first.concat(second)
        
        // 1
        // 2
        // 3
        // 4
        // 5
        // 6
    }
    
    
    func testExample2() throws {
        let first = Observable.of(1,2,3)
        let second = Observable.of(4,5,6)
        let third = Observable.of(7,8,9)
                
        let observables = Observable.merge([first,second])
        let observables2 = Observable.of(first, second, third)
            
//        observables
//            .subscribe(onNext: { sequnce in
//            print(sequnce)
//        })
//        .disposed(by: bag)
        
        observables2
            .merge(maxConcurrent: 2)
            .subscribe(onNext: { sequnce in
            print(sequnce)
        })
        .disposed(by: bag)
        
        
        // 1
        // 2
        // 3
        // 4
        // 5
        // 6
    }
}
