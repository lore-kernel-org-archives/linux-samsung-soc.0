From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 6/6] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common
 clock framework
Date: Mon, 22 Jul 2013 19:07:15 +0200
Message-ID: <2236509.stVfXyPhpt@amdc1227>
References: <201307100057.06061.heiko@sntech.de>
 <201307100100.28992.heiko@sntech.de>
 <02cf01ce81f3$6777e5f0$3667b1d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41698 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757778Ab3GVRHV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 13:07:21 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQC00INEKUHT960@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 18:07:19 +0100 (BST)
In-reply-to: <02cf01ce81f3$6777e5f0$3667b1d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Heiko =?ISO-8859-1?Q?St=FCbner=27?= <heiko@sntech.de>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Russell King' <linux@arm.linux.org.uk>, 'Kukjin Kim' <kgene@kernel.org>

On Tuesday 16 of July 2013 16:09:24 Kukjin Kim wrote:
> Heiko St=FCbner wrote:
> > This converts the mentioned platforms to use the newly introduced
> > driver
> > for the common clock framework for them.
> >=20
> > With this the whole legacy clock structure can go away too.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  arch/arm/boot/dts/s3c2416-smdk2416.dts  |    7 +
> >  arch/arm/boot/dts/s3c2416.dtsi          |   42 ++
> >  arch/arm/mach-s3c24xx/Kconfig           |   14 +-
> >  arch/arm/mach-s3c24xx/Makefile          |    5 +-
> >  arch/arm/mach-s3c24xx/clock-s3c2416.c   |  171 --------
> >  arch/arm/mach-s3c24xx/clock-s3c2443.c   |  212 ----------
> >  arch/arm/mach-s3c24xx/common-s3c2443.c  |  677
> >  --------------------------->=20
> > ----
>=20
> In this case, to use '-D' in format-patch would be better :-)
>=20
> >  arch/arm/mach-s3c24xx/common.c          |   18 +-
> >  arch/arm/mach-s3c24xx/common.h          |    8 +
> >  arch/arm/mach-s3c24xx/mach-s3c2416-dt.c |   45 +-
> >  arch/arm/mach-s3c24xx/mach-smdk2416.c   |    9 +-
> >  arch/arm/mach-s3c24xx/mach-smdk2443.c   |    9 +-
> >  12 files changed, 102 insertions(+), 1115 deletions(-)
> >  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2416.c
> >  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2443.c
> >  delete mode 100644 arch/arm/mach-s3c24xx/common-s3c2443.c
> >=20
> > diff --git a/arch/arm/boot/dts/s3c2416-smdk2416.dts
> > b/arch/arm/boot/dts/s3c2416-smdk2416.dts
> > index 59594cf..9caeb89 100644
> > --- a/arch/arm/boot/dts/s3c2416-smdk2416.dts
> > +++ b/arch/arm/boot/dts/s3c2416-smdk2416.dts
> > @@ -19,6 +19,13 @@
> >=20
> >  		reg =3D  <0x30000000 0x4000000>;
> >  =09
> >  	};
> >=20
> > +	fixed-rate-clocks {
> > +		xti {
> > +			compatible =3D "samsung,clock-xti";
> > +			clock-frequency =3D <12000000>;
> > +		};
> > +	};
> > +
> >=20
> >  	serial@50000000 {
> >  =09
> >  		status =3D "okay";
> >  		pinctrl-names =3D "default";
> >=20
> > diff --git a/arch/arm/boot/dts/s3c2416.dtsi
> > b/arch/arm/boot/dts/s3c2416.dtsi
> > index e6555bd..c19d99c 100644
> > --- a/arch/arm/boot/dts/s3c2416.dtsi
> > +++ b/arch/arm/boot/dts/s3c2416.dtsi
> > @@ -8,6 +8,7 @@
> >=20
> >   * published by the Free Software Foundation.
> >   */
> >=20
> > +#include <dt-bindings/clock/samsung,s3c2443-clock.h>
> >=20
> >  #include "s3c24xx.dtsi"
> >  #include "s3c2416-pinctrl.dtsi"
> >=20
> > @@ -28,26 +29,53 @@
> >=20
> >  		compatible =3D "samsung,s3c2416-irq";
> >  =09
> >  	};
> >=20
> > +	clocks: clock-controller@0x4c000000 {
>=20
> +	clock: clock-controller@0x4c000000 {
>=20
> for keeping same format for Samsung stuff...
>=20

Also please remove the "0x" from node name.

> > +		compatible =3D "samsung,s3c2416-clock";
> > +		reg =3D <0x4c000000 0x40>;
> > +		#clock-cells =3D <1>;
> > +	};
> > +
> >=20
> >  	pinctrl@56000000 {
> >  =09
> >  		compatible =3D "samsung,s3c2416-pinctrl";
> >  =09
> >  	};
> >=20
> > +	timer@51000000 {
> > +		clocks =3D <&clocks PCLK_PWM>;
>=20
> +		clocks =3D <&clock PCLK_PWM>;
>=20
> And I'm not sure using definition PCLK_PWM is better here...

Care to explain your doubts about it? I think this is fine.

Best regards,
Tomasz
