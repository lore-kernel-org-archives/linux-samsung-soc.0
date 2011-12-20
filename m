From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/7] s3c-hsudc: add a remove function
Date: Mon, 19 Dec 2011 22:08:05 -0800
Message-ID: <20111220060805.GD25439@kroah.com>
References: <201112172023.05519.heiko@sntech.de>
 <201112182124.13313.heiko@sntech.de>
 <20111218203953.GY14542@n2100.arm.linux.org.uk>
 <201112182146.09090.heiko@sntech.de>
 <20111218213704.GZ14542@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111218213704.GZ14542-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Dec 18, 2011 at 09:37:04PM +0000, Russell King - ARM Linux wrot=
e:
> On Sun, Dec 18, 2011 at 09:46:08PM +0100, Heiko St=FCbner wrote:
> > > > kobject: 'holders' (c7addc80): kobject_cleanup
> > > > Unable to handle kernel paging request at virtual address bf055=
504
> > > > pgd =3D c0004000
> > > > [bf055504] *pgd=3D371f9811, *pte=3D00000000, *ppte=3D00000000
> > > > Internal error: Oops: 7 [#1]
> > >=20
> > > Please post the entire first oops dump for the above run - it may=
 contain
> > > useful information to properly track this down.
> >=20
> > kobject: 'holders' (c7addc80): kobject_cleanup
> > Unable to handle kernel paging request at virtual address bf055504
> > pgd =3D c0004000
> > [bf055504] *pgd=3D371f9811, *pte=3D00000000, *ppte=3D00000000
> > Internal error: Oops: 7 [#1]
> > Modules linked in: ohci_hcd usbcore leds_s3c24xx i2c_s3c2410 i2c_co=
re
> > CPU: 0    Not tainted  (3.2.0-rc5-next-20111216+ #33)
> > PC is at kobject_put+0x18/0x7c
> > LR is at kobject_del+0x64/0x70
> > pc : [<c0114624>]    lr : [<c011470c>]    psr: a0000013
> > sp : c70bdef8  ip : c70bdf18  fp : c70bdf14
> > r10: 00000000  r9 : c0114718  r8 : c7803a00
> > r7 : c7abd360  r6 : c02e1de0  r5 : c7addca0  r4 : bf0554a0
> > r3 : 00000001  r2 : 00000000  r1 : 00000000  r0 : bf0554a0
> > Backtrace:=20
> > [<c011460c>] (kobject_put+0x0/0x7c) from [<c011470c>] (kobject_del+=
0x64/0x70)
> >  r4:c7addc80
> > [<c01146a8>] (kobject_del+0x0/0x70) from [<c01147ec>] (kobject_dela=
yed_cleanup+0xd4/0x174)
> >  r4:c7addc80
> > [<c0114718>] (kobject_delayed_cleanup+0x0/0x174) from [<c00318fc>] =
(process_one_work+0x24c/0x3a8)
>=20
> Right, here's what I think is happening.
>=20
> You're right that 0xc7addc80 is being cleaned up.  So, we enter
> kobject_cleanup() with kobj =3D 0xc7addc80.  We get to this:
>=20
>         /* remove from sysfs if the caller did not do it */
>         if (kobj->state_in_sysfs) {
>                 pr_debug("kobject: '%s' (%p): auto cleanup kobject_de=
l\n",
>                          kobject_name(kobj), kobj);
>                 kobject_del(kobj);
>         }
>=20
> So, we call kobject_del() on c7addc80 (which we can see in r4 in the
> backtrace):
>=20
> void kobject_del(struct kobject *kobj)
> {
>         if (!kobj)
>                 return;
>=20
>         sysfs_remove_dir(kobj);
>         kobj->state_in_sysfs =3D 0;
>         kobj_kset_leave(kobj);
>         kobject_put(kobj->parent);
>=20
> And so we get to kobject_put(), and we call that with a pointer of
> 0xbf0554a0.  This is a pointer into struct module.  And this is where
> the problem lies...
>=20
> The struct module is free'd as part of the core of the module
> (mod->module_core) here:
>=20
> static void module_deallocate(struct module *mod, struct load_info *i=
nfo)
> {
>         kfree(info->strmap);
>         percpu_modfree(mod);
>         module_free(mod, mod->module_init);
>         module_free(mod, mod->module_core);
> }
>=20
> A struct module contains:
>=20
> struct module
> {
> 	...
>         /* Sysfs stuff. */
>         struct module_kobject mkobj;
>=20
> which in turn is defined as:
>=20
> struct module_kobject {
>         struct kobject kobj;
> 	...
> }
>=20
> So, we have a struct kobject contained within a data structure which =
is
> independently allocated and freed - and this is highly illegal.  I'm
> sure GregKH will want to discuss this with Rusty...

Ugh, that sucks, yes I'll work on this when I get back from vacation th=
e
first week in January.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
