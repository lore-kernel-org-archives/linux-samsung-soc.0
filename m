From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH 2/3] ARM: S5P: Update machine initialization for HRT
Date: Mon, 28 Feb 2011 17:11:34 +0900
Message-ID: <000a01cbd71f$1f8ec780$5eac5680$@com>
References: <1298688357-20775-1-git-send-email-sbkim73@samsung.com>
 <1298688357-20775-3-git-send-email-sbkim73@samsung.com>
 <AANLkTinfPE5Ksbyy7bsPcKXi7Ak1mMKs9orjGrFebzdx@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51892 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752463Ab1B1ILk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Feb 2011 03:11:40 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHB0097LIREN0F0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Feb 2011 17:11:38 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.103.65])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHB00HOEIRE24@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Feb 2011 17:11:38 +0900 (KST)
In-reply-to: <AANLkTinfPE5Ksbyy7bsPcKXi7Ak1mMKs9orjGrFebzdx@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Hi kyungmin,

There is no theoretical reason for Using PWM2, 4.
You can freely use every PWM timer by calling s5p_set_timer_source(..) =
api.
But I recommend that It would be better timer4 for clocksource.
Because PWM4 doesn't have tout.

Thanks and regards,
S.B. Kim

On Saturday, February 26, 2011 1:27 PM Kyungmin Park
<kyungmin.park@samsung.com> wrote:
> To: Sangbeom Kim
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; kgene.kim@samsung.com; ben-linux@fluff.org
> Subject: Re: [PATCH 2/3] ARM: S5P: Update machine initialization for =
HRT
>=20
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>=20
> It's just curious. Are there any reason to use PWM2 & 4. Theoreticall=
y
> it's possible to use PWM2 for other purpose as it's connected with
> external devices such as haptic or PWM backlight.
>=20
> But in case of PWM3 doesn't, it's only used for internal purpose. no
> external output pin.
>=20
> I just wonder it.
> If you know the history reason, please let me know.
>=20
> Thank you,
> Kyungmin Park
>=20
> On Sat, Feb 26, 2011 at 11:45 AM, Sangbeom Kim <sbkim73@samsung.com>
wrote:
> > This patch update mach-s5p64x0 and mach-s5pv210
> > machine =A0initialization for hrt support
> >
> > Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> > ---
> > =A0arch/arm/mach-s5p64x0/mach-smdk6440.c | =A0 =A04 +++-
> > =A0arch/arm/mach-s5p64x0/mach-smdk6450.c | =A0 =A04 +++-
> > =A0arch/arm/mach-s5pv210/mach-aquila.c =A0 | =A0 =A04 +++-
> > =A0arch/arm/mach-s5pv210/mach-goni.c =A0 =A0 | =A0 =A04 +++-
> > =A0arch/arm/mach-s5pv210/mach-smdkc110.c | =A0 =A04 +++-
> > =A0arch/arm/mach-s5pv210/mach-smdkv210.c | =A0 =A04 +++-
> > =A0arch/arm/mach-s5pv210/mach-torbreck.c | =A0 =A04 +++-
> > =A07 files changed, 21 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-
> s5p64x0/mach-smdk6440.c
> > index e5beb84..f967736 100644
> > --- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
> > +++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
> > @@ -43,6 +43,7 @@
> > =A0#include <plat/pll.h>
> > =A0#include <plat/adc.h>
> > =A0#include <plat/ts.h>
> > +#include <plat/s5p-time.h>
> >
> > =A0#define SMDK6440_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0=
 =A0 =A0\
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
410_UCON_RXILEVEL | =A0 =A0 =A0 =A0 \
> > @@ -136,6 +137,7 @@ static void __init smdk6440_map_io(void)
> > =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P64X0_SYS_ID);
> > =A0 =A0 =A0 =A0s3c24xx_init_clocks(12000000);
> > =A0 =A0 =A0 =A0s3c24xx_init_uarts(smdk6440_uartcfgs,
> ARRAY_SIZE(smdk6440_uartcfgs));
> > + =A0 =A0 =A0 s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
> > =A0}
> >
> > =A0static void __init smdk6440_machine_init(void)
> > @@ -159,5 +161,5 @@ MACHINE_START(SMDK6440, "SMDK6440")
> > =A0 =A0 =A0 =A0.init_irq =A0 =A0 =A0 =3D s5p6440_init_irq,
> > =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D smdk6440_map_io,
> > =A0 =A0 =A0 =A0.init_machine =A0 =3D smdk6440_machine_init,
> > - =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s3c24xx_timer,
> > + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5p_timer,
> > =A0MACHINE_END
> > diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-
> s5p64x0/mach-smdk6450.c
> > index 3a20de0..686ec56 100644
> > --- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
> > +++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
> > @@ -43,6 +43,7 @@
> > =A0#include <plat/pll.h>
> > =A0#include <plat/adc.h>
> > =A0#include <plat/ts.h>
> > +#include <plat/s5p-time.h>
> >
> > =A0#define SMDK6450_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0=
 =A0 =A0\
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
410_UCON_RXILEVEL | =A0 =A0 =A0 =A0 \
> > @@ -155,6 +156,7 @@ static void __init smdk6450_map_io(void)
> > =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P64X0_SYS_ID);
> > =A0 =A0 =A0 =A0s3c24xx_init_clocks(19200000);
> > =A0 =A0 =A0 =A0s3c24xx_init_uarts(smdk6450_uartcfgs,
> ARRAY_SIZE(smdk6450_uartcfgs));
> > + =A0 =A0 =A0 s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
> > =A0}
> >
> > =A0static void __init smdk6450_machine_init(void)
> > @@ -178,5 +180,5 @@ MACHINE_START(SMDK6450, "SMDK6450")
> > =A0 =A0 =A0 =A0.init_irq =A0 =A0 =A0 =3D s5p6450_init_irq,
> > =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D smdk6450_map_io,
> > =A0 =A0 =A0 =A0.init_machine =A0 =3D smdk6450_machine_init,
> > - =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s3c24xx_timer,
> > + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5p_timer,
> > =A0MACHINE_END
> > diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-
> s5pv210/mach-aquila.c
> > index 557add4..fab84f3 100644
> > --- a/arch/arm/mach-s5pv210/mach-aquila.c
> > +++ b/arch/arm/mach-s5pv210/mach-aquila.c
> > @@ -39,6 +39,7 @@
> > =A0#include <plat/fb.h>
> > =A0#include <plat/fimc-core.h>
> > =A0#include <plat/sdhci.h>
> > +#include <plat/s5p-time.h>
> >
> > =A0/* Following are default values for UCON, ULCON and UFCON UART
> registers */
> > =A0#define AQUILA_UCON_DEFAULT =A0 =A0(S3C2410_UCON_TXILEVEL | =A0 =
=A0 =A0 =A0\
> > @@ -664,6 +665,7 @@ static void __init aquila_map_io(void)
> > =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> > =A0 =A0 =A0 =A0s3c24xx_init_clocks(24000000);
> > =A0 =A0 =A0 =A0s3c24xx_init_uarts(aquila_uartcfgs, ARRAY_SIZE(aquil=
a_uartcfgs));
> > + =A0 =A0 =A0 s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
> > =A0}
> >
> > =A0static void __init aquila_machine_init(void)
> > @@ -698,5 +700,5 @@ MACHINE_START(AQUILA, "Aquila")
> > =A0 =A0 =A0 =A0.init_irq =A0 =A0 =A0 =3D s5pv210_init_irq,
> > =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D aquila_map_io,
> > =A0 =A0 =A0 =A0.init_machine =A0 =3D aquila_machine_init,
> > - =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s3c24xx_timer,
> > + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5p_timer,
> > =A0MACHINE_END
> > diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-
> s5pv210/mach-goni.c
> > index 056f5c7..5eda4a1 100644
> > --- a/arch/arm/mach-s5pv210/mach-goni.c
> > +++ b/arch/arm/mach-s5pv210/mach-goni.c
> > @@ -45,6 +45,7 @@
> > =A0#include <plat/keypad.h>
> > =A0#include <plat/sdhci.h>
> > =A0#include <plat/clock.h>
> > +#include <plat/s5p-time.h>
> >
> > =A0/* Following are default values for UCON, ULCON and UFCON UART
> registers */
> > =A0#define GONI_UCON_DEFAULT =A0 =A0 =A0(S3C2410_UCON_TXILEVEL | =A0=
 =A0 =A0 =A0\
