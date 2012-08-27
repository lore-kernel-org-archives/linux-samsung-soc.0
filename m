From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] gpio: samsung: add devicetree init for s3c24xx arches
Date: Mon, 27 Aug 2012 11:44:03 +0200
Message-ID: <201208271144.03681.heiko@sntech.de>
References: <201208252353.59345.heiko@sntech.de> <201208271001.05026.heiko@sntech.de> <CA+E=qVfV1DL1ikjVnLd7qTeCx9C8Z7dGvhh_9NSgxPYrOCJ=0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CA+E=qVfV1DL1ikjVnLd7qTeCx9C8Z7dGvhh_9NSgxPYrOCJ=0g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@stericsson.com>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Landley <rob@landley.net>, Olof Johansson <olof@lixom.net>, arm-linux <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vasily,

Am Montag, 27. August 2012, 10:57:04 schrieb Vasily Khoruzhick:
> Hi,
>=20
> On Mon, Aug 27, 2012 at 11:01 AM, Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
> > Hi Thomas,
> >=20
> > thanks for your review:
> >=20
> > Hmmm, but the logic to drive the gpio controller is the same for al=
l
> > arches. The only difference is the number to use for the different =
pull
> > up/down settings. So I think the "samsung,s3c24xx-gpio" is ok but t=
he
> > documentation should simply reflect the different pull settings.
>=20
> Also s3c2410 and s3c2440 has different count of GPIOs. And that could
> be a problem on machines
> with GPIO-expanders (h1940 machine)

I'm not sure I follow :-) .=20

The compatible property here only sets the mechanism on how to handle t=
he=20
gpios defined in the devicetree - here to use the s3c24xx-style. As you=
 can=20
see in gpio-samsung.c the handling is already unified for all the s3c24=
xx=20
architectures.

The definition of what gpio banks exist is then done in the respective=20
devicetree file for the individual SoC. And of course here one would ha=
ve=20
individual definitions, depending on the banks present.

=46or reference my quite empty s3c2416.dtsi file currently looks like:

/include/ "skeleton.dtsi"

/ {
	compatible =3D "samsung,s3c2416";

	cpus {
		cpu@0 {
			compatible =3D "arm,arm926ejs";
		};
	};

	gpio-controllers {
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		gpio-controller;
		ranges;

		gpa: gpio-controller@56000000 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x56000000 0x10>;
			#gpio-cells =3D <3>;
		};

		gpb: gpio-controller@56000010 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x56000010 0x10>;
			#gpio-cells =3D <3>;
		};

		gpc: gpio-controller@56000020 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x56000020 0x10>;
			#gpio-cells =3D <3>;
		};

		gpd: gpio-controller@56000030 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x56000030 0x10>;
			#gpio-cells =3D <3>;
		};

		gpe: gpio-controller@56000040 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x56000040 0x10>;
			#gpio-cells =3D <3>;
		};

		gpf: gpio-controller@56000050 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x56000050 0x10>;
			#gpio-cells =3D <3>;
		};

		gpg: gpio-controller@56000060 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x56000060 0x10>;
			#gpio-cells =3D <3>;
		};

		gph: gpio-controller@56000070 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x56000070 0x10>;
			#gpio-cells =3D <3>;
		};

		/* s3c2443 and later */
		gpj: gpio-controller@560000D0 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x560000D0 0x10>;
			#gpio-cells =3D <3>;
		};

		gpk: gpio-controller@560000E0 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x560000E0 0x10>;
			#gpio-cells =3D <3>;
		};

		gpl: gpio-controller@560000F0 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x560000F0 0x10>;
			#gpio-cells =3D <3>;
		};

		gpm: gpio-controller@56000100 {
			compatible =3D "samsung,s3c24xx-gpio";
			reg =3D <0x56000100 0x10>;
			#gpio-cells =3D <3>;
		};
	};
};

Other s3c24xx SoCs would of course need to define their own.

> >> It would be informative to add information about the 'mux function=
'
> >> cell here as well. Specifically, on how to handle the banks that h=
ave
> >> an extended GPxSEL register that allow additional pin function
> >> selection.
> >=20
> > Will add a mux function description.
> >=20
> > Until now I've never realised the existence of the GPxSEL registers=
, so
> > thanks for the pointer :-).
> >=20
> > But is this used in the driver at all? All the setcfg/getcfg functi=
ons in
> > gpio-samsung.c only handle the GPxCON registers - I haven't found c=
ode to
> > handle the GPxSEL registers at all. So my guess is that this was ne=
ver
> > implemented - or that I'm blind ;-) .
>=20
> There're no GPxSEL registers on s3c2410/s3c2440/s3c2442. Is it
> something s3c2412/sec2416 specific?

s3c2412 also does not have it ... it seems entirely specific to=20
s3c2416/s3c2450 and as written also seems to be unused.
So I would tend to ignore it for now :-) .


Heiko
