//
//  ChangeMotoViewController.m
//  Motolife
//
//  Created by Stas on 13.10.14.
//  Copyright (c) 2014 Stas Dymedyuk. All rights reserved.
//

#import "ChangeMotoViewController.h"

#define kTagModel       100
#define kTagBrand       200
#define kTagTypes       300

@interface ChangeMotoViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *brandTF;
@property (weak, nonatomic) IBOutlet UITextField *modelTF;
@property (weak, nonatomic) IBOutlet UITextField *typeTF;

@property (strong, nonatomic) NSArray *brands;
@property (strong, nonatomic) NSArray *models;
@property (strong, nonatomic) NSArray *types;

@end

@implementation ChangeMotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _brands = @[@"Aprilia",
                @"BMW",
                @"HONDA",
                @"KTM",
                @"KAWASAKI",
                @"YAMAHA",
                @"...else..."];
    
    _models = @[@"YBR",
                @"YZF",
                @"MT",
                @"FJR",
                @"FZ",
                @"XV",
                @"XVS",
                @"XT",
                @"WR"];
    
    _types = @[@"R1",
               @"R6"];
    
    UIPickerView *pickerBrand = [[UIPickerView alloc] init];
    pickerBrand.delegate = self;
    pickerBrand.tag = 100;
    
    _brandTF.inputView = [self pickerWithTag:kTagBrand];
    _modelTF.inputView = [self pickerWithTag:kTagModel];
    _typeTF.inputView = [self pickerWithTag:kTagTypes];
    
    _brandTF.text = _brands[5];
    _modelTF.text = _models[2];
    _typeTF.text = _types[0];
}

#pragma mark - IBActions

- (IBAction)save:(id)sender
{
    [_brandTF resignFirstResponder];
    [_modelTF resignFirstResponder];
    [_typeTF resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Helpers

- (UIPickerView *)pickerWithTag:(NSInteger)tag
{
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.delegate = self;
    [picker setShowsSelectionIndicator:YES];
    picker.tag = tag;
    
    return picker;
}

#pragma mark - Picker Delegate & DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case kTagBrand: return _brands.count;
        case kTagModel: return _models.count;
        case kTagTypes: return _types.count;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case kTagBrand: return _brands[row];
        case kTagModel: return _models[row];
        case kTagTypes: return _types[row];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case kTagBrand: _brandTF.text = _brands[row]; break;
        case kTagModel: _modelTF.text = _models[row]; break;
        case kTagTypes: _typeTF.text = _types[row]; break;
    }
}

@end
