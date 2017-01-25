//
//  MultiSelectSegmentedControl.h
//
//  Created by Yonat Sharon on 19/4/13.
/*
 The MIT License (MIT)
 
 Copyright (c) 2013 Yonat Sharon
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 the Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
//
//  Multiple-Selection Segmented Control
//  No need for images - works with the builtin styles of UISegmentedControl.
//  To get/set multiple segments programmatically, use the property
//  myControl.selectedSegmentIndexes instead of myControl.selectedSegmentIndex
//

#import <UIKit/UIKit.h>

@class MultiSelectSegmentedControl;

@protocol MultiSelectSegmentedControlDelegate <NSObject>
-(void)multiSelect:(MultiSelectSegmentedControl*) multiSelecSegmendedControl didChangeValue:(BOOL) value atIndex: (NSUInteger) index;
@end

@interface MultiSelectSegmentedControl : UISegmentedControl

@property (nonatomic, assign) NSIndexSet *selectedSegmentIndexes;
@property (nonatomic, weak) id<MultiSelectSegmentedControlDelegate> delegate;
@property (nonatomic, readonly) NSArray *selectedSegmentTitles;
@property (nonatomic, assign) BOOL hideSeparatorBetweenSelectedSegments;

- (void)selectAllSegments:(BOOL)select; // pass NO to deselect all

@end
