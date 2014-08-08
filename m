From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] mfd: max77686: fix support for devices without irq
 specified
Date: Fri, 08 Aug 2014 12:54:11 +0200
Message-ID: <1407495251.28710.2.camel@AMDC1943>
References: <1457999.lNPdqEWCCR@amdc1032> <1407484788.21474.13.camel@AMDC1943>
 <53E49147.5060307@collabora.co.uk> <53E4A1E9.7090401@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <53E4A1E9.7090401@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


On pi=C4=85, 2014-08-08 at 12:09 +0200, Javier Martinez Canillas wrote:
> Hello,
>=20
> On 08/08/2014 10:58 AM, Javier Martinez Canillas wrote:
> >=20
> >>=20
> >> Not sufficient. You have to also fix RTC driver (OOPS from Trats2
> >> attached). Also consider adding checks for (max77686->irq) to the
> >> suspend and resume.
> >>=20
> >=20
> > Right, the max77686 RTC driver assumes that an IRQ domain will be c=
reated on the
> > mfd driver so a virtual IRQ can be mapped for the RTC alarm1 IRQ. T=
his
> > assumptions comes from the fact that the "interrupt" property is re=
quired
> > according to the DT binding doc.
> >=20
>=20
> Although for Trats2 I see that arch/arm/boot/dts/exynos4412-trats2.dt=
s defines
> an interrupt, so I wonder why regmap_irq_get_virq() is giving an oops=
 there:
>=20
> max77686_pmic@09 {
> 	compatible =3D "maxim,max77686";
> 	interrupt-parent =3D <&gpx0>;
> 	interrupts =3D <7 0>;
> 	reg =3D <0x09>;
> 	#clock-cells =3D <1>;
> ...

Because I am a nasty user :) and I removed the interrupts properties
manually (to test how the RTC will behave). Still the driver shouldn't
oops.

>=20
>=20
> > So the max77686 RTC wakealarm was not working for these boards befo=
re?

I don't know for Odroid but on Trats2 it works fine.

> >=20
> > Just to be sure that I understand the issue: these boards don't rea=
lly have an
> > IRQ connected to the PMIC, is not that this information is just mis=
sing in the
> > Device Tree, right?
> >=20
>=20
> By looking at Odroid's 3.8 based vendor tree I see that an IRQ for th=
e max77686
> PMIC is defined [0] using platform data:
>=20
> static struct max77686_platform_data exynos4_max77686_info =3D {
> 	.irq_gpio	=3D 	EXYNOS4_GPX3(2),
> 	.ono		=3D	EXYNOS4_GPX1(2),
> 	.num_regulators =3D ARRAY_SIZE(max77686_regulators),
> 	.regulators =3D max77686_regulators,
> ...
>=20
> So maybe this information is missing in
> arch/arm/boot/dts/exynos4412-odroid-common.dtsi?

Yes, it seems it is missing.

Best regards,
Krzysztof

>=20
> Best regards,
> Javier
>=20
> [0]:
> https://github.com/hardkernel/linux/blob/odroid-3.8.y/arch/arm/mach-e=
xynos/pmic-77686.h#L927
