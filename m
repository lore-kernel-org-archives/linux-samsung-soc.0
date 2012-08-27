From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] gpio: samsung: add devicetree init for s3c24xx arches
Date: Mon, 27 Aug 2012 12:12:19 +0200
Message-ID: <201208271212.20016.heiko@sntech.de>
References: <201208252353.59345.heiko@sntech.de> <201208271144.03681.heiko@sntech.de> <CA+E=qVf9+J1rtvr7snhfRgqKHgWZ+g7TfcQuP8qm00+HH86CDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44121 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751465Ab2H0KMa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Aug 2012 06:12:30 -0400
In-Reply-To: <CA+E=qVf9+J1rtvr7snhfRgqKHgWZ+g7TfcQuP8qm00+HH86CDQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@stericsson.com>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Landley <rob@landley.net>, Olof Johansson <olof@lixom.net>, arm-linux <linux-arm-kernel@lists.infradead.org>

Am Montag, 27. August 2012, 11:51:27 schrieb Vasily Khoruzhick:
> On Mon, Aug 27, 2012 at 12:44 PM, Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
> > Hi Vasily,
> >=20
> > I'm not sure I follow :-) .
> >=20
> > The compatible property here only sets the mechanism on how to hand=
le the
> > gpios defined in the devicetree - here to use the s3c24xx-style. As=
 you
> > can see in gpio-samsung.c the handling is already unified for all t=
he
> > s3c24xx architectures.
> >=20
> > The definition of what gpio banks exist is then done in the respect=
ive
> > devicetree file for the individual SoC. And of course here one woul=
d have
> > individual definitions, depending on the banks present.
> >=20
> > For reference my quite empty s3c2416.dtsi file currently looks like=
:
> >=20
> > /include/ "skeleton.dtsi"
> >=20
> > / {
> >=20
> >         compatible =3D "samsung,s3c2416";
> >        =20
> >         cpus {
> >        =20
> >                 cpu@0 {
> >                =20
> >                         compatible =3D "arm,arm926ejs";
> >                =20
> >                 };
> >        =20
> >         };
> >        =20
> >         gpio-controllers {
> >        =20
> >                 #address-cells =3D <1>;
> >                 #size-cells =3D <1>;
> >                 gpio-controller;
> >                 ranges;
> >                =20
> >                 gpa: gpio-controller@56000000 {
> >                =20
> >                         compatible =3D "samsung,s3c24xx-gpio";
> >                         reg =3D <0x56000000 0x10>;
> >                         #gpio-cells =3D <3>;
> >                =20
> >                 };
> >                =20
> >                 gpb: gpio-controller@56000010 {
> >                =20
> >                         compatible =3D "samsung,s3c24xx-gpio";
> >                         reg =3D <0x56000010 0x10>;
> >                         #gpio-cells =3D <3>;
> >                =20
> >                 };

[ ... ]

> >         };
> >=20
> > };
> >=20
> > Other s3c24xx SoCs would of course need to define their own.
>=20
> I see. But how does it handle GPA bank (which is output-only, and
> GPACON differs a bit from GP{B-J}CON? And some banks has lower number
> (not 16) of GPIOs, like GPH.
>=20
> Also, what would be value for S3C_GPIO_END?

The creation of the banks is still done in gpio-samsung.c and the speci=
al=20
handling of bank-a is still sitting in the s3c24xx_gpios[] array there.

In general the gpios are still created completely like before and the=20
devicetree information is only attached to them so that dt-devices can=20
reference them.

As you can see in the original patch, after the respective chip got cre=
ated in=20
s3c24xx_gpiolib_add_chips, s3c24xx_gpiolib_attach_ofnode searches for t=
he=20
representation of it in the device tree and attaches this to the chip.

So nothing really changed, except that dt-devices can now reference gpi=
os and=20
if they do s3c24xx_gpio_xlate will get called to configure them with th=
e=20
target values from the dt.

Currently I'm also only using it in a mixed mode configuration [1],=20
supplementing a normal machine file with some devices from the devicetr=
ee -=20
especially as I still need to figure out, what to do about the interrup=
t=20
controller.


Heiko


[1] https://github.com/mmind/linux-es600/blob/topic/es600-
devel/arch/arm/boot/dts/s3c24xx-sg06.dts
