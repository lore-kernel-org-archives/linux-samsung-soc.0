From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [RFC PATCHv1] usb: dwc2: Combine the dwc2 and s3c_hsotg into a
 single USB DRD driver.
Date: Thu, 06 Feb 2014 12:23:18 +0900
Message-ID: <001201cf22ea$c7a4c630$56ee5290$%han@samsung.com>
References: <1391550341-32509-1-git-send-email-dinguyen@altera.com>
 <1391550341-32509-2-git-send-email-dinguyen@altera.com>
 <A2CA0424C0A6F04399FB9E1CD98E03046D149949@US01WEMBX2.internal.synopsys.com>
 <1391580862.32553.10.camel@linux-builds1>
 <A2CA0424C0A6F04399FB9E1CD98E03046D149CAA@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60963 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752403AbaBFDXU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Feb 2014 22:23:20 -0500
In-reply-to: <A2CA0424C0A6F04399FB9E1CD98E03046D149CAA@US01WEMBX2.internal.synopsys.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Paul Zimmerman' <Paul.Zimmerman@synopsys.com>, 'Dinh Nguyen' <dinguyen@altera.com>
Cc: linux-usb@vger.kernel.org, 'Dinh Nguyen' <dinh.linux@gmail.com>, linux-samsung-soc@vger.kernel.org, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Felipe Balbi' <balbi@ti.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, February 06, 2014 4:21 AM, Paul Zimmerman wrote:
> On Tuesday, February 04, 2014 10:14 PM, Dinh Nguyen wrote:
> > On Wed, 2014-02-05 at 00:42 +0000, Paul Zimmerman wrote:
> > > > From: dinguyen@altera.com [mailto:dinguyen@altera.com]
> > > > Sent: Tuesday, February 04, 2014 1:46 PM
> > > >
> > > > From: Dinh Nguyen <dinguyen@altera.com>
> > > >
> > > > This means that the driver can be in host or peripheral mode when the appropriate
> > > > connector is used. When an A-cable is plugged in, the driver behaves in host
> > > > mode, and when a B-cable is used, the driver will be in peripheral mode.
> > > >
> > > > This commit:
> > > > - Replaces in the defines used in s3c_hsotg.h with the defines used in the dwc2
> > > >   hw.h defines.
> > > > - Use the dw2_hsotg as the unified data structure for the host/gadget.
> > > > - Uses the dwc2 IRQ handler for host/gadget.
> > > > - A single spinlock.
> > >
> > > Hi Dinh,
> > >
> > > Putting all of these changes into a single patch makes them unreviewable
> > > as far I am concerned. You need to break this into a series of smaller
> > > patches. I would suggest something like this:
> > >
> > > 1 of n:  Make the minimum changes to the dwc2 header files needed to
> > >          support s3c-hsotg as a standalone driver.
> > > 2 of n:  Make the spelling changes to s3c-hsotg.c needed to use the dwc2
> > >          headers, and move it to the dwc2/ directory. Make the Kconfig
> > >          and Makefile changes needed for the move. Delete s3c-hsotg.h.
> > > 3 of n:  Move the struct defines etc. from s3c-hsotg.c to the dwc2
> > >          header files.
> > > .. of n: Make the changes required to combine the functionality of
> > >          both drivers into one. Preferably this would also be a series
> > >          of patches instead of one big one.
> > >
> > > At each step of the series, both drivers should still compile and work.
> >
> > I agree. My original thought was to also split this patch, but I just
> > didn't know how to split it. This is why I designated as an RFC. I was
> > really looking for feedback as this is the correct way to combine this
> > driver. I was also looking for testing purpose to make sure I did not
> > break anything for the s3c platform.
> 
> The problem is, it's almost impossible to see what the functional
> changes are because of all the noise of the other changes.

Yes, right. I think so, too.

> 
> > >
> > > Also, please follow the patch style used on the linux lists.
> > > 'git format-patch --cover-letter' should do most of this for you
> > > automatically.
> >
> > I did use --cover-letter on this patch series.
> >
> > >
> > > And you should probably trim the Cc list to something more reasonable.
> >
> > I looked through all the commits for the dwc2 driver for the cc list. I
> > also CC a bunch of the Samsung people as I figured that the biggest
> > impact of the work would affect the s3c folks.
> 
> I would suggest just CCing the Samsung folks to start with, since s3c-hsotg
> is a driver for their hardware. And the linux-usb and linux-samsung-soc
> lists.

Please keep CCing linux-samsung-soc. Some Samsung folks will test
the patches with Samsung hardware. Thank you.

Best regards,
Jingoo Han
