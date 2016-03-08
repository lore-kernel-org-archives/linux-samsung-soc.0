From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/4] mfd: max77686: Export OF module alias information
Date: Tue, 8 Mar 2016 11:24:09 +0700
Message-ID: <20160308042409.GE13692@x1>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:35816 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753491AbcCHEYP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Mar 2016 23:24:15 -0500
Received: by mail-pa0-f41.google.com with SMTP id bj10so3656099pad.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2016 20:24:14 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1455251419-8919-5-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>

On Fri, 12 Feb 2016, Javier Martinez Canillas wrote:

> When the device is registered via OF, the OF table is used to match t=
he
> driver instead of the I2C device ID table but the entries in the latt=
er
> are used as aliasses to load the module if the driver was not built-i=
n.
>=20
> This is because the I2C core always reports an I2C module alias inste=
ad
> of an OF one but that could change so it is better to always export i=
t.

I do have a set which changes this behaviour.

Annoyingly it is still not applied. :(

> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20
> ---
>=20
>  drivers/mfd/max77686.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index 2f563d0f83cc..b1ed9ed0828c 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -204,6 +204,7 @@ static const struct of_device_id max77686_pmic_dt=
_match[] =3D {
>  	},
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, max77686_pmic_dt_match);
> =20
>  static int max77686_i2c_probe(struct i2c_client *i2c,
>  			      const struct i2c_device_id *id)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
