From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: S5PV210: Add Torbreck board support
Date: Mon, 27 Sep 2010 11:58:44 +0900
Message-ID: <AANLkTik5SkqjEz5Ymtg6RvwfrU0i8XzhPQq3Un7gMbP=@mail.gmail.com>
References: <1285463130-14227-1-git-send-email-chlrbgh0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:59893 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932621Ab0I0C6w convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 26 Sep 2010 22:58:52 -0400
Received: by wwd20 with SMTP id 20so149567wwd.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Sep 2010 19:58:51 -0700 (PDT)
In-Reply-To: <1285463130-14227-1-git-send-email-chlrbgh0@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyuho Choi <chlrbgh0@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, Hyunchul Ko <ghcstop@gmail.com>

Hi,

Looks good to me except minor fixup.

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Sun, Sep 26, 2010 at 10:05 AM, Kyuho Choi <chlrbgh0@gmail.com> wrote=
:
> This patch adds to support Torbreck board of aESOP community using
> Samsung S5PV210 SoC.
>
> Signed-off-by: Kyuho Choi <chlrbgh0@gmail.com>
> Signed-off-by: Hyunchul Ko <ghcstop@gmail.com>
> ---
> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 | =A0 18 +++++
> =A0arch/arm/mach-s5pv210/Makefile =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0arch/arm/mach-s5pv210/mach-torbreck.c | =A0133 +++++++++++++++++++=
++++++++++++++
> =A03 files changed, 152 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5pv210/mach-torbreck.c
>
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kc=
onfig
> index d3a3895..c5ec466 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -139,6 +139,24 @@ config MACH_SMDKV210
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKV210
>
> +config MACH_TORBRECK
> + =A0 =A0 =A0 bool "Torbreck"
> + =A0 =A0 =A0 select CPU_S5PV210
> + =A0 =A0 =A0 select ARCH_SPARSEMEM_ENABLE
> + =A0 =A0 =A0 select S3C_DEV_HSMMC
> + =A0 =A0 =A0 select S3C_DEV_HSMMC1
> + =A0 =A0 =A0 select S3C_DEV_HSMMC2
> + =A0 =A0 =A0 select S3C_DEV_HSMMC3
> + =A0 =A0 =A0 select S3C_DEV_I2C1
> + =A0 =A0 =A0 select S3C_DEV_I2C2
> + =A0 =A0 =A0 select S3C_DEV_RTC
> + =A0 =A0 =A0 select S3C_DEV_WDT
> + =A0 =A0 =A0 select S5PV210_SETUP_I2C1
> + =A0 =A0 =A0 select S5PV210_SETUP_I2C2
> + =A0 =A0 =A0 select S5PV210_SETUP_SDHCI
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Machine support for aESOP Torbreck
Just question. Does it TDROID board?
> +
> =A0endmenu
>
> =A0endif
> diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/M=
akefile
> index 05048c5..927c2b7 100644
> --- a/arch/arm/mach-s5pv210/Makefile
> +++ b/arch/arm/mach-s5pv210/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_MACH_AQUILA) =A0 =A0 +=3D mach-aquila.=
o
> =A0obj-$(CONFIG_MACH_SMDKV210) =A0 =A0+=3D mach-smdkv210.o
> =A0obj-$(CONFIG_MACH_SMDKC110) =A0 =A0+=3D mach-smdkc110.o
> =A0obj-$(CONFIG_MACH_GONI) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D mach-g=
oni.o
> +obj-$(CONFIG_MACH_TORBRECK) =A0 =A0+=3D mach-torbreck.o
>
> =A0# device support
>
> diff --git a/arch/arm/mach-s5pv210/mach-torbreck.c b/arch/arm/mach-s5=
pv210/mach-torbreck.c
> new file mode 100644
> index 0000000..3142250
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/mach-torbreck.c
> @@ -0,0 +1,133 @@
> +/* linux/arch/arm/mach-s5pv210/mach-torbreck.c
> + *
> + * Copyright (c) 2010 aESOP Community
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.aesop.or.kr/
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/serial_core.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach/map.h>
> +#include <asm/setup.h>
> +#include <asm/mach-types.h>
> +
> +#include <mach/map.h>
> +#include <mach/regs-clock.h>
> +
> +#include <plat/regs-serial.h>
> +#include <plat/s5pv210.h>
> +#include <plat/devs.h>
> +#include <plat/cpu.h>
> +#include <plat/iic.h>
> +
> +/* Following are default values for UCON, ULCON and UFCON UART regis=
ters */
> +#define TORBRECK_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0 =A0=
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
> +#define TORBRECK_ULCON_DEFAULT S3C2410_LCON_CS8
> +
> +#define TORBRECK_UFCON_DEFAULT (S3C2410_UFCON_FIFOMODE | =A0 =A0 =A0=
 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV=
