//
//  MDF1ViewController.m
//  MDF1Project1
//
//  Created by Brenna Pavlinchak on 1/10/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MDF1ViewController.h"
#import "CustomTableViewCell.h"
#import "DetailViewController.h"

@interface MDF1ViewController ()

@end

@implementation MDF1ViewController

- (void)viewDidLoad
{
    array1 = [[NSMutableArray alloc] initWithObjects:@"Lost girl", @"Battlestar Galactica", @"Being Human", @"Continuum", @"Defiance", @"Haven", @"Warehouse 13", @"Alphas", @"Eureka", @"Caprica", @"Sanctuary", @"Arrow", @"Dr. Who", @"The Originals", @"The Vampire Diaries", @"Beauty and the Beast", @"The Tomorrow People", @"The Secret Circle", @"The X-Files", @"Star Trek Next Generation", @"Firefly", @"Fringe", @"Star Trek Enterprise", @"Star Trek Voyager", @"The Twilight Zone", @"Heroes", @"DollHouse", @"Dark Angel", @"Terminator: The Sarah Connor Chronicles", @"Sliders", nil]; //First array for tableView
    
    array2 = [[NSMutableArray alloc] initWithObjects:@"SyFy", @"SyFy", @"SyFy", @"SyFy", @"SyFy", @"SyFy", @"SyFy", @"SyFy", @"SyFy", @"SyFy", @"SyFy", @"The CW", @"BBC", @"The CW", @"The CW", @"The CW", @"The CW", @"The CW", @"Fox", @"NBC", @"Fox", @"Fox", @"UPN", @"UPN", @"CBS", @"NBC", @"Fox", @"Fox", @"Fox", @"Fox", nil]; //Second array for tableView
    
    array3 = [[NSMutableArray alloc] initWithObjects:  @"Three", @"Four", @"Three", @"Two", @"One", @"Four", @"Four", @"Two", @"Five", @"One", @"Four", @"Two", @"Twenty Six", @"One", @"Five", @"Two", @"One", @"One", @"Nine", @"Seven", @"One", @"Five", @"Four", @"Seven", @"Five", @"Four", @"Two", @"Two", @"Two", @"Five", nil]; //Second array for tableView
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath //We need this to do the editing of our tableView
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSLog(@"I want to delete: %d", indexPath.row);
        
        [array1 removeObjectAtIndex:indexPath.row]; //Removes the objects from the UITableViewCell
        [array2 removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:TRUE];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section //Creates table view
{
    return [array1 count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath //Adds values to each row
{
    static NSString  *cellIdentity = @"Cell";
    
    CustomTableCell *cellRow  = [tableView dequeueReusableCellWithIdentifier: cellIdentity];
    
    
    if(cellRow == nil)
    {
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
        
        for(UIView *view in views)
        {
            if([view isKindOfClass:[CustomTableCell class]])
            {
                cellRow = (CustomTableCell*)view;
                
                cellRow.showNameLabel.text = [array1 objectAtIndex:indexPath.row];
                
                cellRow.stationLabel.text = [array2 objectAtIndex:indexPath.row];
                
            }
        }
    }
    
    return cellRow;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil]; //Pop to the detail page
    
    if(detailView !=nil)
    {
        detailView.showName = [array1 objectAtIndex:indexPath.row]; //Show the show name on the detail page
        detailView.station = [array2 objectAtIndex:indexPath.row]; //Show the station on the detail page
        detailView.years = [array3 objectAtIndex:indexPath.row]; //Show the number of years on the detail page
        [self presentViewController:detailView animated:YES completion:nil];
        [detailView updateUILabel];
    }
}

-(IBAction)editButton:(id)sender
{
    if(editMode == FALSE) //Ask what type of editing mode
    {
        [tableView setEditing:TRUE];
        [editButton setTitle:@"Finish" forState: UIControlStateNormal];
        editMode = TRUE; //Reset to not be in editing mode
    }
    else
    {
        [tableView setEditing:FALSE];
        [editButton setTitle:@"Edit" forState:UIControlStateNormal];
        editMode = FALSE;
    }
    
}

-(CGFloat)tableView:(UITableViewCell *)sender heightForRowAtIndexPath:(NSIndexPath *)indexPath; //Changes the height of the cells to the right size.
{
    return tableView.rowHeight * 2;
}

@end

