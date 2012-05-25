#PCPopoverController#


Inherits From:    UIPopoverController

Declared In:      PCPopoverController.h


##Overview##

The `PCPopoverController` class is a drop-in replacement for `UIPopoverController` with the ability to add a tint color.

The tint color, as of yet, is in lieu of the various gradient effects seen in the default `UIPopoverController` class. Support for this gradient effects in conjunction with tint colors will be supported later.

##Tasks##

###Initializing the Switch Object###
    - initWithContentViewController:andTintColor:

###Reading the Tint Color###
    tintColor (property)


##Properties##

**tintColor**

>The color used to tint the popover.

        (readonly) UIColor *tintColor
                

##Instance Methods##

**initWithContentViewController:andTintColor:**

>Returns an initalized popover controller object.

        - (id)initWithContentViewController:(UIViewController *)viewController andTintColor:(UIColor *)tintColor

>*Parameters:*

>`viewController`

>>The view controller for managing the popover's content. This parameter must not be `nil`.

>`tintColor`

>>The color used to tint the popover.

#License#

License Agreement for Source Code provided by Patrick Perini

This software is supplied to you by Patrick Perini in consideration of your agreement to the following terms, and your use, installation, modification or redistribution of this software constitutes acceptance of these terms. If you do not agree with these terms, please do not use, install, modify or redistribute this software.

In consideration of your agreement to abide by the following terms, and subject to these terms, Patrick Perini grants you a personal, non-exclusive license, to use, reproduce, modify and redistribute the software, with or without modifications, in source and/or binary forms; provided that if you redistribute the software in its entirety and without modifications, you must retain this notice and the following text and disclaimers in all such redistributions of the software, and that in all cases attribution of Patrick Perini as the original author of the source code shall be included in all such resulting software products or distributions. Neither the name, trademarks, service marks or logos of Patrick Perini may be used to endorse or promote products derived from the software without specific prior written permission from Patrick Perini. Except as expressly stated in this notice, no other rights or licenses, express or implied, are granted by Patrick Perini herein, including but not limited to any patent rights that may be infringed by your derivative works or by other works in which the software may be incorporated.

The software is provided by Patrick Perini on an "AS IS" basis. Patrick Perini MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR PCS USE AND OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL Patrick Perini BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF Patrick Perini HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.