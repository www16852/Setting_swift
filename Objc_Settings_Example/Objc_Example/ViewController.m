//
//  ViewController.m
//  Objc_Example
//
//  Created by waltoncob on 2016/12/28.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

    PlistManager *plistManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Setting";
    NSString *userEmail = @"Box03@walton.com.tw";
    NSString *userDevice = @"IOS-66-789";
    NSString *version = @"1.0.13";
    NSArray *dayOption = @[@"5days",@"10days",@"15days",@"20days"];
    NSArray *shareOption = @[@"t1@walton.com.tw",@"t2@walton.com.tw",@"t3@walton.com.tw",@"t4@walton.com.tw"];


    plistManager = [[PlistManager alloc] init];
    NSLog(@"Plist path : ");
    NSLog(plistManager.plistPathInDocument);
    SimpleCellFactory *factory = [[SimpleCellFactory alloc]init];

    Section *section1 = [[Section alloc ]initWithHeader:@"ACCOUNT" footer:@"" contents:@[] heightForHeader:4.4 heightForFooter:2.2];
    [section1 addWithContent:[[CellContent alloc]initWithTitle:@"Email" detail:userEmail addTrigger:true]];
    [section1 addWithContent:[[CellContent alloc]initWithTitle:@"Device" detail:userDevice addTrigger:true]];
    [section1 addWithContent:[[CellContent alloc]initWithTitle:@"Version" detail:version addTrigger:true]];


    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enabling Camera Uploads" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:nil]];


    Section *section2 = [[Section alloc ]initWithHeader:@"SETTING" footer:@"" contents:@[] heightForHeader:4.4 heightForFooter:2.2];
    CellContent *alertContent = [[CellContent alloc]initWithTitle:@"Carmera Uploads" isOn:false];
    AlertListener *alertListener = [[AlertListener alloc]initWithController:self plist:plistManager alert:alert];
    [alertContent addWithTapListener:alertListener];
    [section2 addWithContent:alertContent];


    Section *section3 = [[Section alloc ]initWithHeader:@"MANAGEMENT" footer:@"" contents:@[] heightForHeader:4.4 heightForFooter:2.2];
    [section3 addWithContent:[[CellContent alloc]initWithTitle:@"Space Used" detail:@"" addTrigger:true]];
    TableContent *pushTable = [[TableContent alloc]initWithSections:@[] factory:factory delegate:nil allowsSelection:false];
    CellContent *cellContent = [[CellContent alloc]initWithTitle:@"Legal and Privacy" push:pushTable detailIndex:-1];
    [section3 addWithContent:cellContent];


    TableContent *keepDaysPushTable = [[TableContent alloc]initWithHeader:@"choose Keep Days" options:dayOption factory:factory delegate:[[TickTableDelegate alloc]init] allowsSelection:true];
    CellContent *keepDaysCellContent = [[CellContent alloc]initWithTitle:@"choose Keep Days" push:keepDaysPushTable detailIndex:0];
    PushListener *pushListener = [[PushListener alloc]initWithController:self plist:plistManager];
    [keepDaysCellContent addWithTapListener:pushListener];
    [section3 addWithContent:keepDaysCellContent];

    [section3 addWithContent:[[CellContent alloc]initWithTitle:@"Connected" detail:@"UPnP" addTrigger:true]];


    TableContent *sharePushTable = [[TableContent alloc]initWithHeader:@"Share Management" options:shareOption factory:factory delegate:nil allowsSelection:true];
    CellContent *shareCellContent = [[CellContent alloc]initWithTitle:@"Share Management" push:sharePushTable detailIndex:-1];
    ShareListener *pushShareListener = [[ShareListener alloc]initWithController:self];
    [shareCellContent addWithTapListener:pushShareListener];
    [section3 addWithContent:shareCellContent];


    CellContent *sign = [[CellContent alloc]initWithTitle:@"Sign out" buttonColor:[[UIColor alloc]initWithRed:0.8 green:0.5 blue:0.5 alpha:1]];
    [section3 addWithContent:sign];


    NSArray *sections = @[section1,section2,section3];

    TableContent *tableContent = [[TableContent alloc]initWithSections:sections factory:factory delegate:nil allowsSelection:true];
    NSArray *cellContents = [tableContent getCellContents];

    [plistManager setupWithCellContents:cellContents];
    [plistManager adjustCellContents];

    SettingTableView *tableview = [[SettingTableView alloc]initWithContent:tableContent];

    self.view = tableview;




    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
