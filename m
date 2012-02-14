From: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-s3c2410: Convert to devm_kzalloc()
Date: Tue, 14 Feb 2012 18:33:02 +0530
Message-ID: <CAM=Q2cv7JjCaYQFFtGmEXwN7yeQHWh3tDMac_Bq4v8oe2K+j1Q@mail.gmail.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327152527-11364-1-git-send-email-broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

The changes look good to me.
Reviewed-by: Datta Shubhrajyoti <shubhrajyoti-l0cyMroinI0@public.gmane.org>
=46or your changes.

Some other doubts though not related to your patch.
Just curious.

On Sat, Jan 21, 2012 at 6:58 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> Saves remembering to call kfree(). There's some kfree()s used by the
> resource still, these will be removed in 3.3 using the newly added
> devm_request_and_ioremap().
>
> Signed-off-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
> =A0drivers/i2c/busses/i2c-s3c2410.c | =A0 =A04 +---
> =A01 files changed, 1 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2=
c-s3c2410.c
> index 4c17180..e6f982b 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -890,7 +890,7 @@ static int s3c24xx_i2c_probe(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 i2c =3D kzalloc(sizeof(struct s3c24xx_i2c), GFP_KERNEL)=
;
> + =A0 =A0 =A0 i2c =3D devm_kzalloc(&pdev->dev, sizeof(struct s3c24xx_=
i2c), GFP_KERNEL);
> =A0 =A0 =A0 =A0if (!i2c) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&pdev->dev, "no memory for sta=
te\n");

The comment looks confusing as I am not sure what is meant here by stat=
e.


> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> @@ -1035,7 +1035,6 @@ static int s3c24xx_i2c_probe(struct platform_de=
vice *pdev)
> =A0 =A0 =A0 =A0clk_put(i2c->clk);
>
> =A0err_noclk:
> - =A0 =A0 =A0 kfree(i2c);
> =A0 =A0 =A0 =A0return ret;
> =A0}
>
> @@ -1061,7 +1060,6 @@ static int s3c24xx_i2c_remove(struct platform_d=
evice *pdev)
> =A0 =A0 =A0 =A0release_resource(i2c->ioarea);
> =A0 =A0 =A0 =A0s3c24xx_i2c_dt_gpio_free(i2c);
> =A0 =A0 =A0 =A0kfree(i2c->ioarea);
Do we need both  release_resource and kfree

> - =A0 =A0 =A0 kfree(i2c);
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> --
> 1.7.7.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
