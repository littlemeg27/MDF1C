//
//  MDF1SecondViewController.m
//  MDF1Project2
//
//  Created by Brenna Pavlinchak on 1/16/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MDF1SecondViewController.h"
#import "DetailViewController.h"

@interface MDF1SecondViewController ()

@end

@implementation MDF1SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Table View", @"Table View");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    array1 = [[NSMutableArray alloc] initWithObjects:
              @"Untangling the Circuit Splits Regarding Cell Tower Siting Policy and 47 U.S.C. § 332(c)(7) When Is a Denial of One Effectively a Prohibition on All?",
              @"Examination of cell phone usage habits and purposes of education faculty students.",
              @"Perceptions of HIV infected patients on the use of cell phone as a tool to support their antiretroviral adherence; a cross-sectional study in a large referral hospital in Kenya.",
              @"CELL PHONES, POLICE RECORDING, AND THE INTERSECTION OF THE FIRST AND FOURTH AMENDMENTS.",
              @"AN INVESTIGATION OF THE RELATIONSHIP BETWEEN HIGH-SCHOOL STUDENTS' PROBLEMATIC MOBILE PHONE USE AND THEIR SELF-ESTEEM LEVELS.",
              @"Ambulatory cell phone injuries in the United States: An emerging national concern.", nil]; //First array for tableView
    
    array2 = [[NSMutableArray alloc] initWithObjects:
              @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?vid=4&sid=282bf86e-373e-4f0e-b70f-8cc3ef327813%40sessionmgr114&hid=126&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=91959719",
              @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?vid=4&sid=282bf86e-373e-4f0e-b70f-8cc3ef327813%40sessionmgr114&hid=126&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=90595980",
              @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?vid=4&sid=282bf86e-373e-4f0e-b70f-8cc3ef327813%40sessionmgr114&hid=126&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=91857115",
              @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?vid=4&sid=282bf86e-373e-4f0e-b70f-8cc3ef327813%40sessionmgr114&hid=126&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=92883842",
              @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?vid=4&sid=282bf86e-373e-4f0e-b70f-8cc3ef327813%40sessionmgr114&hid=126&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=90503194",
              @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?vid=4&sid=282bf86e-373e-4f0e-b70f-8cc3ef327813%40sessionmgr114&hid=126&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=91975034", nil]; //Second array for tableView
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.title = @"Table View"; //Title of the app
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [super viewWillAppear:animated];
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
        
        [array1 removeObjectAtIndex:indexPath.row];
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
    
    UITableViewCell *cellRow  = [tableView dequeueReusableCellWithIdentifier: cellIdentity];
    
    
    if(cellRow == nil)
    {
        cellRow = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIdentity];
    }
    
    cellRow.textLabel.text = [array1 objectAtIndex:indexPath.row]; //Show the name on the table
    
    return cellRow;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil]; //Pop to the detail page
    
    if(detailView !=nil)
    {
        detailView.name = [array1 objectAtIndex:indexPath.row]; //Show the name on the detail page
        detailView.linkName = [array2 objectAtIndex:indexPath.row]; //Show the team on the detail page
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
    return tableView.rowHeight * 1.5;
}


@end
