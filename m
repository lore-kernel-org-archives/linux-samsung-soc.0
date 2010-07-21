From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 7/8] ARM: S5PV310: Add Board support file
Date: Wed, 21 Jul 2010 21:33:55 +0900
Message-ID: <009401cb28d0$fe7d1530$fb773f90$%kim@samsung.com>
References: <1279270714-15146-1-git-send-email-kgene.kim@samsung.com>
 <1279270714-15146-8-git-send-email-kgene.kim@samsung.com>
 <AANLkTin9JjK3VEn1klnrB6_6CI2g6G6GA2dD8BGxTiTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63744 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752476Ab0GUMdv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 08:33:51 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5W00BTFQWD5S80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Jul 2010 21:33:49 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5W00C8OQWCXI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Jul 2010 21:33:48 +0900 (KST)
In-reply-to: <AANLkTin9JjK3VEn1klnrB6_6CI2g6G6GA2dD8BGxTiTQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Changhwan Youn' <chaos.youn@samsung.com>, ben-linux@fluff.org

Kyungmin Park wrote:
>=20
> On Fri, Jul 16, 2010 at 5:58 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > From: Changhwan Youn <chaos.youn@samsung.com>
> >
> > This patch adds Samsung SMDKV310 board support file.
> >
> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/mach-s5pv310/Makefile =A0 =A0 =A0 =A0| =A0 =A04 ++
> > =A0arch/arm/mach-s5pv310/mach-smdkv310.c | =A0 92
> +++++++++++++++++++++++++++++++++
> > =A02 files changed, 96 insertions(+), 0 deletions(-)
> > =A0create mode 100644 arch/arm/mach-s5pv310/mach-smdkv310.c
> >
> > diff --git a/arch/arm/mach-s5pv310/Makefile
b/arch/arm/mach-s5pv310/Makefile
> > index 1b263a5..56e7693 100644
> > --- a/arch/arm/mach-s5pv310/Makefile
> > +++ b/arch/arm/mach-s5pv310/Makefile
> > @@ -18,3 +18,7 @@ obj-$(CONFIG_CPU_S5PV310) =A0 =A0 +=3D setup-i2c0=
=2Eo time.o
> > =A0obj-$(CONFIG_SMP) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D platsmp.o head=
smp.o
> > =A0obj-$(CONFIG_LOCAL_TIMERS) =A0 =A0 +=3D localtimer.o
> > =A0obj-$(CONFIG_HOTPLUG_CPU) =A0 =A0 =A0+=3D hotplug.o
> > +
> > +# machine support
> > +
> > +obj-$(CONFIG_MACH_SMDKV310) =A0 =A0+=3D mach-smdkv310.o
> > diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.c b/arch/arm/mach-
> s5pv310/mach-smdkv310.c
> > new file mode 100644
> > index 0000000..0d6ab77
> > --- /dev/null
> > +++ b/arch/arm/mach-s5pv310/mach-smdkv310.c
> > @@ -0,0 +1,92 @@
> > +/* linux/arch/arm/mach-s5pv310/mach-smdkv310.c
> > + *
> > + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> > + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > +*/
> > +
> > +#include <linux/serial_core.h>
> > +
> > +#include <asm/mach/arch.h>
> > +#include <asm/mach-types.h>
> > +#include <asm/hardware/cache-l2x0.h>
> > +
> > +#include <plat/regs-serial.h>
> > +#include <plat/s5pv310.h>
> > +#include <plat/cpu.h>
> > +
> > +#include <mach/map.h>
> > +
> > +/* Following are default values for UCON, ULCON and UFCON UART
registers
> */
> > +#define SMDKV310_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0 =
=A0 =A0\
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3=
C2410_UCON_RXILEVEL | =A0 =A0 =A0 =A0\
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3=
C2410_UCON_TXIRQMODE | =A0 =A0 =A0 \
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3=
C2410_UCON_RXIRQMODE | =A0 =A0 =A0 \
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3=
C2410_UCON_RXFIFO_TOI | =A0 =A0 =A0\
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3=
C2443_UCON_RXERR_IRQEN)
> > +
> > +#define SMDKV310_ULCON_DEFAULT S3C2410_LCON_CS8
> > +
> > +#define SMDKV310_UFCON_DEFAULT (S3C2410_UFCON_FIFOMODE | =A0 =A0 =A0=
 \
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5=
PV210_UFCON_TXTRIG4 | =A0 =A0 =A0 =A0\
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5=
PV210_UFCON_RXTRIG4)
>=20
> UART supports the 16 triggers at 2/3. No need to setup the lower valu=
e.
>=20
UFCON_DEFAULT is board specific UART configuration. Usually, we set the=
 Tx
and Rx FIFO trigger level at 4. It does not matter. It mainly depends o=
n the
final use of UART. If required, it can be changed later.

> > +
> > +static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata =3D {
> > + =A0 =A0 =A0 [0] =3D {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
>=20
> Please remove unused flags filed.
> Previous time Mr. Shim sent the related patch.
>=20
As far as I know, not applied yet.

> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV31=
0_UCON_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV31=
0_ULCON_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV31=
0_UFCON_DEFAULT,
> > + =A0 =A0 =A0 },
> > + =A0 =A0 =A0 [1] =3D {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 1,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV31=
0_UCON_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV31=
0_ULCON_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV31=
0_UFCON_DEFAULT,
> > + =A0 =A0 =A0 },
> > + =A0 =A0 =A0 [2] =3D {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 2,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV31=
0_UCON_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV31=
0_ULCON_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV31=
0_UFCON_DEFAULT,
> > + =A0 =A0 =A0 },
> > + =A0 =A0 =A0 [3] =3D {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 3,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV31=
0_UCON_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV31=
0_ULCON_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV31=
0_UFCON_DEFAULT,
> > + =A0 =A0 =A0 },
> > +};
> > +
> > +static void __init smdkv310_map_io(void)
> > +{
> > + =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> > + =A0 =A0 =A0 s3c24xx_init_clocks(24000000);
> > + =A0 =A0 =A0 s3c24xx_init_uarts(smdkv310_uartcfgs,
> ARRAY_SIZE(smdkv310_uartcfgs));
> > +}
> > +
> > +static void __init smdkv310_machine_init(void)
> > +{
> > +#ifdef CONFIG_CACHE_L2X0
> > + =A0 =A0 =A0 l2x0_init(S5P_VA_L2CC, 1 << 28, 0xffffffff);
> > +#endif
> > +}
> > +
> > +MACHINE_START(SMDKV310, "SMDKV310")
> > + =A0 =A0 =A0 /* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
> > + =A0 =A0 =A0 /* Maintainer: Changhwan Youn <chaos.youn@samsung.com=
> */
> > + =A0 =A0 =A0 .phys_io =A0 =A0 =A0 =A0=3D S3C_PA_UART & 0xfff00000,
> > + =A0 =A0 =A0 .io_pg_offst =A0 =A0=3D (((u32)S3C_VA_UART) >> 18) & =
0xfffc,
> > + =A0 =A0 =A0 .boot_params =A0 =A0=3D S5P_PA_SDRAM + 0x100,
> > + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D s5pv310_init_irq,
> > + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D smdkv310_map_io,
> > + =A0 =A0 =A0 .init_machine =A0 =3D smdkv310_machine_init,
> > + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5pv310_timer,
> > +MACHINE_END
> > --

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
