From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/2] i2c-s3c2410: Rework device type handling
Date: Mon, 12 Mar 2012 11:28:16 +0530
Message-ID: <CAJuYYwRDb-NvOzpzWtV8erw8UZeHjBUDUPjm-Cg0GTz6BCCV5w@mail.gmail.com>
References: <1331312686-2077-1-git-send-email-k.lewandowsk@samsung.com>
	<1331312686-2077-2-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:45214 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753200Ab2CLF6R convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Mar 2012 01:58:17 -0400
Received: by vcqp1 with SMTP id p1so3782786vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Mar 2012 22:58:16 -0700 (PDT)
In-Reply-To: <1331312686-2077-2-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Karol Lewandowski <k.lewandowsk@samsung.com>
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, t.stanislaws@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

On 9 March 2012 22:34, Karol Lewandowski <k.lewandowsk@samsung.com> wro=
te:
> Reorganize driver a bit to better handle device tree-based systems:
>
> =A0- move machine type to driver's private structure instead of
> =A0 quering platform device variants in runtime
>
> =A0- replace s3c24xx_i2c_type enum with plain unsigned int that can
> =A0 hold not only device type but also hw revision-specific quirks
>
> Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =A0drivers/i2c/busses/i2c-s3c2410.c | =A0 56 +++++++++++++-----------=
-------------
> =A01 files changed, 20 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2=
c-s3c2410.c
> index 737f721..5b400c6 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -44,8 +44,12 @@
> =A0#include <plat/regs-iic.h>
> =A0#include <plat/iic.h>
>
> -/* i2c controller state */
> +/* type */
> +#define TYPE_BITS =A0 =A0 =A0 =A0 =A0 =A0 =A00x000000ff
> +#define TYPE_S3C2410 =A0 =A0 =A0 =A0 =A0 0x00000001
> +#define TYPE_S3C2440 =A0 =A0 =A0 =A0 =A0 0x00000002
>
> +/* i2c controller state */
> =A0enum s3c24xx_i2c_state {
> =A0 =A0 =A0 =A0STATE_IDLE,
> =A0 =A0 =A0 =A0STATE_START,
> @@ -54,14 +58,10 @@ enum s3c24xx_i2c_state {
> =A0 =A0 =A0 =A0STATE_STOP
> =A0};
>
> -enum s3c24xx_i2c_type {
> - =A0 =A0 =A0 TYPE_S3C2410,
> - =A0 =A0 =A0 TYPE_S3C2440,
> -};
> -
> =A0struct s3c24xx_i2c {
> =A0 =A0 =A0 =A0spinlock_t =A0 =A0 =A0 =A0 =A0 =A0 =A0lock;
> =A0 =A0 =A0 =A0wait_queue_head_t =A0 =A0 =A0 wait;
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0type;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0suspended:1;
>
> =A0 =A0 =A0 =A0struct i2c_msg =A0 =A0 =A0 =A0 =A0*msg;
> @@ -88,28 +88,6 @@ struct s3c24xx_i2c {
> =A0#endif
> =A0};
>
> -/* default platform data removed, dev should always carry data. */
> -
> -/* s3c24xx_i2c_is2440()
> - *
> - * return true is this is an s3c2440
> -*/
> -
> -static inline int s3c24xx_i2c_is2440(struct s3c24xx_i2c *i2c)
> -{
> - =A0 =A0 =A0 struct platform_device *pdev =3D to_platform_device(i2c=
->dev);
> - =A0 =A0 =A0 enum s3c24xx_i2c_type type;
> -
> -#ifdef CONFIG_OF
> - =A0 =A0 =A0 if (i2c->dev->of_node)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return of_device_is_compatible(i2c->dev=
->of_node,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "samsun=
g,s3c2440-i2c");
> -#endif
> -
> - =A0 =A0 =A0 type =3D platform_get_device_id(pdev)->driver_data;
> - =A0 =A0 =A0 return type =3D=3D TYPE_S3C2440;
> -}
> -
> =A0/* s3c24xx_i2c_master_complete
> =A0*
> =A0* complete the message and wake up the caller, using the given ret=
urn code,
> @@ -676,7 +654,7 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i=
2c *i2c, unsigned int *got)
>
> =A0 =A0 =A0 =A0writel(iiccon, i2c->regs + S3C2410_IICCON);
>
> - =A0 =A0 =A0 if (s3c24xx_i2c_is2440(i2c)) {
> + =A0 =A0 =A0 if (i2c->type & TYPE_S3C2440) {

This should be changed to
if (i2c->type =3D=3D TYPE_S3C2440)

> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long sda_delay;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pdata->sda_delay) {
> @@ -847,6 +825,8 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i=
2c)
> =A0}
>
> =A0#ifdef CONFIG_OF
> +static const struct of_device_id s3c24xx_i2c_match[];
> +
> =A0/* s3c24xx_i2c_parse_dt
> =A0*
> =A0* Parse the device tree node and retreive the platform data.
> @@ -856,11 +836,16 @@ static void
> =A0s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c *i=
2c)
> =A0{
> =A0 =A0 =A0 =A0struct s3c2410_platform_i2c *pdata =3D i2c->pdata;
> + =A0 =A0 =A0 const struct of_device_id *match;
>
> =A0 =A0 =A0 =A0if (!np)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
> =A0 =A0 =A0 =A0pdata->bus_num =3D -1; /* i2c bus number is dynamicall=
y assigned */
> +
> + =A0 =A0 =A0 match =3D of_match_node(&s3c24xx_i2c_match[0], np);

This could be
match =3D of_match_node(s3c24xx_i2c_match, np);

> + =A0 =A0 =A0 i2c->type =3D (unsigned int)match->data;
> +

This function (s3c24xx_i2c_parse_dt) is intended to retrieve the data
from i2c device node. It would be better to not add the determination
of the i2c type inside this function.

> =A0 =A0 =A0 =A0of_property_read_u32(np, "samsung,i2c-sda-delay", &pda=
ta->sda_delay);
> =A0 =A0 =A0 =A0of_property_read_u32(np, "samsung,i2c-slave-addr", &pd=
ata->slave_addr);
> =A0 =A0 =A0 =A0of_property_read_u32(np, "samsung,i2c-max-bus-freq",
> @@ -906,9 +891,10 @@ static int s3c24xx_i2c_probe(struct platform_dev=
ice *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_noclk;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 if (pdata)
> + =A0 =A0 =A0 if (pdata) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(i2c->pdata, pdata, sizeof(*pdat=
a));
> - =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->type =3D platform_get_device_id(pd=
ev)->driver_data;
> + =A0 =A0 =A0 } else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c24xx_i2c_parse_dt(pdev->dev.of_node=
, i2c);

It would be better to move the task of retrieving the driver data to a
separate function. An example of this listed below (copied from the
samsung uart driver).

static inline struct s3c24xx_serial_drv_data *s3c24xx_get_driver_data(
                        struct platform_device *pdev)
{
#ifdef CONFIG_OF
        if (pdev->dev.of_node) {
                const struct of_device_id *match;
                match =3D of_match_node(s3c24xx_uart_dt_match, pdev->de=
v.of_node);
                return (struct s3c24xx_serial_drv_data *)match->data;
        }
#endif
        return (struct s3c24xx_serial_drv_data *)
                        platform_get_device_id(pdev)->driver_data;
}

>
> =A0 =A0 =A0 =A0strlcpy(i2c->adap.name, "s3c2410-i2c", sizeof(i2c->ada=
p.name));
> @@ -1123,13 +1109,11 @@ MODULE_DEVICE_TABLE(platform, s3c24xx_driver_=
ids);
>
> =A0#ifdef CONFIG_OF
> =A0static const struct of_device_id s3c24xx_i2c_match[] =3D {
> - =A0 =A0 =A0 { .compatible =3D "samsung,s3c2410-i2c" },
> - =A0 =A0 =A0 { .compatible =3D "samsung,s3c2440-i2c" },
> + =A0 =A0 =A0 { .compatible =3D "samsung,s3c2410-i2c", .data =3D (voi=
d *)TYPE_S3C2410 },
> + =A0 =A0 =A0 { .compatible =3D "samsung,s3c2440-i2c", .data =3D (voi=
d *)TYPE_S3C2440 },
> =A0 =A0 =A0 =A0{},
> =A0};
> =A0MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
> -#else
> -#define s3c24xx_i2c_match NULL
> =A0#endif
>
> =A0static struct platform_driver s3c24xx_i2c_driver =3D {
> @@ -1140,7 +1124,7 @@ static struct platform_driver s3c24xx_i2c_drive=
r =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-i2c",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pm =A0 =A0 =3D S3C24XX_DEV_PM_OPS,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D s3c24xx_i2c_match,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(s3c24x=
x_i2c_match),

Should this change be a separate patch?

Thanks,
Thomas.
