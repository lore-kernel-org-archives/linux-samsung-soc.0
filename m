From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 11/13] ARM: S5P64X0: Move SMDK6440 board file and Add
 SMDK6450 board file
Date: Wed, 1 Sep 2010 19:00:26 +0900
Message-ID: <AANLkTikXD9xz+mGz1QabwB91WdRX1oPeeOwa-juGdt6H@mail.gmail.com>
References: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
	<1283324960-21629-12-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:53352 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751870Ab0IAKA2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 06:00:28 -0400
Received: by wyb35 with SMTP id 35so9037672wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Sep 2010 03:00:26 -0700 (PDT)
In-Reply-To: <1283324960-21629-12-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Wed, Sep 1, 2010 at 4:09 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> This patch moves smdk6440 board file from mach-s5p6440 into the new
> mach-s5p64x0 directory and adds smdk6450 board file.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0.../{mach-s5p6440 =3D> mach-s5p64x0}/mach-smdk6440.c | =A0 87 ++++=
++----
> =A0arch/arm/mach-s5p64x0/mach-smdk6450.c =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0182 ++++++++++++++++++++
> =A02 files changed, 234 insertions(+), 35 deletions(-)
> =A0rename arch/arm/{mach-s5p6440 =3D> mach-s5p64x0}/mach-smdk6440.c (=
66%)
> =A0create mode 100644 arch/arm/mach-s5p64x0/mach-smdk6450.c
>
> diff --git a/arch/arm/mach-s5p6440/mach-smdk6440.c b/arch/arm/mach-s5=
p64x0/mach-smdk6440.c
> similarity index 66%
> rename from arch/arm/mach-s5p6440/mach-smdk6440.c
> rename to arch/arm/mach-s5p64x0/mach-smdk6440.c
> index 9202aaa..28de0a5 100644
> --- a/arch/arm/mach-s5p6440/mach-smdk6440.c
> +++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
> @@ -1,7 +1,7 @@
> -/* linux/arch/arm/mach-s5p6440/mach-smdk6440.c
> +/* linux/arch/arm/mach-s5p64x0/mach-smdk6440.c
> =A0*
> - * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> - * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> =A0*
> =A0* This program is free software; you can redistribute it and/or mo=
dify
> =A0* it under the terms of the GNU General Public License version 2 a=
s
> @@ -21,21 +21,22 @@
> =A0#include <linux/io.h>
> =A0#include <linux/module.h>
> =A0#include <linux/clk.h>
> +#include <linux/gpio.h>
>
> =A0#include <asm/mach/arch.h>
> =A0#include <asm/mach/map.h>
> +#include <asm/irq.h>
> +#include <asm/mach-types.h>
>
> =A0#include <mach/hardware.h>
> =A0#include <mach/map.h>
> -
> -#include <asm/irq.h>
> -#include <asm/mach-types.h>
> +#include <mach/regs-clock.h>
> +#include <mach/i2c.h>
>
> =A0#include <plat/regs-serial.h>
> -
> +#include <plat/gpio-cfg.h>
> =A0#include <plat/s5p6440.h>
> =A0#include <plat/clock.h>
> -#include <mach/regs-clock.h>
> =A0#include <plat/devs.h>
> =A0#include <plat/cpu.h>
> =A0#include <plat/iic.h>
> @@ -58,43 +59,60 @@
>
> =A0static struct s3c2410_uartcfg smdk6440_uartcfgs[] __initdata =3D {
> =A0 =A0 =A0 =A0[0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0=3D 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =3D 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0=3D SMDK6440_UCON_=
DEFAULT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =3D SMDK6440_ULCON_D=
EFAULT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =3D SMDK6440_UFCON_D=
EFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
There's no place to use this flags, it's posted for long time. but you
don't listen it.
I hope delete it if not used.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK6440_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK6440_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK6440_=
UFCON_DEFAULT,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0[1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0=3D 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =3D 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0=3D SMDK6440_UCON_=
DEFAULT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =3D SMDK6440_ULCON_D=
EFAULT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =3D SMDK6440_UFCON_D=
EFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK6440_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK6440_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK6440_=
UFCON_DEFAULT,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0[2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0=3D 2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =3D 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0=3D SMDK6440_UCON_=
DEFAULT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =3D SMDK6440_ULCON_D=
EFAULT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =3D SMDK6440_UFCON_D=
EFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK6440_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK6440_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK6440_=
UFCON_DEFAULT,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0[3] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0=3D 3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =3D 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0=3D SMDK6440_UCON_=
DEFAULT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =3D SMDK6440_ULCON_D=
EFAULT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =3D SMDK6440_UFCON_D=
EFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK6440_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK6440_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK6440_=
UFCON_DEFAULT,
> =A0 =A0 =A0 =A0},
> =A0};
>
> =A0static struct platform_device *smdk6440_devices[] __initdata =3D {
> - =A0 =A0 =A0 &s5p6440_device_iis,
> =A0 =A0 =A0 =A0&s3c_device_adc,
> =A0 =A0 =A0 =A0&s3c_device_rtc,
> =A0 =A0 =A0 =A0&s3c_device_i2c0,
> =A0 =A0 =A0 =A0&s3c_device_i2c1,
> =A0 =A0 =A0 =A0&s3c_device_ts,
> =A0 =A0 =A0 =A0&s3c_device_wdt,
> + =A0 =A0 =A0 &s5p6440_device_iis,
> +};
> +
> +static struct s3c2410_platform_i2c s5p6440_i2c0_data __initdata =3D =
{
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 .slave_addr =A0 =A0 =3D 0x10,
> + =A0 =A0 =A0 .frequency =A0 =A0 =A0=3D 100*1000,
> + =A0 =A0 =A0 .sda_delay =A0 =A0 =A0=3D 100,
> + =A0 =A0 =A0 .cfg_gpio =A0 =A0 =A0 =3D s5p6440_i2c0_cfg_gpio,
> +};
> +
> +static struct s3c2410_platform_i2c s5p6440_i2c1_data __initdata =3D =
{
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 .bus_num =A0 =A0 =A0 =A0=3D 1,
> + =A0 =A0 =A0 .slave_addr =A0 =A0 =3D 0x10,
> + =A0 =A0 =A0 .frequency =A0 =A0 =A0=3D 100*1000,
> + =A0 =A0 =A0 .sda_delay =A0 =A0 =A0=3D 100,
> + =A0 =A0 =A0 .cfg_gpio =A0 =A0 =A0 =3D s5p6440_i2c1_cfg_gpio,
> =A0};
>
> =A0static struct i2c_board_info smdk6440_i2c_devs0[] __initdata =3D {
> @@ -113,7 +131,7 @@ static struct s3c2410_ts_mach_info s3c_ts_platfor=
m __initdata =3D {
>
> =A0static void __init smdk6440_map_io(void)
> =A0{
> - =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P_SYS_ID);
> + =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P64X0_SYS_ID);
> =A0 =A0 =A0 =A0s3c24xx_init_clocks(12000000);
> =A0 =A0 =A0 =A0s3c24xx_init_uarts(smdk6440_uartcfgs, ARRAY_SIZE(smdk6=
440_uartcfgs));
> =A0}
> @@ -122,9 +140,8 @@ static void __init smdk6440_machine_init(void)
> =A0{
> =A0 =A0 =A0 =A0s3c24xx_ts_set_platdata(&s3c_ts_platform);
>
> - =A0 =A0 =A0 /* I2C */
> - =A0 =A0 =A0 s3c_i2c0_set_platdata(NULL);
> - =A0 =A0 =A0 s3c_i2c1_set_platdata(NULL);
> + =A0 =A0 =A0 s3c_i2c0_set_platdata(&s5p6440_i2c0_data);
> + =A0 =A0 =A0 s3c_i2c1_set_platdata(&s5p6440_i2c1_data);
> =A0 =A0 =A0 =A0i2c_register_board_info(0, smdk6440_i2c_devs0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARRAY_SIZE(smdk6440_i2=
c_devs0));
> =A0 =A0 =A0 =A0i2c_register_board_info(1, smdk6440_i2c_devs1,
> @@ -135,9 +152,9 @@ static void __init smdk6440_machine_init(void)
>
> =A0MACHINE_START(SMDK6440, "SMDK6440")
> =A0 =A0 =A0 =A0/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
> - =A0 =A0 =A0 .phys_io =A0 =A0 =A0 =A0=3D S3C_PA_UART & 0xfff00000,
> + =A0 =A0 =A0 .phys_io =A0 =A0 =A0 =A0=3D S5P6440_PA_UART(0) & 0xfff0=
0000,
> =A0 =A0 =A0 =A0.io_pg_offst =A0 =A0=3D (((u32)S3C_VA_UART) >> 18) & 0=
xfffc,
> - =A0 =A0 =A0 .boot_params =A0 =A0=3D S5P_PA_SDRAM + 0x100,
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D S5P64X0_PA_SDRAM + 0x100,
>
> =A0 =A0 =A0 =A0.init_irq =A0 =A0 =A0 =3D s5p6440_init_irq,
> =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D smdk6440_map_io,
> diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5=
p64x0/mach-smdk6450.c
> new file mode 100644
> index 0000000..8e98217
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
> @@ -0,0 +1,182 @@
> +/* linux/arch/arm/mach-s5p64x0/mach-smdk6450.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/interrupt.h>
> +#include <linux/list.h>
> +#include <linux/timer.h>
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/i2c.h>
> +#include <linux/serial_core.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/clk.h>
> +#include <linux/gpio.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach/map.h>
> +#include <asm/irq.h>
> +#include <asm/mach-types.h>
> +
> +#include <mach/hardware.h>
> +#include <mach/map.h>
> +#include <mach/regs-clock.h>
> +#include <mach/i2c.h>
> +
> +#include <plat/regs-serial.h>
> +#include <plat/gpio-cfg.h>
> +#include <plat/s5p6450.h>
> +#include <plat/clock.h>
> +#include <plat/devs.h>
> +#include <plat/cpu.h>
> +#include <plat/iic.h>
> +#include <plat/pll.h>
> +#include <plat/adc.h>
> +#include <plat/ts.h>
> +
> +#define SMDK6450_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0 =A0=
 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2410=
_UCON_RXILEVEL | =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2410=
_UCON_TXIRQMODE | =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2410=
_UCON_RXIRQMODE | =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2410=
_UCON_RXFIFO_TOI | =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2443=
_UCON_RXERR_IRQEN)
> +
> +#define SMDK6450_ULCON_DEFAULT S3C2410_LCON_CS8
> +
> +#define SMDK6450_UFCON_DEFAULT (S3C2410_UFCON_FIFOMODE | =A0 =A0 =A0=
 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2440=
_UFCON_TXTRIG16 | =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2410=
_UFCON_RXTRIG8)
> +
> +static struct s3c2410_uartcfg smdk6450_uartcfgs[] __initdata =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK6450_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK6450_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [2] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK6450_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [3] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK6450_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> +#if CONFIG_SERIAL_SAMSUNG_UARTS > 4
> + =A0 =A0 =A0 [4] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK6450_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> +#endif
> +#if CONFIG_SERIAL_SAMSUNG_UARTS > 5
> + =A0 =A0 =A0 [5] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 5,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK6450_=
UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK6450_=
UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> +#endif
> +};
> +
> +static struct platform_device *smdk6450_devices[] __initdata =3D {
> + =A0 =A0 =A0 &s3c_device_adc,
> + =A0 =A0 =A0 &s3c_device_rtc,
> + =A0 =A0 =A0 &s3c_device_i2c0,
> + =A0 =A0 =A0 &s3c_device_i2c1,
> + =A0 =A0 =A0 &s3c_device_ts,
> + =A0 =A0 =A0 &s3c_device_wdt,
> + =A0 =A0 =A0 &s5p6450_device_iis0,
> + =A0 =A0 =A0 /* s5p6450_device_spi0 will be added */
> +};
> +
> +static struct s3c2410_platform_i2c s5p6450_i2c0_data __initdata =3D =
{
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 .slave_addr =A0 =A0 =3D 0x10,
> + =A0 =A0 =A0 .frequency =A0 =A0 =A0=3D 100*1000,
> + =A0 =A0 =A0 .sda_delay =A0 =A0 =A0=3D 100,
> + =A0 =A0 =A0 .cfg_gpio =A0 =A0 =A0 =3D s5p6450_i2c0_cfg_gpio,
> +};
> +
> +static struct s3c2410_platform_i2c s5p6450_i2c1_data __initdata =3D =
{
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 .bus_num =A0 =A0 =A0 =A0=3D 1,
> + =A0 =A0 =A0 .slave_addr =A0 =A0 =3D 0x10,
> + =A0 =A0 =A0 .frequency =A0 =A0 =A0=3D 100*1000,
> + =A0 =A0 =A0 .sda_delay =A0 =A0 =A0=3D 100,
> + =A0 =A0 =A0 .cfg_gpio =A0 =A0 =A0 =3D s5p6450_i2c1_cfg_gpio,
> +};
> +
> +static struct i2c_board_info smdk6450_i2c_devs0[] __initdata =3D {
> + =A0 =A0 =A0 { I2C_BOARD_INFO("24c08", 0x50), }, =A0 =A0 /* Samsung =
KS24C080C EEPROM */
> +};
> +
> +static struct i2c_board_info smdk6450_i2c_devs1[] __initdata =3D {
> + =A0 =A0 =A0 { I2C_BOARD_INFO("24c128", 0x57), },/* Samsung S524AD0X=
D1 EEPROM */
> +};
> +
> +static struct s3c2410_ts_mach_info s3c_ts_platform __initdata =3D {
> + =A0 =A0 =A0 .delay =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 10000,
> + =A0 =A0 =A0 .presc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 49,
> + =A0 =A0 =A0 .oversampling_shift =A0 =A0 =3D 2,
> +};
> +
> +static void __init smdk6450_map_io(void)
> +{
> + =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P64X0_SYS_ID);
> + =A0 =A0 =A0 s3c24xx_init_clocks(19200000);
> + =A0 =A0 =A0 s3c24xx_init_uarts(smdk6450_uartcfgs, ARRAY_SIZE(smdk64=
50_uartcfgs));
> +}
> +
> +static void __init smdk6450_machine_init(void)
> +{
> + =A0 =A0 =A0 s3c24xx_ts_set_platdata(&s3c_ts_platform);
> +
> + =A0 =A0 =A0 s3c_i2c0_set_platdata(&s5p6450_i2c0_data);
> + =A0 =A0 =A0 s3c_i2c1_set_platdata(&s5p6450_i2c1_data);
> + =A0 =A0 =A0 i2c_register_board_info(0, smdk6450_i2c_devs0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(smdk6450_i2c=
_devs0));
> + =A0 =A0 =A0 i2c_register_board_info(1, smdk6450_i2c_devs1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(smdk6450_i2c=
_devs1));
> +
> + =A0 =A0 =A0 platform_add_devices(smdk6450_devices, ARRAY_SIZE(smdk6=
450_devices));
> +}
> +
> +MACHINE_START(SMDK6450, "SMDK6450")

I think you can make a single SMDK file.
> + =A0 =A0 =A0 /* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
> + =A0 =A0 =A0 .phys_io =A0 =A0 =A0 =A0=3D S5P6450_PA_UART(0) & 0xfff0=
0000,
> + =A0 =A0 =A0 .io_pg_offst =A0 =A0=3D (((u32)S3C_VA_UART) >> 18) & 0x=
fffc,
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D S5P64X0_PA_SDRAM + 0x100,
> +
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D s5p6450_init_irq,
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D smdk6450_map_io,
> + =A0 =A0 =A0 .init_machine =A0 =3D smdk6450_machine_init,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s3c24xx_timer,
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
