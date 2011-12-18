From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 3/7] s3c-hsudc: add a remove function
Date: Sun, 18 Dec 2011 20:39:53 +0000
Message-ID: <20111218203953.GY14542@n2100.arm.linux.org.uk>
References: <201112172023.05519.heiko@sntech.de> <201112182033.33640.heiko@sntech.de> <20111218194518.GX14542@n2100.arm.linux.org.uk> <201112182124.13313.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201112182124.13313.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Dec 18, 2011 at 09:24:12PM +0100, Heiko St=FCbner wrote:
> Am Sonntag 18 Dezember 2011, 20:45:18 schrieb Russell King - ARM Linu=
x:
> > On Sun, Dec 18, 2011 at 08:33:32PM +0100, Heiko St=FCbner wrote:
> > > Am Sonntag 18 Dezember 2011, 20:01:02 schrieben Sie:
> > > > On Sun, Dec 18, 2011 at 07:50:37PM +0100, Heiko St=FCbner wrote=
:
> > > > > I didn't get this far. With your patch the Oopses already hap=
pen
> > > > > during the startup of the system / the loading of the modules=
=2E
> > > >=20
> > > > > A bit of the message spew I got during testing with linux-
> next-20111216:
> > > > In some way, this is a good thing because it's showing that the=
re's
> > > > problems with kobject lifetime rules.
> > > >=20
> > > > The #2 and further oops dumps are a result of corrupting the wo=
rk
> > > > queues as a result of #1, so #2 onwards should be ignored.
> > > >=20
> > > > I suspect if you avoid loading the s3c_hsudc module these will =
go away.
> > >=20
> > > nope :-), same faults happen even if s3c-hsudc is not present at =
all.
> > > So it seems, this delayed cleanup poses problems for other driver=
s as
> > > well.
> >=20
> > Okay, let's try to find out which one it is.  Please use the attach=
ed
> > patch - it'll be a little more noisy, reporting which kobjects are
> > being released at the point when they're added to the workqueue.
> The cuplrit seems to be a kobject named "holders" and from what I
> gathered is from kernel/module.c and handling module sysfs entries.
>=20
>=20
> Partial log below:
>=20
> kobject: 'bq24022' (c78a9a80): kobject_release
> [...]
> kobject: 'gpio-vbus' (c78a9cc0): kobject_release
> [...]
> kobject: 'bq24022' (c78a9a80): kobject_cleanup
> kobject: 'gpio-vbus' (c78a9cc0): kobject_cleanup
> [...]
> Found /sbin/init, booting ...
>=20
> INIT: version 2.88 booting
>=20
> Starting the hotplug events dispatcher: udevdudevd[367]: starting ver=
sion 172
> .
> Synthesizing the initial hotplug events...done.
> Waiting for /dev to be fully populated...
> [...]
> Cleaning up ifupdown....
> Loading kernel modules...
> kobject: 'holders' (c7addc80): kobject_release
> kobject: 'notes' (c7add080): kobject_release
> done.
> Activating lvm and md swap...done.
> Checking file systems...fsck from util-linux 2.19.1
> done.
> [...]
> kobject: 'holders' (c7addc80): kobject_cleanup
> Unable to handle kernel paging request at virtual address bf055504
> pgd =3D c0004000
> [bf055504] *pgd=3D371f9811, *pte=3D00000000, *ppte=3D00000000
> Internal error: Oops: 7 [#1]

Please post the entire first oops dump for the above run - it may conta=
in
useful information to properly track this down.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