210_UFCON_TXTRIG4 | =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV=
210_UFCON_RXTRIG4)

Any reason to use TRIG4? just use the full trigger e.g., 256.
> +
> +static struct s3c2410_uartcfg torbreck_uartcfgs[] __initdata =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
There's no code for flags, please remove it all.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D TORBRECK_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D TORBRECK_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D TORBRECK_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D TORBRECK_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D TORBRECK_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D TORBRECK_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [2] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D TORBRECK_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D TORBRECK_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D TORBRECK_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [3] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D TORBRECK_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D TORBRECK_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D TORBRECK_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> +};
> +
> +static struct platform_device *torbreck_devices[] __initdata =3D {
> + =A0 =A0 =A0 &s5pv210_device_iis0,
> + =A0 =A0 =A0 &s3c_device_cfcon,
> + =A0 =A0 =A0 &s3c_device_hsmmc0,
> + =A0 =A0 =A0 &s3c_device_hsmmc1,
> + =A0 =A0 =A0 &s3c_device_hsmmc2,
> + =A0 =A0 =A0 &s3c_device_hsmmc3,
> + =A0 =A0 =A0 &s3c_device_i2c0,
> + =A0 =A0 =A0 &s3c_device_i2c1,
> + =A0 =A0 =A0 &s3c_device_i2c2,
> + =A0 =A0 =A0 &s3c_device_rtc,
> + =A0 =A0 =A0 &s3c_device_wdt,
> +};
> +
> +static struct i2c_board_info torbreck_i2c_devs0[] __initdata =3D {
> + =A0 =A0 =A0 /* To Be Updated */
> +};
> +
> +static struct i2c_board_info torbreck_i2c_devs1[] __initdata =3D {
> + =A0 =A0 =A0 /* To Be Updated */
> +};
> +
> +static struct i2c_board_info torbreck_i2c_devs2[] __initdata =3D {
> + =A0 =A0 =A0 /* To Be Updated */
> +};
> +
> +static void __init torbreck_map_io(void)
> +{
> + =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> + =A0 =A0 =A0 s3c24xx_init_clocks(24000000);
> + =A0 =A0 =A0 s3c24xx_init_uarts(torbreck_uartcfgs, ARRAY_SIZE(torbre=
ck_uartcfgs));
> +}
> +
> +static void __init torbreck_machine_init(void)
> +{
> + =A0 =A0 =A0 s3c_i2c0_set_platdata(NULL);
> + =A0 =A0 =A0 s3c_i2c1_set_platdata(NULL);
> + =A0 =A0 =A0 s3c_i2c2_set_platdata(NULL);
> + =A0 =A0 =A0 i2c_register_board_info(0, torbreck_i2c_devs0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(torbreck_i2c=
_devs0));
> + =A0 =A0 =A0 i2c_register_board_info(1, torbreck_i2c_devs1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(torbreck_i2c=
_devs1));
> + =A0 =A0 =A0 i2c_register_board_info(2, torbreck_i2c_devs2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(torbreck_i2c=
_devs2));
> +
> + =A0 =A0 =A0 platform_add_devices(torbreck_devices, ARRAY_SIZE(torbr=
eck_devices));
> +}
> +
> +MACHINE_START(TORBRECK, "TORBRECK")
> + =A0 =A0 =A0 /* Maintainer: Hyunchul Ko <ghcstop@gmail.com> */
> + =A0 =A0 =A0 .phys_io =A0 =A0 =A0 =A0=3D S3C_PA_UART & 0xfff00000,
> + =A0 =A0 =A0 .io_pg_offst =A0 =A0=3D (((u32)S3C_VA_UART) >> 18) & 0x=
fffc,
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D S5P_PA_SDRAM + 0x100,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D s5pv210_init_irq,
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D torbreck_map_io,
> + =A0 =A0 =A0 .init_machine =A0 =3D torbreck_machine_init,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s3c24xx_timer,
> +MACHINE_END
> --
> 1.5.6.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
