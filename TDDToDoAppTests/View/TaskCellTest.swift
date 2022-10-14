//
//  TaskCellTest.swift
//  TDDToDoAppTests
//
//  Created by Maxim Gladkov on 28.09.2022.
//

import XCTest
@testable import TDDToDoApp

final class TaskCellTest: XCTestCase {
    
    var cell: TaskCell!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self)) as! TaskListViewController
        controller.loadViewIfNeeded()
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as? TaskCell
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testCellHasTitleLabel() {
        XCTAssertNotNil(cell.titleLabel)
    }
    
    func testCellHasTitleInContentView() {
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    
    func testCellHasLocationLabel() {
        XCTAssertNotNil(cell.locationLabel)
    }
    
    func testCellHasLocationInContentView() {
        XCTAssertTrue(cell.locationLabel.isDescendant(of: cell.contentView))
    }
    
    func testCellHasDateLabel() {
        XCTAssertNotNil(cell.dateLabel)
    }
    
    func testCellHasDateInContentView() {
        XCTAssertTrue(cell.dateLabel.isDescendant(of: cell.contentView))
    }
    
    func testConfigureSetsTitle() {
        let task = Task(title: "Foo")
        
        cell.configure(with: task)
        
        XCTAssertEqual(cell.titleLabel.text, task.title)
    }
    
    func testConfigureSetsDate() {
        let task = Task(title: "Foo")
        
        cell.configure(with: task)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let date = task.date
        let dateString = formatter.string(from: date)
        
        XCTAssertEqual(cell.dateLabel.text, dateString)
    }
    
    func testConfigureSetsLocation() {
        let location = Location(name: "Bar")
        let task = Task(title: "Foo", location: location)
        
        cell.configure(with: task)
        
        XCTAssertEqual(cell.locationLabel.text, task.location?.name)
        
    }
    
    func configureCellWithTask() {
        let task = Task(title: "Foo")
        cell.configure(with: task, done: true)
    }
    
    func testDoneTaskShouldStrikeThrough() {
        configureCellWithTask()
        
        let attributedString = NSAttributedString(string: "Foo", attributes: [.strikethroughStyle : NSUnderlineStyle.single.rawValue])
        
        XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
    }
    
    func testDoneTaskDateLabelEqualsNil() {
        configureCellWithTask()
        
        XCTAssertNil(cell.dateLabel)
    }
    
    func testDoneTaskLocationLabelEqualsNil() {
        configureCellWithTask()
        
        XCTAssertNil(cell.locationLabel)
    }
}

extension TaskCellTest {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}
