From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH/RFC 1/2] serial: samsung: Add support for of_earlycon
Date: Thu, 25 Sep 2014 04:12:06 +0530
Message-ID: <CAGOxZ50Hr-pSqBDmoGBTC4i4H8h8L_2TkU=3c27JtJ8QZr+CcA@mail.gmail.com>
References: <1411391655-6291-1-git-send-email-m.szyprowski@samsung.com> <1411391655-6291-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:54163 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750793AbaIXWmr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Sep 2014 18:42:47 -0400
Received: by mail-yk0-f171.google.com with SMTP id 79so3061312ykr.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2014 15:42:47 -0700 (PDT)
In-Reply-To: <1411391655-6291-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thomas P Abraham <thomas.ab@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>

Hi Marek

On Mon, Sep 22, 2014 at 6:44 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> From: Tomasz Figa <t.figa@samsung.com>
>
> This patch adds support for early console initialized from device tree
> to all variants of Samsung serial driver.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/tty/serial/Kconfig   |  1 +
>  drivers/tty/serial/samsung.c | 97 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 98 insertions(+)
>
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 26cec64dadd7..e87a2dfd9080 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -222,6 +222,7 @@ config SERIAL_SAMSUNG
>         tristate "Samsung SoC serial support"
>         depends on PLAT_SAMSUNG
>         select SERIAL_CORE
> +       select SERIAL_EARLYCON
Ideally this should be selected by SERIAL_SAMSUNG_CONSOLE.
But this is also fine.
>         help
>           Support for the on-chip UARTs on the Samsung S3C24XX series CPUs,
>           providing /dev/ttySAC0, 1 and 2 (note, some machines may not
> diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
> index c78f43a481ce..71829ce2410d 100644
> --- a/drivers/tty/serial/samsung.c
> +++ b/drivers/tty/serial/samsung.c
> @@ -1856,6 +1856,103 @@ static struct platform_driver samsung_serial_driver = {
>
>  module_platform_driver(samsung_serial_driver);
>
> +/*
> + * Early console.
> + */
> +
> +struct samsung_early_console_data {
> +       u32 txfull_mask;
> +};
> +
> +static void samsung_early_busyuart(struct uart_port *port)
> +{
> +       while (!(readl(port->membase + S3C2410_UTRSTAT) & S3C2410_UTRSTAT_TXFE))
> +               ;
> +}
> +
> +static void samsung_early_busyuart_fifo(struct uart_port *port)
> +{
> +       struct samsung_early_console_data *data = port->private_data;
> +
> +       while (readl(port->membase + S3C2410_UFSTAT) & data->txfull_mask)
> +               ;
> +}
> +
> +static void samsung_early_putc(struct uart_port *port, int c)
> +{
> +       if (readl(port->membase + S3C2410_UFCON) & S3C2410_UFCON_FIFOMODE)
> +               samsung_early_busyuart_fifo(port);
> +       else
> +               samsung_early_busyuart(port);
> +
> +       writeb(c, port->membase + S3C2410_UTXH);
> +}
> +
> +static void samsung_early_write(struct console *con, const char *s, unsigned n)
> +{
> +       struct earlycon_device *dev = con->data;
> +
> +       uart_console_write(&dev->port, s, n, samsung_early_putc);
> +}
> +
> +static int __init samsung_early_console_setup(struct earlycon_device *device,
> +                                             const char *opt)
> +{
> +       if (!device->port.membase)
> +               return -ENODEV;
> +
> +       device->con->write = samsung_early_write;
> +       return 0;
> +}
> +
> +/* S3C2410, S3C2412 */
Probably you should move S3C2412 below along with S3C64xx, see your
OF_EARLYCON_DECLARE below.
> +static struct samsung_early_console_data s3c2410_early_console_data = {
> +       .txfull_mask = S3C2410_UFSTAT_TXFULL,
> +};
> +
> +static int __init s3c2410_early_console_setup(struct earlycon_device *device,
> +                                             const char *opt)
> +{
> +       device->port.private_data = &s3c2410_early_console_data;
> +       return samsung_early_console_setup(device, opt);
> +}
> +OF_EARLYCON_DECLARE(s3c2410, "samsung,s3c2410-uart",
> +                       s3c2410_early_console_setup);
> +
> +/* S3C2440, S3C64xx */
> +static struct samsung_early_console_data s3c2440_early_console_data = {
> +       .txfull_mask = S3C2440_UFSTAT_TXFULL,
> +};
> +
> +static int __init s3c2440_early_console_setup(struct earlycon_device *device,
> +                                             const char *opt)
> +{
> +       device->port.private_data = &s3c2440_early_console_data;
> +       return samsung_early_console_setup(device, opt);
> +}
> +OF_EARLYCON_DECLARE(s3c2412, "samsung,s3c2412-uart",
> +                       s3c2440_early_console_setup);
> +OF_EARLYCON_DECLARE(s3c2440, "samsung,s3c2440-uart",
> +                       s3c2440_early_console_setup);
> +OF_EARLYCON_DECLARE(s3c6400, "samsung,s3c6400-uart",
> +                       s3c2440_early_console_setup);
> +
> +/* S5PV210, EXYNOS */
> +static struct samsung_early_console_data s5pv210_early_console_data = {
> +       .txfull_mask = S5PV210_UFSTAT_TXFULL,
> +};
> +
> +static int __init s5pv210_early_console_setup(struct earlycon_device *device,
> +                                             const char *opt)
> +{
> +       device->port.private_data = &s5pv210_early_console_data;
> +       return samsung_early_console_setup(device, opt);
> +}
> +OF_EARLYCON_DECLARE(s5pv210, "samsung,s5pv210-uart",
> +                       s5pv210_early_console_setup);
> +OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos4210-uart",
> +                       s5pv210_early_console_setup);
Please support command line earlycon support also for all type.
You just need EARLYCON_DECLARE(exynos4210,
s5pv210_early_console_setup); for exynos4210.

> +
>  MODULE_ALIAS("platform:samsung-uart");
>  MODULE_DESCRIPTION("Samsung SoC Serial port driver");
>  MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
> --
> 1.9.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Regards,
Alim
