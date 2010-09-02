From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 12/13] ARM: S5P64X0: Add UART serial support for S5P6450
Date: Thu, 2 Sep 2010 10:43:55 +0900
Message-ID: <AANLkTimxmodJGBQbQONOx870runSEKn5S7Du8Jrsxe1n@mail.gmail.com>
References: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
	<1283324960-21629-13-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:40216 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752750Ab0IBBn4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 21:43:56 -0400
Received: by wyb35 with SMTP id 35so9972897wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Sep 2010 18:43:55 -0700 (PDT)
In-Reply-To: <1283324960-21629-13-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Wed, Sep 1, 2010 at 4:09 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> This patch adds UART serial port support for S5P6450 SoC.
> The S5P6450 has 6 UARTs, so adds resource of UART4 and UART5.
> And to fix membase which is in serial/samsung.c is from Ben Dooks.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> ---
> =A0arch/arm/plat-s5p/dev-uart.c | =A0 58 ++++++++++++++++++++++++++++=
++++++++++++++
> =A0drivers/serial/Kconfig =A0 =A0 =A0 | =A0 =A07 +++--
> =A0drivers/serial/samsung.c =A0 =A0 | =A0 =A02 +-
> =A03 files changed, 63 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/plat-s5p/dev-uart.c b/arch/arm/plat-s5p/dev-uar=
t.c
> index a89331e..6a73428 100644
> --- a/arch/arm/plat-s5p/dev-uart.c
> +++ b/arch/arm/plat-s5p/dev-uart.c
> @@ -119,6 +119,56 @@ static struct resource s5p_uart3_resource[] =3D =
{
> =A0#endif
> =A0};
>
> +static struct resource s5p_uart4_resource[] =3D {
> +#if CONFIG_SERIAL_SAMSUNG_UARTS > 4
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_UART4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_UART4 + S5P_SZ_U=
ART,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_S5P_UART_RX4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_S5P_UART_RX4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [2] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_S5P_UART_TX4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_S5P_UART_TX4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [3] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_S5P_UART_ERR4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_S5P_UART_ERR4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> + =A0 =A0 =A0 },
> +#endif
> +};
> +
> +static struct resource s5p_uart5_resource[] =3D {
> +#if CONFIG_SERIAL_SAMSUNG_UARTS > 5
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_UART5,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_UART5 + S5P_SZ_U=
ART,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_S5P_UART_RX5,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_S5P_UART_RX5,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [2] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_S5P_UART_TX5,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_S5P_UART_TX5,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [3] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_S5P_UART_ERR5,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_S5P_UART_ERR5,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> + =A0 =A0 =A0 },
> +#endif
> +};
> +
> =A0struct s3c24xx_uart_resources s5p_uart_resources[] __initdata =3D =
{
> =A0 =A0 =A0 =A0[0] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.resources =A0 =A0 =A0=3D s5p_uart0_re=
source,
> @@ -136,4 +186,12 @@ struct s3c24xx_uart_resources s5p_uart_resources=
[] __initdata =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.resources =A0 =A0 =A0=3D s5p_uart3_re=
source,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.nr_resources =A0 =3D ARRAY_SIZE(s5p_u=
art3_resource),
> =A0 =A0 =A0 =A0},
> + =A0 =A0 =A0 [4] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .resources =A0 =A0 =A0=3D s5p_uart4_res=
ource,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .nr_resources =A0 =3D ARRAY_SIZE(s5p_ua=
rt4_resource),
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [5] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .resources =A0 =A0 =A0=3D s5p_uart5_res=
ource,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .nr_resources =A0 =3D ARRAY_SIZE(s5p_ua=
rt5_resource),
> + =A0 =A0 =A0 },
> =A0};
> diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
> index 12900f7..3198c53 100644
> --- a/drivers/serial/Kconfig
> +++ b/drivers/serial/Kconfig
> @@ -458,6 +458,7 @@ config SERIAL_SAMSUNG_UARTS
> =A0 =A0 =A0 =A0int
> =A0 =A0 =A0 =A0depends on ARM && PLAT_SAMSUNG
> =A0 =A0 =A0 =A0default 2 if ARCH_S3C2400
> + =A0 =A0 =A0 default 6 if ARCH_S5P6450
> =A0 =A0 =A0 =A0default 4 if SERIAL_SAMSUNG_UARTS_4
> =A0 =A0 =A0 =A0default 3
> =A0 =A0 =A0 =A0help

How about to remove SERIAL_SAMSUNG_UARTS_4 and use the
SERIAL_SAMSUNG_UARTS only?

> @@ -526,12 +527,12 @@ config SERIAL_S3C24A0
> =A0 =A0 =A0 =A0 =A0Serial port support for the Samsung S3C24A0 SoC
>
> =A0config SERIAL_S3C6400
> - =A0 =A0 =A0 tristate "Samsung S3C6400/S3C6410/S5P6440/S5PC100 Seria=
l port support"
> - =A0 =A0 =A0 depends on SERIAL_SAMSUNG && (CPU_S3C6400 || CPU_S3C641=
0 || CPU_S5P6440 || CPU_S5PC100)
> + =A0 =A0 =A0 tristate "Samsung S3C6400/S3C6410/S5P6440/S5P6450/S5PC1=
00 Serial port support"
> + =A0 =A0 =A0 depends on SERIAL_SAMSUNG && (CPU_S3C6400 || CPU_S3C641=
0 || CPU_S5P6440 || CPU_S5P6450 || CPU_S5PC100)
> =A0 =A0 =A0 =A0select SERIAL_SAMSUNG_UARTS_4
> =A0 =A0 =A0 =A0default y
> =A0 =A0 =A0 =A0help
> - =A0 =A0 =A0 =A0 Serial port support for the Samsung S3C6400, S3C641=
0, S5P6440
> + =A0 =A0 =A0 =A0 Serial port support for the Samsung S3C6400, S3C641=
0, S5P6440, S5P6450
> =A0 =A0 =A0 =A0 =A0and S5PC100 SoCs
>
> =A0config SERIAL_S5PV210
> diff --git a/drivers/serial/samsung.c b/drivers/serial/samsung.c
> index b1156ba..7ac2bf5 100644
> --- a/drivers/serial/samsung.c
> +++ b/drivers/serial/samsung.c
> @@ -1101,7 +1101,7 @@ static int s3c24xx_serial_init_port(struct s3c2=
4xx_uart_port *ourport,
> =A0 =A0 =A0 =A0dbg("resource %p (%lx..%lx)\n", res, res->start, res->=
end);
>
> =A0 =A0 =A0 =A0port->mapbase =3D res->start;
> - =A0 =A0 =A0 port->membase =3D S3C_VA_UART + res->start - (S3C_PA_UA=
RT & 0xfff00000);
> + =A0 =A0 =A0 port->membase =3D S3C_VA_UART + (res->start & 0xfffff);
> =A0 =A0 =A0 =A0ret =3D platform_get_irq(platdev, 0);
> =A0 =A0 =A0 =A0if (ret < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0port->irq =3D 0;
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
