From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 3/4] USB: Gadget: Add Samsung S3C24XX USB High-Speed controller driver
Date: Sat, 16 Apr 2011 12:00:31 +0200
Message-ID: <201104161200.32042.heiko@sntech.de>
References: <Pine.LNX.4.44L0.1104141313210.2487-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:45014 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750802Ab1DPKAt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Apr 2011 06:00:49 -0400
In-Reply-To: <Pine.LNX.4.44L0.1104141313210.2487-100000@iolanthe.rowland.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Thomas Abraham <thomas.ab@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Alexander Neumann <alexander@debian.org>

Am Donnerstag 14 April 2011, 19:15:23 schrieb Alan Stern:
> On Thu, 14 Apr 2011, Greg KH wrote:
> > On Thu, Apr 14, 2011 at 11:35:43AM -0400, Alan Stern wrote:
> > > On Thu, 14 Apr 2011, Heiko [iso-8859-1] St?bner wrote:
> > > > From: Thomas Abraham <thomas.ab@samsung.com>
> > > > 
> > > > The Samsung's S3C2416, S3C2443 and S3C2450 includes a USB High-Speed
> > > > device controller module. This driver enables support for USB
> > > > high-speed gadget functionality for the Samsung S3C24xx SoC's that
> > > > include this controller.
> > > > 
> > > > Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> > > > Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> > > > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > > > Signed-off-by: Alexander Neumann <alexander@bumpern.de>
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > 
> > > ...
> > > 
> > > > +static struct usb_ep_ops s3c_hsudc_ep_ops = {
> > > > +	.enable = s3c_hsudc_ep_enable,
> > > > +	.disable = s3c_hsudc_ep_disable,
> > > > +	.alloc_request = s3c_hsudc_alloc_request,
> > > > +	.free_request = s3c_hsudc_free_request,
> > > > +	.queue = s3c_hsudc_queue,
> > > > +	.dequeue = s3c_hsudc_dequeue,
> > > > +	.set_halt = s3c_hsudc_set_halt,
> > > > +};
> > > 
> > > There's no .set_wedge method.  Why do people always leave this out?
> > 
> > Does the code spit out a nasty warning if this isn't set?  If not, I
> > would suggest adding it so that this doesn't keep happening.
> > 
> > Or just refuse to be able to register the structure, that would stop it
> > right away :)
> 
> In fact, set_wedge is optional.  But it's so easy to implement, there's
> no good reason for leaving it out.

It seems Thomas [original author of the driver] will be able to implement said 
set_wedge function for it.
As he will need a bit of time for this, two possible ways for going forward 
come to mind:
(1) use current driver [as set_wedge is optional] and add it later via patch
(2) resubmit whole driver again when set_wedge is added to it

Obviously I would prefer option 1 :-), but in the end it's your decision.

Heiko
