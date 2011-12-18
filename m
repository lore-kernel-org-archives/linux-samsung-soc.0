From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/7] s3c-hsudc: add a remove function
Date: Sun, 18 Dec 2011 21:24:12 +0100
Message-ID: <201112182124.13313.heiko@sntech.de>
References: <201112172023.05519.heiko@sntech.de> <201112182033.33640.heiko@sntech.de> <20111218194518.GX14542@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:43395 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751876Ab1LRUYY convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Dec 2011 15:24:24 -0500
In-Reply-To: <20111218194518.GX14542@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Greg KH <greg@kroah.com>, Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

Am Sonntag 18 Dezember 2011, 20:45:18 schrieb Russell King - ARM Linux:
> On Sun, Dec 18, 2011 at 08:33:32PM +0100, Heiko St=FCbner wrote:
> > Am Sonntag 18 Dezember 2011, 20:01:02 schrieben Sie:
> > > On Sun, Dec 18, 2011 at 07:50:37PM +0100, Heiko St=FCbner wrote:
> > > > I didn't get this far. With your patch the Oopses already happe=
n
> > > > during the startup of the system / the loading of the modules.
> > >=20
> > > > A bit of the message spew I got during testing with linux-
next-20111216:
> > > In some way, this is a good thing because it's showing that there=
's
> > > problems with kobject lifetime rules.
> > >=20
> > > The #2 and further oops dumps are a result of corrupting the work
> > > queues as a result of #1, so #2 onwards should be ignored.
> > >=20
> > > I suspect if you avoid loading the s3c_hsudc module these will go=
 away.
> >=20
> > nope :-), same faults happen even if s3c-hsudc is not present at al=
l.
> > So it seems, this delayed cleanup poses problems for other drivers =
as
> > well.
>=20
> Okay, let's try to find out which one it is.  Please use the attached
> patch - it'll be a little more noisy, reporting which kobjects are
> being released at the point when they're added to the workqueue.
The cuplrit seems to be a kobject named "holders" and from what I
gathered is from kernel/module.c and handling module sysfs entries.


Partial log below:

kobject: 'bq24022' (c78a9a80): kobject_release
[...]
kobject: 'gpio-vbus' (c78a9cc0): kobject_release
[...]
kobject: 'bq24022' (c78a9a80): kobject_cleanup
kobject: 'gpio-vbus' (c78a9cc0): kobject_cleanup
[...]
=46ound /sbin/init, booting ...

INIT: version 2.88 booting

Starting the hotplug events dispatcher: udevdudevd[367]: starting versi=
on 172
=2E
Synthesizing the initial hotplug events...done.
Waiting for /dev to be fully populated...
[...]
Cleaning up ifupdown....
Loading kernel modules...
kobject: 'holders' (c7addc80): kobject_release
kobject: 'notes' (c7add080): kobject_release
done.
Activating lvm and md swap...done.
Checking file systems...fsck from util-linux 2.19.1
done.
[...]
kobject: 'holders' (c7addc80): kobject_cleanup
Unable to handle kernel paging request at virtual address bf055504
pgd =3D c0004000
[bf055504] *pgd=3D371f9811, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 7 [#1]
