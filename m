From: Dinh Nguyen <dinguyen@altera.com>
Subject: Re: [RFC PATCH 0/2] dwc2/s3c-hsotg: Initial steps to combine the 2
 driver
Date: Tue, 14 Jan 2014 14:46:18 -0600
Message-ID: <1389732378.26963.7.camel@linux-builds1>
References: <1389697262-29065-1-git-send-email-dinguyen@altera.com>
	 <20140114142138.GB19492@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]:43542 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752055AbaANUsh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jan 2014 15:48:37 -0500
In-Reply-To: <20140114142138.GB19492@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: balbi@ti.com, dinh.linux@gmail.com, Paul Zimmerman <paulz@synopsys.com>, Rashika Kheria <rashika.kheria@gmail.com>, Matthijs Kooijman <matthijs@stdin.nl>, Luis Ortega Perez de Villar <luiorpe1@upv.es>, Dom Cobley <popcornmix@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org

On Tue, 2014-01-14 at 06:21 -0800, Greg KH wrote:
> On Tue, Jan 14, 2014 at 05:01:00AM -0600, dinguyen@altera.com wrote:
> > From: Dinh Nguyen <dinguyen@altera.com>
> > 
> > Hi,
> > 
> > I'm starting work downstream on combining the DWC2 host driver and the s3c-hsotg
> > gadget driver into a dual-role OTG driver. Before I go further, I was hoping to
> > solicit comments on whether or not my initial approach is correct? I know there
> > are plans to combine the 2, so would like to solicit comments/suggestions so
> > that I can also upstream it as well.
> > 
> > These 2 patches:
> > 
> > * Moves the DWC2 driver out of drivers/staging into drivers/usb/dwc2/
> 
> This already happened yesterday in my tree, so you should see this in
> linux-next by now, no need to do it again :)
> 

I see it now. Thanks for the pointer.

> > * Moves the s3c-hsotg driver into drivers/usb/dwc2/
> > * Delete s3c-hsotg.h 
> > * Make the s3c-hsotg.c file use the defines in hw.h from the DWC2 driver.
> > 
> > This initial patch has been tested on the SOCFPGA platform only in Host-only
> > and Gadget-only mode.
> > 
> > The next step would be to do the combining of the driver into a dual-role OTG
> > driver.
> 
> I was told that merging the two of these isn't going to work as the
> silicon is just too different, which is why I allowed the code to move
> out of staging.  If you feel differently, and think you can combine the
> two drivers, that's wonderful, I'll gladly take patches to do so, but be
> sure to test on the proper platforms to make sure nothing breaks.
> 

I wasn't aware of the silicon differences. I just took the s3c-hsotg
driver as is and it worked fine on my version 2.93a of the USB IP. I'll
search the ML for information, or perhaps Paul can comment?

Thanks,
Dinh
> thanks,
> 
> greg k-h
> 
