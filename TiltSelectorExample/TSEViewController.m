//
//  ViewController.m
//  TiltSelectorExample
//
//  Created by Woudini on 3/18/15.
//  Copyright (c) 2015 Hi Range. All rights reserved.
//

#import "TSEViewController.h"
#import "TSEDataSource.h"
#import "TSESecondViewController.h"
@interface TSEViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) TSEDataSource *dataSource;

@end

@implementation TSEViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segue"])
    {
        TSESecondViewController *secondViewController = segue.destinationViewController;
        secondViewController.selectedRow = 0;
    }
}

- (void)setupDataSource
{
    __weak TSEViewController *weakSelf = self;
    
    UITableViewCell* (^configureCellBlock)(NSIndexPath *indexPath) = ^(NSIndexPath *indexPath) {
        UITableViewCell *tableViewCell = [weakSelf.tableView dequeueReusableCellWithIdentifier:@"cell"];
        tableViewCell.textLabel.text = [[NSString alloc] initWithFormat:@"%ld", (long)indexPath.row];
        return tableViewCell;
    };
    
    NSInteger (^numberOfRowsBlock)() = ^NSInteger() {
        return 20;
    };
    
    self.dataSource = [[TSEDataSource alloc] initWithConfigureCellBlock:configureCellBlock
                                             NumberOfRowsInSectionBlock:numberOfRowsBlock];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDataSource];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
