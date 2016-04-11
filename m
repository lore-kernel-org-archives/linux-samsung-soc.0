From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH] mfd: max77686: Use module_i2c_driver() instead of
 subsys initcall
Date: Mon, 11 Apr 2016 12:51:47 +0100
Message-ID: <20160411115147.GU8094@x1>
References: <1459809962-8883-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459809962-8883-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 04 Apr 2016, Javier Martinez Canillas wrote:

> The driver's init and exit function don't do anything besides adding =
and
> deleting the I2C driver so the module_i2c_driver() macro could be use=
d.
>=20
> Currently is not being used because the driver is initialized at subs=
ys
> initcall level, claiming that this is done to allow consumers devices=
 to
> use the resources provided by this driver. But dependencies are in DT=
 so
> manual ordering of init calls is not necessary any more.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20
> ---
>=20
> Changes in the resend:
> - Change commit message to make clear that dependencies are in DT ins=
tead
>   giving the impression that it was wishful thinking (Krzysztof Kozlo=
wski).
>=20
> Hello,
>=20
> This patch was first sent as a part of a bigger series to allow the
> max77686 MFD driver to be built as a module [0]. The other patches
> were already picked but $SUBJECT wasn't, probably because there was
> a dependency with a patch on the exynos thermal driver [1].
>=20
> But the exynos thermal patches also landed in mainline so I think it
> should be safe to merged $SUBJECT now.
>=20
> [0]: https://lkml.org/lkml/2016/2/11/857
> [1]: https://lkml.org/lkml/2016/2/18/592
>=20
> Best regards,
> Javier
>=20
>  drivers/mfd/max77686.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index c1aff46e89d9..66cc9bebb7ba 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -321,18 +321,7 @@ static struct i2c_driver max77686_i2c_driver =3D=
 {
>  	.id_table =3D max77686_i2c_id,
>  };
> =20
> -static int __init max77686_i2c_init(void)
> -{
> -	return i2c_add_driver(&max77686_i2c_driver);
> -}
> -/* init early so consumer devices can complete system boot */
> -subsys_initcall(max77686_i2c_init);
> -
> -static void __exit max77686_i2c_exit(void)
> -{
> -	i2c_del_driver(&max77686_i2c_driver);
> -}
> -module_exit(max77686_i2c_exit);
> +module_i2c_driver(max77686_i2c_driver);
> =20
>  MODULE_DESCRIPTION("MAXIM 77686/802 multi-function core driver");
>  MODULE_AUTHOR("Chiwoong Byun <woong.byun@samsung.com>");

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
