From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v4] ARM: S5PV310: Add Samsung UNIVERSAL_C210 support
Date: Sat, 7 Aug 2010 10:46:08 +0900
Message-ID: <AANLkTikqvxyBQcYshY+P7ERDhQEb_uJqOjp6wS4MCkvz@mail.gmail.com>
References: <1281096865-27885-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:38881 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752510Ab0HGBqK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Aug 2010 21:46:10 -0400
Received: by wwj40 with SMTP id 40so9765588wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Aug 2010 18:46:09 -0700 (PDT)
In-Reply-To: <1281096865-27885-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Fri, Aug 6, 2010 at 9:14 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> From: Kyungmin Park <kyungmin.park@samsung.com>
>
> This patch adds Samsung Mobile S5PC210 Reference Board, UNIVERSAL_C21=
0 board
> support.
>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> [kgene.kim@samsung.com: changed machine name]
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Kyungmin,
> Maybe as you know, should be changed all universal_ functions when ad=
ding
> other universal board for avoiding confusing later. And need this so =
that
> we can support single kernel image in future. Thanks.

Keep in mind. but as you see other universal patches. it's almost
static variables do don't make a problem when other universal board
comes.
Yes. some time later it needs to change the name, but current samsung
socs has each SoCs directory so it also don't make a problem.

Thank you,
Kyungmin Park
>
> NOTE:
> Changes since v3:
> - Changed only machine name not functions based on v1 patch
>
> Changes since v2:
> - Changed machine name from 'UNIVERSAL' to 'UNIVERSAL_C210'
>
> Changes since v1:
> - Changed default UFCON tx/rx trigger level
>
> =A0arch/arm/mach-s5pv310/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
9 +++
> =A0arch/arm/mach-s5pv310/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 +
> =A0arch/arm/mach-s5pv310/mach-universal_c210.c | =A0 86 +++++++++++++=
++++++++++++++
> =A03 files changed, 96 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5pv310/mach-universal_c210.c
>
> diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kc=
onfig
> index f9b1892..331b5bd 100644
> --- a/arch/arm/mach-s5pv310/Kconfig
> +++ b/arch/arm/mach-s5pv310/Kconfig
> @@ -33,4 +33,13 @@ config MACH_SMDKV310
> =A0 =A0 =A0 =A0select ARCH_SPARSEMEM_ENABLE
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKV310
> +
> +config MACH_UNIVERSAL_C210
> + =A0 =A0 =A0 bool "Mobile UNIVERSAL_C210 Board"
> + =A0 =A0 =A0 select CPU_S5PV310
> + =A0 =A0 =A0 select ARCH_SPARSEMEM_ENABLE
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Machine support for Samsung Mobile Universal S5PC21=
0 Reference
> + =A0 =A0 =A0 =A0 Board. S5PC210(MCP) is one of package option of S5P=
V310
> +
> =A0endif
> diff --git a/arch/arm/mach-s5pv310/Makefile b/arch/arm/mach-s5pv310/M=
akefile
> index 967e2c8..d5b51c7 100644
> --- a/arch/arm/mach-s5pv310/Makefile
> +++ b/arch/arm/mach-s5pv310/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_HOTPLUG_CPU) =A0 =A0 +=3D hotplug.o
> =A0# machine support
>
> =A0obj-$(CONFIG_MACH_SMDKV310) =A0 =A0+=3D mach-smdkv310.o
> +obj-$(CONFIG_MACH_UNIVERSAL_C210) =A0 =A0 =A0+=3D mach-universal_c21=
0.o
>
> =A0# device support
>
> diff --git a/arch/arm/mach-s5pv310/mach-universal_c210.c b/arch/arm/m=
ach-s5pv310/mach-universal_c210.c
> new file mode 100644
> index 0000000..2388cb9
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/mach-universal_c210.c
> @@ -0,0 +1,86 @@
> +/* linux/arch/arm/mach-s5pv310/mach-universal_c210.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
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
> +#define UNIVERSAL_UCON_DEFAULT (S3C2410_UCON_TXILEVEL | =A0 =A0 =A0 =
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
> +#define UNIVERSAL_ULCON_DEFAULT =A0 =A0 =A0 =A0S3C2410_LCON_CS8
> +
> +#define UNIVERSAL_UFCON_DEFAULT =A0 =A0 =A0 =A0(S3C2410_UFCON_FIFOMO=
DE | =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV=
210_UFCON_TXTRIG256 | =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV=
210_UFCON_RXTRIG256)
> +
> +static struct s3c2410_uartcfg universal_uartcfgs[] __initdata =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D UNIVERSAL=
_UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D UNIVERSAL=
_ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D UNIVERSAL=
_UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D UNIVERSAL=
_UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D UNIVERSAL=
_ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D UNIVERSAL=
_UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [2] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D UNIVERSAL=
_UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D UNIVERSAL=
_ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D UNIVERSAL=
_UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [3] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D UNIVERSAL=
_UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D UNIVERSAL=
_ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D UNIVERSAL=
_UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> +};
> +
> +static void __init universal_map_io(void)
> +{
> + =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> + =A0 =A0 =A0 s3c24xx_init_clocks(24000000);
> + =A0 =A0 =A0 s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(unive=
rsal_uartcfgs));
> +}
> +
> +static void __init universal_machine_init(void)
> +{
> +#ifdef CONFIG_CACHE_L2X0
> + =A0 =A0 =A0 l2x0_init(S5P_VA_L2CC, 1 << 28, 0xffffffff);
> +#endif
> +}
> +
> +MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
> + =A0 =A0 =A0 /* Maintainer: Kyungmin Park <kyungmin.park@samsung.com=
> */
> + =A0 =A0 =A0 .phys_io =A0 =A0 =A0 =A0=3D S3C_PA_UART & 0xfff00000,
> + =A0 =A0 =A0 .io_pg_offst =A0 =A0=3D (((u32)S3C_VA_UART) >> 18) & 0x=
fffc,
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D S5P_PA_SDRAM + 0x100,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D s5pv310_init_irq,
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D universal_map_io,
> + =A0 =A0 =A0 .init_machine =A0 =3D universal_machine_init,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5pv310_timer,
> +MACHINE_END
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