> > @@ -823,6 +824,7 @@ static void __init goni_map_io(void)
> > =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> > =A0 =A0 =A0 =A0s3c24xx_init_clocks(24000000);
> > =A0 =A0 =A0 =A0s3c24xx_init_uarts(goni_uartcfgs, ARRAY_SIZE(goni_ua=
rtcfgs));
> > + =A0 =A0 =A0 s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
> > =A0}
> >
> > =A0static void __init goni_machine_init(void)
> > @@ -873,5 +875,5 @@ MACHINE_START(GONI, "GONI")
> > =A0 =A0 =A0 =A0.init_irq =A0 =A0 =A0 =3D s5pv210_init_irq,
> > =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D goni_map_io,
> > =A0 =A0 =A0 =A0.init_machine =A0 =3D goni_machine_init,
> > - =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s3c24xx_timer,
> > + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5p_timer,
> > =A0MACHINE_END
> > diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-
> s5pv210/mach-smdkc110.c
> > index ce11a02..f304383 100644
> > --- a/arch/arm/mach-s5pv210/mach-smdkc110.c
> > +++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
> > @@ -30,6 +30,7 @@
> > =A0#include <plat/ata.h>
> > =A0#include <plat/iic.h>
> > =A0#include <plat/pm.h>
> > +#include <plat/s5p-time.h>
> >
> > =A0/* Following are default values for UCON, ULCON and UFCON UART
> registers */
> > =A0#define SMDKC110_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0=
 =A0 =A0\
