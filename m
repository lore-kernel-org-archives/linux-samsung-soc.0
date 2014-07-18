From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 03/24] mfd: max77686: Don't define dummy function if
 OF isn't enabled
Date: Fri, 18 Jul 2014 09:17:42 +0100
Message-ID: <20140718081742.GM30888@lee--X1>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk>
 <1404505467-26526-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1404505467-26526-4-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Yadwinder Singh Brar <yadi.brar01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 04 Jul 2014, Javier Martinez Canillas wrote:

> When the CONFIG_OF option was not enabled, a dummy function
> max77686_i2c_parse_dt_pdata() was defined since this is called
> unconditionally on probe(). Just always define the real function
> and conditionally call it if CONFIG_OF is enabled instead.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8rSCDK34cm6iQ@public.gmane.org=
=2Euk>
> ---
>  drivers/mfd/max77686.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

Applied now, thanks.

> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index a38e9ee..d1f9d04 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -96,7 +96,6 @@ static const struct regmap_irq_chip max77686_rtc_ir=
q_chip =3D {
>  	.num_irqs		=3D ARRAY_SIZE(max77686_rtc_irqs),
>  };
> =20
> -#ifdef CONFIG_OF
>  static const struct of_device_id max77686_pmic_dt_match[] =3D {
>  	{.compatible =3D "maxim,max77686", .data =3D NULL},
>  	{},
> @@ -116,13 +115,6 @@ static struct max77686_platform_data *max77686_i=
2c_parse_dt_pdata(struct device
>  	dev->platform_data =3D pd;
>  	return pd;
>  }
> -#else
> -static struct max77686_platform_data *max77686_i2c_parse_dt_pdata(st=
ruct device
> -								  *dev)
> -{
> -	return 0;
> -}
> -#endif
> =20
>  static int max77686_i2c_probe(struct i2c_client *i2c,
>  			      const struct i2c_device_id *id)
> @@ -132,7 +124,7 @@ static int max77686_i2c_probe(struct i2c_client *=
i2c,
>  	unsigned int data;
>  	int ret =3D 0;
> =20
> -	if (i2c->dev.of_node)
> +	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node)
>  		pdata =3D max77686_i2c_parse_dt_pdata(&i2c->dev);
> =20
>  	if (!pdata) {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
