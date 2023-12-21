//
//  ScouterTests.swift
//  ScouterTests
//
//  Created by Akhil on 11/11/23.
//

import XCTest
@testable import Scouter

final class ScouterTests: XCTestCase {
    var testDataController = DataController(container: CoreDataContainer(name: "Scouter",inMemory: true))
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetAccount(){
        var searchVM = SearchUserView.SearchViewModel(dataController: testDataController, apiService: MockApiService())
        let testAccount = Account(login: "tester", avatar_url: "https://avatars.githubusercontent.com/u/78576375?s=40&v=4", url: "vdfv", repos_url: "fgdf", name: "John Watson", bio: "Lorem ipsum dolor sit amet",type: "Organisation",favourite: true)
        searchVM.getAccount("tester")
        XCTAssertEqual(searchVM.searchedAccount, testAccount)
    }
    func testSaveAccount(){
        var searchVM = SearchUserView.SearchViewModel(dataController: testDataController, apiService: MockApiService())
        let testAccount = Account(login: "tester", avatar_url: "https://avatars.githubusercontent.com/u/78576375?s=40&v=4", url: "vdfv", repos_url: "fgdf", name: "John Watson", bio: "Lorem ipsum dolor sit amet",type: "Organisation",favourite: true)
        searchVM.getAccount("tester")
        searchVM.saveAccount()
    }
    func testFetchRepos(){
        var repoVM = RepoViewController.RepoViewModel(apiService: MockApiService())
        var repos : [Repository]?
        repoVM.fetchRepos(repoLink: "fsfdsf"){data in
            repos = data
        }
        XCTAssertEqual(repos?[0].name, "Scouter")
    }
    //TODO: Add testcase for delete
    func testDeleteAccount(){
        var searchVM = SearchUserView.SearchViewModel(dataController: testDataController, apiService: MockApiService())
        let offset: IndexSet = [0]
        searchVM.getAccount("tester")
        var accountList:[Accounts] = []
        if let account = searchVM.searchedAccount{
            let newAccount = Accounts(context: testDataController.container.viewContext)
            newAccount.name = account.name
            newAccount.avatar_url = account.avatar_url
            newAccount.bio = account.bio
            newAccount.login = account.login
            newAccount.repos_url = account.repos_url
            newAccount.type = account.type
            newAccount.url = account.url
            newAccount.favourite = false
            accountList.append(newAccount)
        }
        var contentVM = ContentView.ContentViewModel(dataController: testDataController)
        contentVM.deleteAccount(at: offset, accountList: accountList)
    }
    func testConvertAccount(){
        var contentVM = ContentView.ContentViewModel(dataController: testDataController)
        let testAccount = Account(login: "tester", avatar_url: "https://avatars.githubusercontent.com/u/78576375?s=40&v=4", url: "vdfv", repos_url: "fgdf", name: "John Watson", bio: "Lorem ipsum dolor sit amet",type: "Organisation",favourite: true)
        let newAccount = Accounts(context: testDataController.container.viewContext)
        newAccount.name = testAccount.name
        newAccount.avatar_url = testAccount.avatar_url
        newAccount.bio = testAccount.bio
        newAccount.login = testAccount.login
        newAccount.repos_url = testAccount.repos_url
        newAccount.type = testAccount.type
        newAccount.url = testAccount.url
        newAccount.favourite = testAccount.favourite
        let convertedAccount = contentVM.convertAccount(newAccount)
        XCTAssertEqual(testAccount, convertedAccount)
    }
    
    func testConvertAccountWithoutNameAndBio(){
        var contentVM = ContentView.ContentViewModel(dataController: testDataController)
        let testAccount = Account(login: "tester", avatar_url: "https://avatars.githubusercontent.com/u/78576375?s=40&v=4", url: "vdfv", repos_url: "fgdf", name: "", bio: "",type: "Organisation",favourite: true)
        let newAccount = Accounts(context: testDataController.container.viewContext)
        newAccount.name = nil
        newAccount.avatar_url = testAccount.avatar_url
        newAccount.bio = nil
        newAccount.login = testAccount.login
        newAccount.repos_url = testAccount.repos_url
        newAccount.type = testAccount.type
        newAccount.url = testAccount.url
        newAccount.favourite = testAccount.favourite
        let convertedAccount = contentVM.convertAccount(newAccount)
        XCTAssertEqual(testAccount, convertedAccount)
    }
    
}
