From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: Fix subtle race in CPU pen_release hotplug code
Date: Mon, 20 Dec 2010 16:50:53 +0000
Message-ID: <20101220165053.GF28157@n2100.arm.linux.org.uk>
References: <E1PTuaP-0000Fl-EF@rmk-PC.arm.linux.org.uk> <AANLkTi=vp_jWMn98+cDs=+r9D7Don9iz+NvuOB6iCv42@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40148 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932292Ab0LTQvL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Dec 2010 11:51:11 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTi=vp_jWMn98+cDs=+r9D7Don9iz+NvuOB6iCv42@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>

On Mon, Dec 20, 2010 at 04:39:07PM +0000, Catalin Marinas wrote:
> On 18 December 2010 11:04, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > There is a subtle race in the CPU hotplug code, where a CPU which h=
as
> > been offlined can online itself before being requested, which resul=
ts
> > in things going astray on the next online/offline cycle.
> [...]
> > --- a/arch/arm/mach-realview/platsmp.c
> > +++ b/arch/arm/mach-realview/platsmp.c
> > @@ -36,6 +36,19 @@ extern void realview_secondary_startup(void);
> > =A0*/
> > =A0volatile int __cpuinitdata pen_release =3D -1;
> >
> > +/*
> > + * Write pen_release in a way that is guaranteed to be visible to =
all
> > + * observers, irrespective of whether they're taking part in coher=
ency
> > + * or not. =A0This is necessary for the hotplug code to work relia=
bly.
> > + */
> > +static void write_pen_release(int val)
> > +{
> > + =A0 =A0 =A0 pen_release =3D val;
> > + =A0 =A0 =A0 smp_wmb();
> > + =A0 =A0 =A0 __cpuc_flush_dcache_area((void *)&pen_release, sizeof=
(pen_release));
> > + =A0 =A0 =A0 outer_clean_range(__pa(&pen_release), __pa(&pen_relea=
se + 1));
> > +}
>=20
> Just a minor thing - I don't think we need any barrier here. Accordin=
g
> to the ARM ARM B2.2.7:
>=20
> "Any data cache or unified cache maintenance operation by MVA must be
> executed in program order
> relative to any explicit load or store on the same processor to an
> address covered by the MVA of the
> cache operation."

Right, I had been thinking about that.  I think the barrier came from t=
he
original ARM implementation, and I added the cache flushes.

> We also have a corresponding smp_rmb() in boot_secondary(), I don't
> think it has any use either.

I think you're right, but it looks a little unsafe without:

        timeout =3D jiffies + (1 * HZ);
        while (time_before(jiffies, timeout)) {
                if (pen_release =3D=3D -1)
                        break;

                udelay(10);
        }

I don't think it makes much odds if the pen_release check gets
re-ordered, especially as we do a final pen_release check after we
unlock.  However, could the loop end up waiting additional 10us
without the smp_rmb() ?
