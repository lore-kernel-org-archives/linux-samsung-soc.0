From: Pichon Julien <pichon.jln@gmail.com>
Subject: Re: [PATCH] Add poll_get_char & poll_put_char to uart_ops for the
 samsung UARTS.
Date: Sat, 25 Feb 2012 12:05:56 +0100
Message-ID: <CAHQa92Vjwh3gtME2u19EZz57My3H7R=fQK4CoJR9s_ktpsy_Ww@mail.gmail.com>
References: <20120212182201.GA17975@debian>
	<CAHQa92X=9kiVhxCspcAR+dK-NbFqaUW2xTCjjDOAHGfDx_yMBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:52724 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755674Ab2BYLF5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Feb 2012 06:05:57 -0500
Received: by vbbff1 with SMTP id ff1so2840vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Feb 2012 03:05:56 -0800 (PST)
In-Reply-To: <CAHQa92X=9kiVhxCspcAR+dK-NbFqaUW2xTCjjDOAHGfDx_yMBQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com

> (please CC me in your replies as I am not suscribed to the ML)
>
> The following patch allows users to use KGDB over serial console on
> board based on Samsung SOC. It has been tested on a mini2440.
>
> Signed-off-by: Julien Pichon <pichon.jln@gmail.com>
> ---
> =A0drivers/tty/serial/samsung.c | =A0 50 ++++++++++++++++++++++++++++=
++++++++++++++
> =A01 files changed, 50 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsun=
g.c
> index f96f37b..9f703ca 100644
> --- a/drivers/tty/serial/samsung.c
> +++ b/drivers/tty/serial/samsung.c
> @@ -877,11 +877,24 @@ s3c24xx_serial_verify_port(struct uart_port *po=
rt, struct serial_struct *ser)
>
> =A0static struct console s3c24xx_serial_console;
>
> +static int __init s3c24xx_serial_console_init(void)
> +{
> + =A0 =A0 register_console(&s3c24xx_serial_console);
> + =A0 =A0 return 0;
> +}
> +console_initcall(s3c24xx_serial_console_init);
> +
> =A0#define S3C24XX_SERIAL_CONSOLE &s3c24xx_serial_console
> =A0#else
> =A0#define S3C24XX_SERIAL_CONSOLE NULL
> =A0#endif
>
> +#ifdef CONFIG_CONSOLE_POLL
> +static int s3c24xx_serial_get_poll_char(struct uart_port *port);
> +static void s3c24xx_serial_put_poll_char(struct uart_port *port,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned char c);
> +#endif
> +
> =A0static struct uart_ops s3c24xx_serial_ops =3D {
> =A0 =A0 =A0 .pm =A0 =A0 =A0 =A0 =A0 =A0 =3D s3c24xx_serial_pm,
> =A0 =A0 =A0 .tx_empty =A0 =A0 =A0 =3D s3c24xx_serial_tx_empty,
> @@ -900,6 +913,10 @@ static struct uart_ops s3c24xx_serial_ops =3D {
> =A0 =A0 =A0 .request_port =A0 =3D s3c24xx_serial_request_port,
> =A0 =A0 =A0 .config_port =A0 =A0=3D s3c24xx_serial_config_port,
> =A0 =A0 =A0 .verify_port =A0 =A0=3D s3c24xx_serial_verify_port,
> +#ifdef CONFIG_CONSOLE_POLL
> + =A0 =A0 .poll_get_char =3D s3c24xx_serial_get_poll_char,
> + =A0 =A0 .poll_put_char =3D s3c24xx_serial_put_poll_char,
> +#endif
> =A0};
>
> =A0static struct uart_driver s3c24xx_uart_drv =3D {
> @@ -1311,6 +1328,39 @@ s3c24xx_serial_console_txrdy(struct uart_port =
*port, unsigned int ufcon)
> =A0 =A0 =A0 return (utrstat & S3C2410_UTRSTAT_TXE) ? 1 : 0;
> =A0}
>
> +#ifdef CONFIG_CONSOLE_POLL
> +/*
> + * Console polling routines for writing and reading from the uart wh=
ile
> + * in an interrupt or debug context.
> + */
> +
> +static int s3c24xx_serial_get_poll_char(struct uart_port *port)
> +{
> + =A0 =A0 struct s3c24xx_uart_port *ourport =3D to_ourport(port);
> + =A0 =A0 unsigned int ufstat, count;
> +
> + =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 ufstat =3D rd_regl(port, S3C2410_UFSTAT);
> + =A0 =A0 =A0 =A0 =A0 =A0 count =3D s3c24xx_serial_rx_fifocnt(ourport=
, ufstat);
> + =A0 =A0 =A0 =A0 =A0 =A0 if (!count)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_relax();
> + =A0 =A0 } while (!count);
> +
> + =A0 =A0 return rd_regb(port, S3C2410_URXH);
> +}
> +
> +static void s3c24xx_serial_put_poll_char(struct uart_port *port,
> + =A0 =A0 =A0 =A0 =A0 =A0 unsigned char c)
> +{
> + =A0 =A0 unsigned int ufcon =3D rd_regl(cons_uart, S3C2410_UFCON);
> +
> + =A0 =A0 while (!s3c24xx_serial_console_txrdy(port, ufcon))
> + =A0 =A0 =A0 =A0 =A0 =A0 cpu_relax();
> + =A0 =A0 wr_regb(cons_uart, S3C2410_UTXH, c);
> +}
> +
> +#endif /* CONFIG_CONSOLE_POLL */
> +
> =A0static void
> =A0s3c24xx_serial_console_putchar(struct uart_port *port, int ch)
> =A0{
> --
> 1.7.2.5
>
>
(CC maintainers)
Someone has time to review this patch ?
