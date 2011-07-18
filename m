From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: dt: Add device tree support for i2c instance 1
 on exynos4 dt machine
Date: Mon, 18 Jul 2011 14:28:19 -0600
Message-ID: <CACxGe6s1tqWVt5w9c7+3RQmgySDhxxC7FhNs6aXJnxxL4if7Xw@mail.gmail.com>
References: <1310950241-13602-1-git-send-email-thomas.abraham@linaro.org>
 <1310950241-13602-3-git-send-email-thomas.abraham@linaro.org>
 <20110718043059.GB15023@ponder.secretlab.ca> <20110718094534.GN15795@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110718094534.GN15795-SMNkleLxa3Z6Wcw2j4pizdi2O/JbrIOy@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jul 18, 2011 at 3:45 AM, Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> wrote:
> On Sun, Jul 17, 2011 at 10:30:59PM -0600, Grant Likely wrote:
>> On Mon, Jul 18, 2011 at 06:20:41AM +0530, Thomas Abraham wrote:
>> > Add device node for i2c instance 1 and list all its connected slav=
e
>> > devices.
>> >
>> > Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > ---
>> > =A0arch/arm/boot/dts/exynos4-smdkv310.dts =A0| =A0 19 ++++++++++++=
++++++-
>> > =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
>> > =A0arch/arm/mach-exynos4/mach-exynos4-dt.c | =A0 =A09 +++++++++
>> > =A03 files changed, 28 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/exynos4-smdkv310.dts b/arch/arm/boo=
t/dts/exynos4-smdkv310.dts
>> > index d65c18c..29c40ed 100644
>> > --- a/arch/arm/boot/dts/exynos4-smdkv310.dts
>> > +++ b/arch/arm/boot/dts/exynos4-smdkv310.dts
>> > @@ -23,7 +23,7 @@
>> > =A0 =A0 };
>> >
>> > =A0 =A0 chosen {
>> > - =A0 =A0 =A0 =A0 =A0 bootargs =3D "root=3D/dev/mmcblk0p1 rootfsty=
pe=3Dext3 rootwait console=3DttySAC1,115200";
>> > + =A0 =A0 =A0 =A0 =A0 bootargs =3D "root=3D/dev/mmcblk0p1 rootfsty=
pe=3Dext3 rootwait console=3DttySAC1,115200 init=3D/linuxrc";
>> > =A0 =A0 };
>> >
>> > =A0 =A0 soc {
>> > @@ -64,5 +64,22 @@
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,sdhci-cd-type =3D =
<0>;
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,sdhci-clkdiv-exter=
nal;
>> > =A0 =A0 =A0 =A0 =A0 =A0 };
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 i2c@13870000 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c2=
440-i2c";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x13870000 0x100>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <345>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,i2c-bus-number =3D <=
1>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,i2c-slave-addr =3D <=
16>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,i2c-sda-delay =3D <1=
00>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,i2c-max-bus-freq =3D=
 <100000>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wm8994@1a {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D=
 "wlf,wm8994";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x1=
a>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> > + =A0 =A0 =A0 =A0 =A0 };
>> > =A0 =A0 };
>> > =A0};
>> > diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4=
/Kconfig
>> > index bb97b7e..c7fce3e 100644
>> > --- a/arch/arm/mach-exynos4/Kconfig
>> > +++ b/arch/arm/mach-exynos4/Kconfig
>> > @@ -193,6 +193,7 @@ config MACH_EXYNOS4_DT
>> > =A0 =A0 select S3C_DEV_HSMMC
>> > =A0 =A0 select S3C_DEV_HSMMC2
>> > =A0 =A0 select EXYNOS4_SETUP_SDHCI
>> > + =A0 select EXYNOS4_SETUP_I2C1
>> > =A0 =A0 help
>> > =A0 =A0 =A0 Machine support for Samsung Exynos4 machine with devic=
e tree enabled.
>> >
>> > diff --git a/arch/arm/mach-exynos4/mach-exynos4-dt.c b/arch/arm/ma=
ch-exynos4/mach-exynos4-dt.c
>> > index 120665a..ef6b4cb 100644
>> > --- a/arch/arm/mach-exynos4/mach-exynos4-dt.c
>> > +++ b/arch/arm/mach-exynos4/mach-exynos4-dt.c
>> > @@ -23,7 +23,10 @@
>> > =A0#include <plat/regs-serial.h>
>> > =A0#include <plat/exynos4.h>
>> > =A0#include <plat/cpu.h>
>> > +#include <plat/devs.h>
>> > =A0#include <plat/sdhci.h>
>> > +#include <plat/iic.h>
>> > +#include <plat/iic-core.h>
>> >
>> > =A0#include <mach/map.h>
>> >
>> > @@ -62,6 +65,10 @@ static struct s3c2410_uartcfg smdkv310_uartcfgs=
[] __initdata =3D {
>> > =A0 =A0 },
>> > =A0};
>> >
>> > +static struct s3c2410_platform_i2c exynos4_dt_i2c_data1 __initdat=
a =3D {
>> > + =A0 .cfg_gpio =A0 =A0 =A0 =3D s3c_i2c1_cfg_gpio,
>> > +};
>> > +
>> > =A0/*
>> > =A0 * The following lookup table is used to override device names =
when devices
>> > =A0 * are registered from device tree. Optionally, the platform da=
ta can also
>> > @@ -75,6 +82,8 @@ static const struct of_dev_auxdata exynos4_auxda=
ta_lookup[] __initconst =3D {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s3c-sdhci=
=2E2", &s3c_hsmmc2_def_platdata),
>> > =A0 =A0 OF_DEV_AUXDATA("samsung,s3c6410-sdhci", EXYNOS4_PA_HSMMC(0=
),
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s3c-sdhci=
=2E0", &s3c_hsmmc0_def_platdata),
>> > + =A0 OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(1),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s3c2440-i2c=
=2E1", &exynos4_dt_i2c_data1),
>>
>> Should not need the platform_data here. =A0Add DT support to the GPI=
O
>> driver and decode the data from there (which should be easy).
>
> Hmm, do we have any sane way of passing which configuration settings
> should be applied to the gpio pins (given that there can be up to 13
> non-IO settings for some of these pins).

I've been looking at having an IO routing configuration node that sets
up the SoC for a particular board.  This works for static
configuration, which seems to be 99% of the use cases, but it doesn't
help much for IO configuration that needs to be manipulated at
runtime.

> Also, since this data is really part of the SoC, I don't really want
> to see n different .dts files hanging around with the same informatio=
n
> in it.

Yes, the SoC details should be in a .dtsi (dts include file) file that
is included by the board file.  Properties in the board .dts file will
overlay and override data in the SoC file.

> Maybe it is time for a standardised callback to allow devices to conn=
ect
> themselves to the pins they need, and have dt capability of over-ridi=
ng
> the information if it needs it.

Linus W. has been working on the pinmux subsystem to handle doing
that.  Personally, I'm not excited about device drivers managing their
own pin configuration just because the interactions and requirements
between device can be very complex.  I'd rather have it handled in a
single place for the whole system, but I'm not the one concentrating
on that problems space.

g.
