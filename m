From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESEND PATCH v2] ARM: exynos4: hotplug: Fix CPU idle clock down
 after CPU off
Date: Wed, 16 Jul 2014 13:19:10 +0200
Message-ID: <1405509550.7368.0.camel@AMDC1943>
References: <1405499003-9975-1-git-send-email-k.kozlowski@samsung.com>
 <53C65890.8000500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:14996 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757134AbaGPLTT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 07:19:19 -0400
In-reply-to: <53C65890.8000500@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>




On =C5=9Bro, 2014-07-16 at 12:48 +0200, Tomasz Figa wrote:
> Hi Krzysztof,
>=20
> Please see my comment below.
>=20
> On 16.07.2014 10:23, Krzysztof Kozlowski wrote:
> > On Exynos4 USE_DELAYED_RESET_ASSERTION must be set in
> > ARM_COREx_OPTION register during CPU power down. This is the proper=
 way
> > of powering down CPU on Exynos4.
> >=20
> > Additionally on Exynos4212 without this the CPU clock down feature =
won't
> > work after powering down some CPU and the online CPUs will work at =
full
> > frequency chosen by CPUfreq governor.
> >=20
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> [snip]
>=20
> > @@ -36,6 +36,14 @@ static inline void cpu_leave_lowpower(void)
> >  	  : "=3D&r" (v)
> >  	  : "Ir" (CR_C), "Ir" (0x40)
> >  	  : "cc");
> > +
> > +	if (soc_is_exynos4()) {
> > +		unsigned int tmp;
> > +
> > +		tmp =3D __raw_readl(EXYNOS_ARM_CORE_OPTION(core_id));
> > +		tmp &=3D ~(S5P_USE_DELAYED_RESET_ASSERTION);
> > +		__raw_writel(tmp, EXYNOS_ARM_CORE_OPTION(core_id));
> > +	}
>=20
> This code is executed only if the CPU doesn't manage to power off bef=
ore
> already receiving a wake-up event. Otherwise the context is lost afte=
r
> wfi(), as the core power is being cut down.
>=20
> The normal wake-up path goes through platsmp's exynos_boot_secondary(=
)
> and I believe that setting of S5P_USE_DELAYED_RESET_ASSERTION should =
be
> taken care there as well.

You're right. Thanks for pointing this, I'll fix it.

Best regards,
Krzysztof
>=20
> Best regards,
> Tomasz
