//
//  MDF1FirstViewController.m
//  MDF1Project3
//
//  Created by Brenna Pavlinchak on 1/20/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MDF1FirstViewController.h"
#import "ApplicationState.h"
#import "MDF1SecondViewController.h"
#import "CustomObject.h"
#import "MyMapAnnotation.h"
#import "DetailViewController.h"

@interface MDF1FirstViewController ()

@end

@implementation MDF1FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Map TabView", @"Map TabView");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
        
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
        
        ApplicationState *theAppState = [ApplicationState sharedApplicationState];
        
        //Replace with object
        [theAppState.businessArray removeObjectAtIndex:indexPath.row]; 
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:TRUE];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section //Creates table view
{
    return [[ApplicationState sharedApplicationState].businessArray count];
            //Replace with object
}

-(UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath //Adds values to each row
{
    static NSString  *cellIdentity = @"Cell";
    
    UITableViewCell *cellRow  = [tableView dequeueReusableCellWithIdentifier: cellIdentity];
    
    
    if(cellRow == nil)
    {
        cellRow = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIdentity];
    }
    ApplicationState *theAppState = [ApplicationState sharedApplicationState];
    
    CustomObject *mapObject = [theAppState.businessArray objectAtIndex:indexPath.row];
    cellRow.textLabel.text = mapObject.nameOfBusiness;
    
    return cellRow;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    DetailViewController *individualMapView = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil]; //Pop to the map page
    
    if(individualMapView !=nil)
    {
        //Add things it does right here when going into the second tab
        ApplicationState *theAppState = [ApplicationState sharedApplicationState];
        
        CustomObject *mapInfo = [theAppState.businessArray objectAtIndex:indexPath.row];
        
        
        //individualMapView.name = [theAppState.businessArray objectAtIndex:indexPath.row]; //Show the name on the detail page
        //individualMapView.latit = [theAppState.businessArray objectAtIndex:indexPath.row]; //Show the latitude on the detail page
        //individualMapView.longi = [theAppState.businessArray objectAtIndex:indexPath.row]; //Show the longitude on the detail page
        [self presentViewController:individualMapView animated:YES completion:nil];
        //[individualMapView updateUILabel];//Not sure if i need this becuase im not updating a UILabel but i need to update the map
    }   //Issue on the line above
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


@end
