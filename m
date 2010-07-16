From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2 7/8] ARM: S5PV310: Add Board support file
Date: Fri, 16 Jul 2010 19:36:44 +0900
Message-ID: <AANLkTin9JjK3VEn1klnrB6_6CI2g6G6GA2dD8BGxTiTQ@mail.gmail.com>
References: <1279270714-15146-1-git-send-email-kgene.kim@samsung.com>
	<1279270714-15146-8-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:62548 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964971Ab0GPKgp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 06:36:45 -0400
Received: by pxi14 with SMTP id 14so854936pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jul 2010 03:36:45 -0700 (PDT)
In-Reply-To: <1279270714-15146-8-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org

On Fri, Jul 16, 2010 at 5:58 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Changhwan Youn <chaos.youn@samsung.com>
>
> This patch adds Samsung SMDKV310 board support file.
>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv310/Makefile =A0 =A0 =A0 =A0| =A0 =A04 ++
> =A0arch/arm/mach-s5pv310/mach-smdkv310.c | =A0 92 +++++++++++++++++++=
++++++++++++++
> =A02 files changed, 96 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5pv310/mach-smdkv310.c
>
> diff --git a/arch/arm/mach-s5pv310/Makefile b/arch/arm/mach-s5pv310/M=
akefile
> index 1b263a5..56e7693 100644
> --- a/arch/arm/mach-s5pv310/Makefile
> +++ b/arch/arm/mach-s5pv310/Makefile
> @@ -18,3 +18,7 @@ obj-$(CONFIG_CPU_S5PV310) =A0 =A0 +=3D setup-i2c0.o=
 time.o
> =A0obj-$(CONFIG_SMP) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D platsmp.o headsm=
p.o
> =A0obj-$(CONFIG_LOCAL_TIMERS) =A0 =A0 +=3D localtimer.o
> =A0obj-$(CONFIG_HOTPLUG_CPU) =A0 =A0 =A0+=3D hotplug.o
> +
> +# machine support
> +
> +obj-$(CONFIG_MACH_SMDKV310) =A0 =A0+=3D mach-smdkv310.o
> diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.c b/arch/arm/mach-s5=
pv310/mach-smdkv310.c
> new file mode 100644
> index 0000000..0d6ab77
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/mach-smdkv310.c
> @@ -0,0 +1,92 @@
> +/* linux/arch/arm/mach-s5pv310/mach-smdkv310.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/serial_core.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach-types.h>
> +#include <asm/hardware/cache-l2x0.h>
> +
> +#include <plat/regs-serial.h>
> +#include <plat/s5pv310.h>
> +#include <plat/cpu.h>
> +
> +#include <mach/map.h>
> +
> +/* Following are default values for UCON, ULCON and UFCON UART regis=
ters */
> +#define SMDKV310_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0 =A0=
 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
410_UCON_RXILEVEL | =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
410_UCON_TXIRQMODE | =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
410_UCON_RXIRQMODE | =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
410_UCON_RXFIFO_TOI | =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
443_UCON_RXERR_IRQEN)
> +
> +#define SMDKV310_ULCON_DEFAULT S3C2410_LCON_CS8
> +
> +#define SMDKV310_UFCON_DEFAULT (S3C2410_UFCON_FIFOMODE | =A0 =A0 =A0=
 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV=
210_UFCON_TXTRIG4 | =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV=
210_UFCON_RXTRIG4)

UART supports the 16 triggers at 2/3. No need to setup the lower value.

> +
> +static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,

Please remove unused flags filed.
Previous time Mr. Shim sent the related patch.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV310_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV310_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [2] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV310_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [3] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV310_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> +};
> +
> +static void __init smdkv310_map_io(void)
> +{
> + =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> + =A0 =A0 =A0 s3c24xx_init_clocks(24000000);
> + =A0 =A0 =A0 s3c24xx_init_uarts(smdkv310_uartcfgs, ARRAY_SIZE(smdkv3=
10_uartcfgs));
> +}
> +
> +static void __init smdkv310_machine_init(void)
> +{
> +#ifdef CONFIG_CACHE_L2X0
> + =A0 =A0 =A0 l2x0_init(S5P_VA_L2CC, 1 << 28, 0xffffffff);
> +#endif
> +}
> +
> +MACHINE_START(SMDKV310, "SMDKV310")
> + =A0 =A0 =A0 /* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
> + =A0 =A0 =A0 /* Maintainer: Changhwan Youn <chaos.youn@samsung.com> =
*/
> + =A0 =A0 =A0 .phys_io =A0 =A0 =A0 =A0=3D S3C_PA_UART & 0xfff00000,
> + =A0 =A0 =A0 .io_pg_offst =A0 =A0=3D (((u32)S3C_VA_UART) >> 18) & 0x=
fffc,
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D S5P_PA_SDRAM + 0x100,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D s5pv310_init_irq,
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D smdkv310_map_io,
> + =A0 =A0 =A0 .init_machine =A0 =3D smdkv310_machine_init,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5pv310_timer,
> +MACHINE_END
> --
> 1.6.2.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
