//
//  CodeLaboratoryTests.swift
//  CodeLaboratoryTests
//
//  Created by cschoi on 2/26/24.
//

import XCTest
import RxSwift
@testable import CodeLaboratory

final class CodeLaboratoryTests: XCTestCase {

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
}
