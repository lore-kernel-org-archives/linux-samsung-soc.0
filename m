From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 8/8] ARM: S5PV310: Add serial port support
Date: Thu, 1 Jul 2010 18:52:06 +0900
Message-ID: <AANLkTikBCj7XGXz5peuaNL4XQ5JGXqp_o8QJAC31ssbg@mail.gmail.com>
References: <1277476037-8806-1-git-send-email-kgene.kim@samsung.com>
	<1277476037-8806-9-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:37626 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751927Ab0GAJwI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Jul 2010 05:52:08 -0400
Received: by pwi5 with SMTP id 5so77973pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Jul 2010 02:52:06 -0700 (PDT)
In-Reply-To: <1277476037-8806-9-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org

Hi,

As previous description. it's also same except the udivslot
calculation and clock selection.
How about to just modify current v210 serial codes by just adding the
V310 or C210 type?

Thank you,
Kyungmin Park

On Fri, Jun 25, 2010 at 11:27 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> From: Changhwan Youn <chaos.youn@samsung.com>
>
> This patch adds UART serial port support for S5PV310 CPU.
>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0drivers/serial/Kconfig =A0 | =A0 =A08 +++
> =A0drivers/serial/Makefile =A0| =A0 =A01 +
> =A0drivers/serial/s5pv310.c | =A0124 ++++++++++++++++++++++++++++++++=
++++++++++++++
> =A03 files changed, 133 insertions(+), 0 deletions(-)
> =A0create mode 100644 drivers/serial/s5pv310.c
>
> diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
> index 8b23165..b5ff41f 100644
> --- a/drivers/serial/Kconfig
> +++ b/drivers/serial/Kconfig
> @@ -550,6 +550,14 @@ config SERIAL_S5PV210
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Serial port support for Samsung's S5P Family of So=
C's
>
> +config SERIAL_S5PV310
> + =A0 =A0 =A0 tristate "Samsung S5PV310 Serial port support"
> + =A0 =A0 =A0 depends on SERIAL_SAMSUNG && CPU_S5PV310
> + =A0 =A0 =A0 select SERIAL_SAMSUNG_UARTS_4
> + =A0 =A0 =A0 default y
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Serial port support for Samsung's S5P Family of SoC=
's
> +
> =A0config SERIAL_MAX3100
> =A0 =A0 =A0 =A0tristate "MAX3100 support"
> =A0 =A0 =A0 =A0depends on SPI
> diff --git a/drivers/serial/Makefile b/drivers/serial/Makefile
> index 208a855..bd32d3f 100644
> --- a/drivers/serial/Makefile
> +++ b/drivers/serial/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_SERIAL_S3C2440) +=3D s3c2440.o
> =A0obj-$(CONFIG_SERIAL_S3C24A0) +=3D s3c24a0.o
> =A0obj-$(CONFIG_SERIAL_S3C6400) +=3D s3c6400.o
> =A0obj-$(CONFIG_SERIAL_S5PV210) +=3D s5pv210.o
> +obj-$(CONFIG_SERIAL_S5PV310) +=3D s5pv310.o
> =A0obj-$(CONFIG_SERIAL_MAX3100) +=3D max3100.o
> =A0obj-$(CONFIG_SERIAL_IP22_ZILOG) +=3D ip22zilog.o
> =A0obj-$(CONFIG_SERIAL_MUX) +=3D mux.o
> diff --git a/drivers/serial/s5pv310.c b/drivers/serial/s5pv310.c
> new file mode 100644
> index 0000000..1d466cf
> --- /dev/null
> +++ b/drivers/serial/s5pv310.c
> @@ -0,0 +1,124 @@
> +/* linux/drivers/serial/s5pv310.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Based on drivers/serial/s5pv210.c
> + *
> + * Driver for Samsung S5PV310 SoC UARTs.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/module.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/serial_core.h>
> +
> +#include <plat/regs-serial.h>
> +#include "samsung.h"
> +
> +static int s5pv310_serial_setsource(struct uart_port *port,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 struct s3c24xx_uart_clksrc *clk)
> +{
> + =A0 =A0 =A0 /* for s5pv310, serial clock source is only uclk1 */
> + =A0 =A0 =A0 return 0;
> +};
> +
> +static int s5pv310_serial_getsource(struct uart_port *port,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 struct s3c24xx_uart_clksrc *clk)
> +{
> + =A0 =A0 =A0 /* for s5pv310, serial clock source is only uclk1 */
> + =A0 =A0 =A0 clk->divisor =3D 1;
> + =A0 =A0 =A0 clk->name =3D "uclk1";
> + =A0 =A0 =A0 return 0;
> +};
> +
> +static int s5pv310_serial_resetport(struct uart_port *port,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 struct s3c2410_uartcfg *cfg)
> +{
> + =A0 =A0 =A0 wr_regl(port, S3C2410_UCON, =A0cfg->ucon);
> + =A0 =A0 =A0 wr_regl(port, S3C2410_ULCON, cfg->ulcon);
> +
> + =A0 =A0 =A0 /* reset both fifos */
> + =A0 =A0 =A0 wr_regl(port, S3C2410_UFCON, cfg->ufcon | S3C2410_UFCON=
_RESETBOTH);
> + =A0 =A0 =A0 wr_regl(port, S3C2410_UFCON, cfg->ufcon);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +#define S5PV310_UART_DEFAULT_INFO(fifo_size) =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "Samsung =
S5PV310 UART", =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D PORT_S3C6=
400, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .fifosize =A0 =A0 =A0 =3D fifo_size, =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .has_fracval =A0 =A0=3D 1, =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rx_fifomask =A0 =A0=3D S5PV210_UFSTAT_=
RXMASK, =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rx_fifoshift =A0 =3D S5PV210_UFSTAT_RX=
SHIFT, =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rx_fifofull =A0 =A0=3D S5PV210_UFSTAT_=
RXFULL, =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .tx_fifofull =A0 =A0=3D S5PV210_UFSTAT_=
TXFULL, =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .tx_fifomask =A0 =A0=3D S5PV210_UFSTAT_=
TXMASK, =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .tx_fifoshift =A0 =3D S5PV210_UFSTAT_TX=
SHIFT, =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .get_clksrc =A0 =A0 =3D s5pv310_serial_=
getsource, =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .set_clksrc =A0 =A0 =3D s5pv310_serial_=
setsource, =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reset_port =A0 =A0 =3D s5pv310_serial_=
resetport
> +
> +static struct s3c24xx_uart_info s5p_port_fifo256 =3D {
> + =A0 =A0 =A0 S5PV310_UART_DEFAULT_INFO(256),
> +};
> +
> +static struct s3c24xx_uart_info s5p_port_fifo64 =3D {
> + =A0 =A0 =A0 S5PV310_UART_DEFAULT_INFO(64),
> +};
> +
> +static struct s3c24xx_uart_info s5p_port_fifo16 =3D {
> + =A0 =A0 =A0 S5PV310_UART_DEFAULT_INFO(16),
> +};
> +
> +struct s3c24xx_uart_info *s5p_uart_inf[] =3D {
> + =A0 =A0 =A0 [0] =3D &s5p_port_fifo256,
> + =A0 =A0 =A0 [1] =3D &s5p_port_fifo64,
> + =A0 =A0 =A0 [2] =3D &s5p_port_fifo16,
> + =A0 =A0 =A0 [3] =3D &s5p_port_fifo16,
> +};
> +
> +/* device management */
> +static int s5p_serial_probe(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 return s3c24xx_serial_probe(pdev, s5p_uart_inf[pdev->id=
]);
> +}
> +
> +static struct platform_driver s5p_serial_driver =3D {
> + =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D s5p_serial_probe,
> + =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D __devexit_p(s3c24xx_serial_=
remove),
> + =A0 =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "s5pv310-uart",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 },
> +};
> +
> +static int __init s5pv310_serial_console_init(void)
> +{
> + =A0 =A0 =A0 return s3c24xx_serial_initconsole(&s5p_serial_driver, s=
5p_uart_inf);
> +}
> +
> +console_initcall(s5pv310_serial_console_init);
> +
> +static int __init s5p_serial_init(void)
> +{
> + =A0 =A0 =A0 return s3c24xx_serial_init(&s5p_serial_driver, *s5p_uar=
t_inf);
> +}
> +
> +static void __exit s5p_serial_exit(void)
> +{
> + =A0 =A0 =A0 platform_driver_unregister(&s5p_serial_driver);
> +}
> +
> +module_init(s5p_serial_init);
> +module_exit(s5p_serial_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:s5pv310-uart");
> +MODULE_DESCRIPTION("Samsung S5PV310 UART Driver support");
> +MODULE_AUTHOR("Changhwan Youn <chaos.youn@samsung.com>");
> --
> 1.6.2.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