> > @@ -111,6 +112,7 @@ static void __init smdkc110_map_io(void)
> > =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> > =A0 =A0 =A0 =A0s3c24xx_init_clocks(24000000);
> > =A0 =A0 =A0 =A0s3c24xx_init_uarts(smdkv210_uartcfgs,
> ARRAY_SIZE(smdkv210_uartcfgs));
> > + =A0 =A0 =A0 s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
> > =A0}
> >
> > =A0static void __init smdkc110_machine_init(void)
> > @@ -138,5 +140,5 @@ MACHINE_START(SMDKC110, "SMDKC110")
> > =A0 =A0 =A0 =A0.init_irq =A0 =A0 =A0 =3D s5pv210_init_irq,
> > =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D smdkc110_map_io,
> > =A0 =A0 =A0 =A0.init_machine =A0 =3D smdkc110_machine_init,
> > - =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s3c24xx_timer,
> > + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5p_timer,
> > =A0MACHINE_END
> > diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-
> s5pv210/mach-smdkv210.c
> > index bc9fdb5..41080bf 100644
> > --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
> > +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> > @@ -43,6 +43,7 @@
> > =A0#include <plat/keypad.h>
> > =A0#include <plat/pm.h>
> > =A0#include <plat/fb.h>
> > +#include <plat/s5p-time.h>
> >
> > =A0/* Following are default values for UCON, ULCON and UFCON UART
> registers */
> > =A0#define SMDKV210_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0=
 =A0 =A0\
> > @@ -272,6 +273,7 @@ static void __init smdkv210_map_io(void)
> > =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> > =A0 =A0 =A0 =A0s3c24xx_init_clocks(24000000);
> > =A0 =A0 =A0 =A0s3c24xx_init_uarts(smdkv210_uartcfgs,
> ARRAY_SIZE(smdkv210_uartcfgs));
> > + =A0 =A0 =A0 s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
> > =A0}
> >
> > =A0static void __init smdkv210_machine_init(void)
> > @@ -306,5 +308,5 @@ MACHINE_START(SMDKV210, "SMDKV210")
> > =A0 =A0 =A0 =A0.init_irq =A0 =A0 =A0 =3D s5pv210_init_irq,
> > =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D smdkv210_map_io,
> > =A0 =A0 =A0 =A0.init_machine =A0 =3D smdkv210_machine_init,
> > - =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s3c24xx_timer,
> > + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5p_timer,
> > =A0MACHINE_END
> > diff --git a/arch/arm/mach-s5pv210/mach-torbreck.c b/arch/arm/mach-
> s5pv210/mach-torbreck.c
> > index 043c938..b3516a1 100644
> > --- a/arch/arm/mach-s5pv210/mach-torbreck.c
> > +++ b/arch/arm/mach-s5pv210/mach-torbreck.c
> > @@ -27,6 +27,7 @@
> > =A0#include <plat/devs.h>
> > =A0#include <plat/cpu.h>
> > =A0#include <plat/iic.h>
> > +#include <plat/s5p-time.h>
> >
> > =A0/* Following are default values for UCON, ULCON and UFCON UART
> registers */
> > =A0#define TORBRECK_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0=
 =A0 =A0\
> > @@ -104,6 +105,7 @@ static void __init torbreck_map_io(void)
> > =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> > =A0 =A0 =A0 =A0s3c24xx_init_clocks(24000000);
> > =A0 =A0 =A0 =A0s3c24xx_init_uarts(torbreck_uartcfgs,
> ARRAY_SIZE(torbreck_uartcfgs));
> > + =A0 =A0 =A0 s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
> > =A0}
> >
> > =A0static void __init torbreck_machine_init(void)
> > @@ -127,5 +129,5 @@ MACHINE_START(TORBRECK, "TORBRECK")
> > =A0 =A0 =A0 =A0.init_irq =A0 =A0 =A0 =3D s5pv210_init_irq,
> > =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D torbreck_map_io,
> > =A0 =A0 =A0 =A0.init_machine =A0 =3D torbreck_machine_init,
> > - =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s3c24xx_timer,
> > + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5p_timer,
> > =A0MACHINE_END
> > --
> > 1.7.1
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-
> soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-
> soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
