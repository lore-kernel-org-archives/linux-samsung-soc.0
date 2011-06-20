From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/6] serial: samsung: Keep a copy of platform data in
 driver's private data
Date: Mon, 20 Jun 2011 09:54:58 -0600
Message-ID: <BANLkTikLfbiL0ZpLiysA6qUxv8sj-AVS+A@mail.gmail.com>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org> <1308567752-13451-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:63751 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751356Ab1FTPzT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 11:55:19 -0400
Received: by gyh3 with SMTP id 3so1445099gyh.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2011 08:55:18 -0700 (PDT)
In-Reply-To: <1308567752-13451-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Mon, Jun 20, 2011 at 5:02 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> The driver depends on pdev->dev.platform_data to retrive information
> about the platform data even after the initialization. To add device
> tree support, this has to be changed in way that the platform data
> is avialable from driver's private data. This patch adds support
> for keeping a copy of the plaform data in s3c24xx_uart_info and using
> it when needed after the initialization.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> =A0drivers/tty/serial/s5pv210.c | =A0 12 ++++++++++--
> =A0drivers/tty/serial/samsung.c | =A0 24 ++++++++++++++++++++----
> =A0drivers/tty/serial/samsung.h | =A0 =A04 +++-
> =A03 files changed, 33 insertions(+), 7 deletions(-)

Hi Thomas.

Don't forget you need to cc Alan Cox and the linux-serial mailing list
for tty driver patches.

Comments below...

