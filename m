From: Tony Lindgren <tony@atomide.com>
Subject: Re: Samsung SoCs: preparation for single kernel
Date: Wed, 23 Jun 2010 10:28:55 +0300
Message-ID: <20100623072855.GZ12255@atomide.com>
References: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
 <AANLkTil-AOEqhMOXydaiA1X_v0rjoNQxALrO0UY638AS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:51468 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751417Ab0FWH2y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 03:28:54 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTil-AOEqhMOXydaiA1X_v0rjoNQxALrO0UY638AS@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Eric Miao <eric.y.miao@gmail.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, arm-linux <linux-arm-kernel@lists.infradead.org>, Ben Dooks <ben-linux@fluff.org>, Marek Szyprowski <m.szyprowski@samsung.com>

* Eric Miao <eric.y.miao@gmail.com> [100623 03:48]:
> On Wed, Jun 23, 2010 at 7:27 AM, Kyungmin Park <kmpark@infradead.org>=
 wrote:
> > To Ben,
> >
> > I really need single kernel for s5pc110 (cortex A8) and s5pc210
> > (cortex A9) at least.
> > Fortunately arm move to these approaches recently. but current Sams=
ung
> > SoCs not prepare these one.
> >
> > So I wonder do you have a plan or how to address these issues?
> > How to assign the address at resources and use it at runtime?
> >
> > Personally I want to use cpu_is_*. but you reject it to use.
> > Other way is that we can create the base address variables and assi=
gn
> > it at init time.
> >
> > Please give your opinions.
> >
> > Thank you,
> > Kyungmin Park
> >
> > e.g., cpu_is_* usage at OMAP tree
> >
> > static void omap_init_mcspi(void)
> > {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap44xx())
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap4_mcspi_=
fixup();
> >
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register(&omap2_mcspi1);
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register(&omap2_mcspi2);
> >
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap2430() || cpu_is_omap343x=
() || cpu_is_omap44xx())
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap2_mcspi3=
_init();
> >
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap343x() || cpu_is_omap44xx=
())
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap2_mcspi4=
_init();
> > }
>=20
> Just my two cents: cpu_is_*() can be used, but only when absolutely n=
ecessary.
> The s3c does a CPU detection at startup, so I guess the usage of cpu_=
is_*()
> can be even reduced.
>=20
> I'm not sure if the above case is a good reference or not. The omap_i=
nit_mcspi
> is called from omap2_init_devices(), while the registration can actua=
lly be
> made into the board init code when that device is used (some of the M=
cSPIs are
> not used, and it's not necessary to register them), and the differenc=
es be
> handled in the driver.

=46ew comments regarding the cpu_is_omap macros: The macros should real=
ly be
soc_is_omapxxxx() instead cpu_is_omapxxxx().

Also, sprinkling these too much makes the code messy and hard to patch =
for
new processors. So you should limit the use to very selected places dur=
ing
init, then set some flag like OMAP_HAS_MCSPI2 | OMAP_HAS_MCSPI3 or some=
thing
similar.

Regards,

Tony
