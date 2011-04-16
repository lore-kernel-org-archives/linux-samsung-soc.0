From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 3/4] USB: Gadget: Add Samsung S3C24XX USB High-Speed controller driver
Date: Sat, 16 Apr 2011 20:47:50 +0200
Message-ID: <201104162047.50861.heiko@sntech.de>
References: <Pine.LNX.4.44L0.1104141313210.2487-100000@iolanthe.rowland.org> <201104161200.32042.heiko@sntech.de> <20110416145830.GA8811@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:40090 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752141Ab1DPSsJ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Apr 2011 14:48:09 -0400
In-Reply-To: <20110416145830.GA8811@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg KH <greg@kroah.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Thomas Abraham <thomas.ab@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Alexander Neumann <alexander@debian.org>

Am Samstag 16 April 2011, 16:58:30 schrieb Greg KH:
> On Sat, Apr 16, 2011 at 12:00:31PM +0200, Heiko St=FCbner wrote:
> > Am Donnerstag 14 April 2011, 19:15:23 schrieb Alan Stern:
> > > On Thu, 14 Apr 2011, Greg KH wrote:
> > > > On Thu, Apr 14, 2011 at 11:35:43AM -0400, Alan Stern wrote:
> > > > > On Thu, 14 Apr 2011, Heiko [iso-8859-1] St?bner wrote:
> > > > > > From: Thomas Abraham <thomas.ab@samsung.com>
> > > > > >=20
> > > > > > The Samsung's S3C2416, S3C2443 and S3C2450 includes a USB
> > > > > > High-Speed device controller module. This driver enables su=
pport
> > > > > > for USB high-speed gadget functionality for the Samsung S3C=
24xx
> > > > > > SoC's that include this controller.
> > > > > >=20
> > > > > > Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> > > > > > Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> > > > > > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > > > > > Signed-off-by: Alexander Neumann <alexander@bumpern.de>
> > > > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > >=20
> > > > > ...
> > > > >=20
> > > > > > +static struct usb_ep_ops s3c_hsudc_ep_ops =3D {
> > > > > > +	.enable =3D s3c_hsudc_ep_enable,
> > > > > > +	.disable =3D s3c_hsudc_ep_disable,
> > > > > > +	.alloc_request =3D s3c_hsudc_alloc_request,
> > > > > > +	.free_request =3D s3c_hsudc_free_request,
> > > > > > +	.queue =3D s3c_hsudc_queue,
> > > > > > +	.dequeue =3D s3c_hsudc_dequeue,
> > > > > > +	.set_halt =3D s3c_hsudc_set_halt,
> > > > > > +};
> > > > >=20
> > > > > There's no .set_wedge method.  Why do people always leave thi=
s out?
> > > >=20
> > > > Does the code spit out a nasty warning if this isn't set?  If n=
ot, I
> > > > would suggest adding it so that this doesn't keep happening.
> > > >=20
> > > > Or just refuse to be able to register the structure, that would=
 stop
> > > > it right away :)
> > >=20
> > > In fact, set_wedge is optional.  But it's so easy to implement, t=
here's
> > > no good reason for leaving it out.
> >=20
> > It seems Thomas [original author of the driver] will be able to imp=
lement
> > said set_wedge function for it.
> > As he will need a bit of time for this, two possible ways for going
> > forward come to mind:
> > (1) use current driver [as set_wedge is optional] and add it later =
via
> > patch (2) resubmit whole driver again when set_wedge is added to it
> >=20
> > Obviously I would prefer option 1 :-), but in the end it's your dec=
ision.
>
> It shouldn't take that much time to do this, what is the delay?
from what I gathered, simply finding the necessary time slot for this.

> I'd prefer to get the correct version implemented and would not like =
to
> accept a patch that everyone knows is wrong.
ok, I will resubmit the driver when set_wedge is included

Heiko