>
> diff --git a/drivers/tty/serial/s5pv210.c b/drivers/tty/serial/s5pv21=
0.c
> index d6b2423..3b2021a 100644
> --- a/drivers/tty/serial/s5pv210.c
> +++ b/drivers/tty/serial/s5pv210.c
> @@ -27,9 +27,13 @@
> =A0static int s5pv210_serial_setsource(struct uart_port *port,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0struct s3c24xx_uart_clksrc *clk)
> =A0{
> - =A0 =A0 =A0 struct s3c2410_uartcfg *cfg =3D port->dev->platform_dat=
a;
> + =A0 =A0 =A0 struct s3c24xx_uart_port *ourport;
> + =A0 =A0 =A0 struct s3c2410_uartcfg *cfg;
> =A0 =A0 =A0 =A0unsigned long ucon =3D rd_regl(port, S3C2410_UCON);
>
> + =A0 =A0 =A0 ourport =3D container_of(port, struct s3c24xx_uart_port=
, port);
> + =A0 =A0 =A0 cfg =3D &ourport->info->cfg;
> +
> =A0 =A0 =A0 =A0if ((cfg->clocks_size) =3D=3D 1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> @@ -50,9 +54,13 @@ static int s5pv210_serial_setsource(struct uart_po=
rt *port,
> =A0static int s5pv210_serial_getsource(struct uart_port *port,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0struct s3c24xx_uart_clksrc *clk)
> =A0{
> - =A0 =A0 =A0 struct s3c2410_uartcfg *cfg =3D port->dev->platform_dat=
a;
> + =A0 =A0 =A0 struct s3c24xx_uart_port *ourport;
> + =A0 =A0 =A0 struct s3c2410_uartcfg *cfg;
> =A0 =A0 =A0 =A0u32 ucon =3D rd_regl(port, S3C2410_UCON);
>
> + =A0 =A0 =A0 ourport =3D container_of(port, struct s3c24xx_uart_port=
, port);
> + =A0 =A0 =A0 cfg =3D &ourport->info->cfg;
> +
> =A0 =A0 =A0 =A0clk->divisor =3D 1;
>
> =A0 =A0 =A0 =A0if ((cfg->clocks_size) =3D=3D 1)
> diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsun=
g.c
> index 7ead421..77d900f 100644
> --- a/drivers/tty/serial/samsung.c
> +++ b/drivers/tty/serial/samsung.c
> @@ -42,6 +42,7 @@
> =A0#include <linux/delay.h>
> =A0#include <linux/clk.h>
> =A0#include <linux/cpufreq.h>
> +#include <linux/slab.h>
>
> =A0#include <asm/irq.h>
>
> @@ -169,10 +170,13 @@ static inline struct s3c24xx_uart_info *s3c24xx=
_port_to_info(struct uart_port *p
>
> =A0static inline struct s3c2410_uartcfg *s3c24xx_port_to_cfg(struct u=
art_port *port)
> =A0{
> + =A0 =A0 =A0 struct s3c24xx_uart_port *ourport;
> +
> =A0 =A0 =A0 =A0if (port->dev =3D=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>
> - =A0 =A0 =A0 return (struct s3c2410_uartcfg *)port->dev->platform_da=
ta;
> + =A0 =A0 =A0 ourport =3D container_of(port, struct s3c24xx_uart_port=
, port);
> + =A0 =A0 =A0 return &ourport->info->cfg;
> =A0}
>
> =A0static int s3c24xx_serial_rx_fifocnt(struct s3c24xx_uart_port *our=
port,
> @@ -1053,7 +1057,7 @@ static int s3c24xx_serial_init_port(struct s3c2=
4xx_uart_port *ourport,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
struct platform_device *platdev)
> =A0{
> =A0 =A0 =A0 =A0struct uart_port *port =3D &ourport->port;
> - =A0 =A0 =A0 struct s3c2410_uartcfg *cfg;
> + =A0 =A0 =A0 struct s3c2410_uartcfg *cfg =3D platdev->dev.platform_d=
ata;
> =A0 =A0 =A0 =A0struct resource *res;
> =A0 =A0 =A0 =A0int ret;
>
> @@ -1062,14 +1066,24 @@ static int s3c24xx_serial_init_port(struct s3=
c24xx_uart_port *ourport,
> =A0 =A0 =A0 =A0if (platdev =3D=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
>
> - =A0 =A0 =A0 cfg =3D s3c24xx_dev_to_cfg(&platdev->dev);
> -
> =A0 =A0 =A0 =A0if (port->mapbase !=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> + =A0 =A0 =A0 if (cfg) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy((void *)&info->cfg, cfg, sizeof(=
struct s3c2410_uartcfg));

"info->cfg =3D *cfg;" should be sufficient.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->cfg.clocks =3D kzalloc(sizeof(str=
uct s3c24xx_uart_clksrc) *
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 cfg->clocks_size, GFP_KERNEL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!info->cfg.clocks)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(info->cfg.clocks, cfg->clocks,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(struct s3c24xx_u=
art_clksrc) * cfg->clocks_size);
> + =A0 =A0 =A0 }

ewwh. There has to be a better way to do this.  Part of the point of
putting a copy of pdata into the private data structure is to simplify
the driver so that kzallocing wouldn't be necessary.  With that clock
table, the driver actually gets more complex because both DT and
non-DT paths now need to kzalloc a clock array.

=46rom what I can tell, the list of clocks on all mainlined platforms i=
s
a static array of one or two entries; min & max baud are always set to
0, and names are one of:
- uclk & pclk
- uclk
- uclk1
- fclk (with divisor either 10 or 0)
- pclk_low & uclk1

You could also make the clock structure a static array of 2 elements
in the private data structure.  That would simplify both this code and
the followon DT patch.

Also, peaking forward at what the 2nd patch does, I think that it
might just be a little premature to try and decode the clock info from
the DT.  But I'll address that issue when replying to the second
patch.

> +
> + =A0 =A0 =A0 cfg =3D &info->cfg;
> =A0 =A0 =A0 =A0if (cfg->hwport > CONFIG_SERIAL_SAMSUNG_UARTS) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "%s: port %d bigger th=
an %d\n", __func__,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->hwport, CONFIG_SERIA=
L_SAMSUNG_UARTS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(info->cfg.clocks);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ERANGE;
> =A0 =A0 =A0 =A0}
>
> @@ -1181,11 +1195,13 @@ EXPORT_SYMBOL_GPL(s3c24xx_serial_probe);
> =A0int __devexit s3c24xx_serial_remove(struct platform_device *dev)
> =A0{
> =A0 =A0 =A0 =A0struct uart_port *port =3D s3c24xx_dev_to_port(&dev->d=
ev);
> + =A0 =A0 =A0 struct s3c24xx_uart_info *info =3D s3c24xx_port_to_info=
(port);
>
> =A0 =A0 =A0 =A0if (port) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c24xx_serial_cpufreq_deregister(to_o=
urport(port));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device_remove_file(&dev->dev, &dev_att=
r_clock_source);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uart_remove_one_port(&s3c24xx_uart_drv=
, port);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(info->cfg.clocks);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0return 0;
> diff --git a/drivers/tty/serial/samsung.h b/drivers/tty/serial/samsun=
g.h
> index a69d9a5..4f2f6f5 100644
> --- a/drivers/tty/serial/samsung.h
> +++ b/drivers/tty/serial/samsung.h
> @@ -24,6 +24,9 @@ struct s3c24xx_uart_info {
>
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0has_divslot:1;
>
> + =A0 =A0 =A0 /* copy of platform data */

I'd change this to "copy of /configuration/ data" since the data
doesn't necessarily come from the platform_data pointer anymore.

> + =A0 =A0 =A0 struct s3c2410_uartcfg =A0cfg;
> +
> =A0 =A0 =A0 =A0/* clock source control */
>
> =A0 =A0 =A0 =A0int (*get_clksrc)(struct uart_port *, struct s3c24xx_u=
art_clksrc *clk);
> @@ -56,7 +59,6 @@ struct s3c24xx_uart_port {
> =A0/* conversion functions */
>
> =A0#define s3c24xx_dev_to_port(__dev) (struct uart_port *)dev_get_drv=
data(__dev)
> -#define s3c24xx_dev_to_cfg(__dev) (struct s3c2410_uartcfg *)((__dev)=
->platform_data)
>
> =A0/* register access controls */
>
> --
> 1.6.6.rc2
>
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
