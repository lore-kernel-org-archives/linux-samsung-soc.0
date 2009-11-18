From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 09/19] drivers: serial: add support for Samsung S5PC110
	SoC uart
Date: Wed, 18 Nov 2009 23:14:52 +0900
Message-ID: <1b68c6790911180614y355f656fs828177ecc845ec8e@mail.gmail.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
	 <1258551194-16018-10-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f180.google.com ([209.85.216.180]:55383 "EHLO
	mail-px0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753780AbZKROOt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Nov 2009 09:14:49 -0500
Received: by pxi10 with SMTP id 10so830615pxi.33
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2009 06:14:55 -0800 (PST)
In-Reply-To: <1258551194-16018-10-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org

On Wed, Nov 18, 2009 at 10:33 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
>
> Samsung S5PC110 SoCs have UART that differs a bit from the one known
> from the previous Samsung SoCs. This patch adds support for this new
> driver.
>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
>
> ---
> =C2=A0arch/arm/plat-s3c/include/plat/regs-serial.h | =C2=A0 31 ++++++
> =C2=A0drivers/serial/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A07 ++
> =C2=A0drivers/serial/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0drivers/serial/s5pc110.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0143 ++++++++++++++++++++++++++
> =C2=A04 files changed, 182 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 drivers/serial/s5pc110.c
>
> diff --git a/arch/arm/plat-s3c/include/plat/regs-serial.h b/arch/arm/=
plat-s3c/include/plat/regs-serial.h
> index 66af75a..910cfba 100644
> --- a/arch/arm/plat-s3c/include/plat/regs-serial.h
> +++ b/arch/arm/plat-s3c/include/plat/regs-serial.h
> @@ -194,6 +194,37 @@
> =C2=A0#define S3C64XX_UINTSP =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x34
> =C2=A0#define S3C64XX_UINTM =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x38
>
> +/* S5PC110 UCON */
> +#define S5PC110_UCON_CLKMASK =C2=A0 (1<<10)
> +#define S5PC110_UCON_PCLK =C2=A0 =C2=A0 =C2=A0(0<<10)
> +#define S5PC110_UCON_SCLK_UART (1<<10)
> +
> +/* S5PC110 FIFO trigger levels */
> +#define S5PC110_UFCON_RXTRIG1 =C2=A0(0<<4)
> +#define S5PC110_UFCON_RXTRIG4 =C2=A0(1<<4)
> +#define S5PC110_UFCON_RXTRIG8 =C2=A0(2<<4)
> +#define S5PC110_UFCON_RXTRIG16 (3<<4)
> +#define S5PC110_UFCON_RXTRIG32 (4<<4)
> +#define S5PC110_UFCON_RXTRIG64 (5<<4)
> +#define S5PC110_UFCON_RXTRIG128 =C2=A0 =C2=A0 =C2=A0 =C2=A0(6<<4)
> +#define S5PC110_UFCON_RXTRIG256 =C2=A0 =C2=A0 =C2=A0 =C2=A0(7<<4)
> +
> +#define S5PC110_UFCON_TXTRIG1 =C2=A0(0<<8)
> +#define S5PC110_UFCON_TXTRIG4 =C2=A0(1<<8)
> +#define S5PC110_UFCON_TXTRIG8 =C2=A0(2<<8)
> +#define S5PC110_UFCON_TXTRIG16 (3<<8)
> +#define S5PC110_UFCON_TXTRIG32 (4<<8)
> +#define S5PC110_UFCON_TXTRIG64 (5<<8)
> +#define S5PC110_UFCON_TXTRIG128 =C2=A0 =C2=A0 =C2=A0 =C2=A0(6<<8)
> +#define S5PC110_UFCON_TXTRIG256 =C2=A0 =C2=A0 =C2=A0 =C2=A0(7<<8)
> +
> +#define S5PC110_UFSTAT_TXFULL =C2=A0(1<<24)
> +#define S5PC110_UFSTAT_RXFULL =C2=A0(1<<8)
> +#define S5PC110_UFSTAT_TXSHIFT (16)
> +#define S5PC110_UFSTAT_RXSHIFT (0)
> +#define S5PC110_UFSTAT_TXMASK =C2=A0(255<<16)
> +#define S5PC110_UFSTAT_RXMASK =C2=A0(255)
> +
> =C2=A0#ifndef __ASSEMBLY__
>
> =C2=A0/* struct s3c24xx_uart_clksrc
> diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
> index e522572..d119cac 100644
> --- a/drivers/serial/Kconfig
> +++ b/drivers/serial/Kconfig
> @@ -540,6 +540,13 @@ config SERIAL_S5PC100
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Serial port support for the Samsung=
 S5PC100 SoCs
>
> +config SERIAL_S5PC110
> + =C2=A0 =C2=A0 =C2=A0 tristate "Samsung S5PC110 Serial port support"
> + =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_SAMSUNG && CPU_S5PC110
> + =C2=A0 =C2=A0 =C2=A0 default y
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Serial port support for the Samsung S5P=
C110 SoCs
> +
> =C2=A0config SERIAL_MAX3100
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "MAX3100 support"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on SPI
> diff --git a/drivers/serial/Makefile b/drivers/serial/Makefile
> index d21d5dd..43d6123 100644
> --- a/drivers/serial/Makefile
> +++ b/drivers/serial/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_SERIAL_S3C2440) +=3D s3c2440.o
> =C2=A0obj-$(CONFIG_SERIAL_S3C24A0) +=3D s3c24a0.o
> =C2=A0obj-$(CONFIG_SERIAL_S3C6400) +=3D s3c6400.o
> =C2=A0obj-$(CONFIG_SERIAL_S5PC100) +=3D s3c6400.o
> +obj-$(CONFIG_SERIAL_S5PC110) +=3D s5pc110.o
> =C2=A0obj-$(CONFIG_SERIAL_MAX3100) +=3D max3100.o
> =C2=A0obj-$(CONFIG_SERIAL_IP22_ZILOG) +=3D ip22zilog.o
> =C2=A0obj-$(CONFIG_SERIAL_MUX) +=3D mux.o
> diff --git a/drivers/serial/s5pc110.c b/drivers/serial/s5pc110.c
> new file mode 100644
> index 0000000..1e1e229
> --- /dev/null
> +++ b/drivers/serial/s5pc110.c
> @@ -0,0 +1,143 @@
> +/*
> + * linux/drivers/serial/s5pc110.c
> + *
> + * Driver for Samsung S5PC110 SoC onboard UARTs.
> + *
> + * =C2=A0Copyright 2009 Samsung Electronics
> + * =C2=A0Kyungin Park <kyungmin.park@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/ioport.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/init.h>
> +#include <linux/serial_core.h>
> +#include <linux/serial.h>
> +
> +#include <asm/irq.h>
> +#include <mach/hardware.h>
> +
> +#include <plat/regs-serial.h>
> +
> +#include "samsung.h"
> +
> +static int s5pc110_serial_setsource(struct uart_port *port,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct s3c24xx_uart_c=
lksrc *clk)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long ucon =3D rd_regl(port, S3C2410_U=
CON);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (strcmp(clk->name, "uclk0") =3D=3D 0)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ucon |=3D S5PC110_=
UCON_SCLK_UART;
> + =C2=A0 =C2=A0 =C2=A0 else if (strcmp(clk->name, "pclk") =3D=3D 0)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* See notes about=
 transitioning from UCLK to PCLK */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ucon &=3D ~S5PC110=
_UCON_SCLK_UART;
> + =C2=A0 =C2=A0 =C2=A0 else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "u=
nknown clock source %s\n", clk->name);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 wr_regl(port, S3C2410_UCON, ucon);
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
Not just about this c110 patch: I think this string comparison thing
isn't very neat.
I think we'd better be doing it by indexing into an array of clock
names(which can be
defined in some platform specific code).

> +static int s5pc110_serial_getsource(struct uart_port *port,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct s3c24xx_uart_c=
lksrc *clk)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 ucon =3D rd_regl(port, S3C2410_UCON);
> +
> + =C2=A0 =C2=A0 =C2=A0 clk->divisor =3D 1;
> +
> + =C2=A0 =C2=A0 =C2=A0 switch (ucon & S5PC110_UCON_CLKMASK) {
> + =C2=A0 =C2=A0 =C2=A0 case S5PC110_UCON_SCLK_UART:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk->name =3D "ucl=
k0";
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> +
> + =C2=A0 =C2=A0 =C2=A0 case S5PC110_UCON_PCLK:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk->name =3D "pcl=
k";
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static int s5pc110_serial_resetport(struct uart_port *port,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct s3c2410_uartcf=
g *cfg)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long ucon =3D rd_regl(port, S3C2410_U=
CON);
> +
> + =C2=A0 =C2=A0 =C2=A0 dbg("s5pc110_serial_resetport: port=3D%p (%08l=
x), cfg=3D%p\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port, port->mapbase, cfg);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* ensure we don't change the clock settings..=
=2E */
> +
> + =C2=A0 =C2=A0 =C2=A0 ucon &=3D S5PC110_UCON_CLKMASK;
> +
> + =C2=A0 =C2=A0 =C2=A0 wr_regl(port, S3C2410_UCON, =C2=A0ucon | cfg->=
ucon);
> + =C2=A0 =C2=A0 =C2=A0 wr_regl(port, S3C2410_ULCON, cfg->ulcon);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* reset both fifos */
> +
> + =C2=A0 =C2=A0 =C2=A0 wr_regl(port, S3C2410_UFCON, cfg->ufcon | S3C2=
410_UFCON_RESETBOTH);
> + =C2=A0 =C2=A0 =C2=A0 wr_regl(port, S3C2410_UFCON, cfg->ufcon);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static struct s3c24xx_uart_info s5pc110_uart_inf =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "=
Samsung S5PC110 UART",
> + =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D P=
ORT_S3C6400,
> + =C2=A0 =C2=A0 =C2=A0 .fifosize =C2=A0 =C2=A0 =C2=A0 =3D 16,
> + =C2=A0 =C2=A0 =C2=A0 .has_divslot =C2=A0 =C2=A0=3D 1,
> + =C2=A0 =C2=A0 =C2=A0 .rx_fifomask =C2=A0 =C2=A0=3D S5PC110_UFSTAT_R=
XMASK,
> + =C2=A0 =C2=A0 =C2=A0 .rx_fifoshift =C2=A0 =3D S5PC110_UFSTAT_RXSHIF=
T,
> + =C2=A0 =C2=A0 =C2=A0 .rx_fifofull =C2=A0 =C2=A0=3D S5PC110_UFSTAT_R=
XFULL,
> + =C2=A0 =C2=A0 =C2=A0 .tx_fifofull =C2=A0 =C2=A0=3D S5PC110_UFSTAT_T=
XFULL,
> + =C2=A0 =C2=A0 =C2=A0 .tx_fifomask =C2=A0 =C2=A0=3D S5PC110_UFSTAT_T=
XMASK,
> + =C2=A0 =C2=A0 =C2=A0 .tx_fifoshift =C2=A0 =3D S5PC110_UFSTAT_TXSHIF=
T,
> + =C2=A0 =C2=A0 =C2=A0 .get_clksrc =C2=A0 =C2=A0 =3D s5pc110_serial_g=
etsource,
> + =C2=A0 =C2=A0 =C2=A0 .set_clksrc =C2=A0 =C2=A0 =3D s5pc110_serial_s=
etsource,
> + =C2=A0 =C2=A0 =C2=A0 .reset_port =C2=A0 =C2=A0 =3D s5pc110_serial_r=
esetport,
> +};
> +
> +/* device management */
> +
> +static int s5pc110_serial_probe(struct platform_device *dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 dbg("s5pc110_serial_probe: dev=3D%p\n", dev);
> +
> + =C2=A0 =C2=A0 =C2=A0 return s3c24xx_serial_probe(dev, &s5pc110_uart=
_inf);
> +}
> +
> +static struct platform_driver s5pc110_serial_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .probe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s=
5pc110_serial_probe,
> + =C2=A0 =C2=A0 =C2=A0 .remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(s3c24xx_serial_remove),
> + =C2=A0 =C2=A0 =C2=A0 .driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =3D "=
s5pc110-uart",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =C2=A0=3D T=
HIS_MODULE,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +s3c24xx_console_init(&s5pc110_serial_driver, &s5pc110_uart_inf);
> +
> +static int __init s5pc110_serial_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return s3c24xx_serial_init(&s5pc110_serial_dri=
ver, &s5pc110_uart_inf);
> +}
> +
> +static void __exit s5pc110_serial_exit(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&s5pc110_serial_dri=
ver);
> +}
> +
> +module_init(s5pc110_serial_init);
> +module_exit(s5pc110_serial_exit);
> +
> +MODULE_DESCRIPTION("Samsung S5PC110 SoC Serial port driver");
> +MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:s5pc110-uart");
> --
> 1.6.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
