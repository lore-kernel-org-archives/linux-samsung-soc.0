From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/7] s3c-hsudc: add a remove function
Date: Sun, 18 Dec 2011 21:37:04 +0000
Message-ID: <20111218213704.GZ14542@n2100.arm.linux.org.uk>
References: <201112172023.05519.heiko@sntech.de> <201112182124.13313.heiko@sntech.de> <20111218203953.GY14542@n2100.arm.linux.org.uk> <201112182146.09090.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:56853 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751896Ab1LRVh0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Dec 2011 16:37:26 -0500
Content-Disposition: inline
In-Reply-To: <201112182146.09090.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Greg KH <greg@kroah.com>, Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

On Sun, Dec 18, 2011 at 09:46:08PM +0100, Heiko St=FCbner wrote:
> > > kobject: 'holders' (c7addc80): kobject_cleanup
> > > Unable to handle kernel paging request at virtual address bf05550=
4
> > > pgd =3D c0004000
> > > [bf055504] *pgd=3D371f9811, *pte=3D00000000, *ppte=3D00000000
> > > Internal error: Oops: 7 [#1]
> >=20
> > Please post the entire first oops dump for the above run - it may c=
ontain
> > useful information to properly track this down.
>=20
> kobject: 'holders' (c7addc80): kobject_cleanup
> Unable to handle kernel paging request at virtual address bf055504
> pgd =3D c0004000
> [bf055504] *pgd=3D371f9811, *pte=3D00000000, *ppte=3D00000000
> Internal error: Oops: 7 [#1]
> Modules linked in: ohci_hcd usbcore leds_s3c24xx i2c_s3c2410 i2c_core
> CPU: 0    Not tainted  (3.2.0-rc5-next-20111216+ #33)
> PC is at kobject_put+0x18/0x7c
> LR is at kobject_del+0x64/0x70
> pc : [<c0114624>]    lr : [<c011470c>]    psr: a0000013
> sp : c70bdef8  ip : c70bdf18  fp : c70bdf14
> r10: 00000000  r9 : c0114718  r8 : c7803a00
> r7 : c7abd360  r6 : c02e1de0  r5 : c7addca0  r4 : bf0554a0
> r3 : 00000001  r2 : 00000000  r1 : 00000000  r0 : bf0554a0
> Backtrace:=20
> [<c011460c>] (kobject_put+0x0/0x7c) from [<c011470c>] (kobject_del+0x=
64/0x70)
>  r4:c7addc80
> [<c01146a8>] (kobject_del+0x0/0x70) from [<c01147ec>] (kobject_delaye=
d_cleanup+0xd4/0x174)
>  r4:c7addc80
> [<c0114718>] (kobject_delayed_cleanup+0x0/0x174) from [<c00318fc>] (p=
rocess_one_work+0x24c/0x3a8)

Right, here's what I think is happening.

You're right that 0xc7addc80 is being cleaned up.  So, we enter
kobject_cleanup() with kobj =3D 0xc7addc80.  We get to this:

        /* remove from sysfs if the caller did not do it */
        if (kobj->state_in_sysfs) {
                pr_debug("kobject: '%s' (%p): auto cleanup kobject_del\=
n",
                         kobject_name(kobj), kobj);
                kobject_del(kobj);
        }

So, we call kobject_del() on c7addc80 (which we can see in r4 in the
backtrace):

void kobject_del(struct kobject *kobj)
{
        if (!kobj)
                return;

        sysfs_remove_dir(kobj);
        kobj->state_in_sysfs =3D 0;
        kobj_kset_leave(kobj);
        kobject_put(kobj->parent);

And so we get to kobject_put(), and we call that with a pointer of
0xbf0554a0.  This is a pointer into struct module.  And this is where
the problem lies...

The struct module is free'd as part of the core of the module
(mod->module_core) here:

static void module_deallocate(struct module *mod, struct load_info *inf=
o)
{
        kfree(info->strmap);
        percpu_modfree(mod);
        module_free(mod, mod->module_init);
        module_free(mod, mod->module_core);
}

A struct module contains:

struct module
{
	...
        /* Sysfs stuff. */
        struct module_kobject mkobj;

which in turn is defined as:

struct module_kobject {
        struct kobject kobj;
	...
}

So, we have a struct kobject contained within a data structure which is
independently allocated and freed - and this is highly illegal.  I'm
sure GregKH will want to discuss this with Rusty...
