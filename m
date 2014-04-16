From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] mfd: tps65090: Stop caching registers
Date: Wed, 16 Apr 2014 10:59:22 +0100
Message-ID: <20140416095922.GG4754@lee--X1>
References: <1397592876-5741-1-git-send-email-dianders@chromium.org>
 <1397592876-5741-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:43698 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755215AbaDPJ72 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 05:59:28 -0400
Received: by mail-we0-f172.google.com with SMTP id t61so10723475wes.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2014 02:59:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1397592876-5741-3-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, broonie@kernel.org
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, ajaykumar.rs@samsung.com, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org

> Nearly all of the registers in tps65090 combine control bits and
> status bits.  Turn off caching of registers so that we can read statu=
s
> bits reliably.
>=20
> NOTE: the IRQnMASK and CG_CTRLn registers are the exception and could
> be cached.  If we find that we spend a lot of time reading those we
> can turn on cache for just those registers.
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  drivers/mfd/tps65090.c | 10 ----------
>  1 file changed, 10 deletions(-)
>=20
> diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
> index c3cddb4..4cfdd07 100644
> --- a/drivers/mfd/tps65090.c
> +++ b/drivers/mfd/tps65090.c
> @@ -149,21 +149,11 @@ static struct regmap_irq_chip tps65090_irq_chip=
 =3D {
>  	.mask_invert =3D true,
>  };
> =20
> -static bool is_volatile_reg(struct device *dev, unsigned int reg)
> -{
> -	if ((reg =3D=3D TPS65090_INT_STS) || (reg =3D=3D TPS65090_INT_STS2)=
)
> -		return true;
> -	else
> -		return false;
> -}
> -

I don't know enough about Regmap internals to know what this actually
affects in real terms.

Mark,
  Does this change seem sane to you?

>  static const struct regmap_config tps65090_regmap_config =3D {
>  	.reg_bits =3D 8,
>  	.val_bits =3D 8,
>  	.max_register =3D TOTAL_NUM_REG,
>  	.num_reg_defaults_raw =3D TOTAL_NUM_REG,
> -	.cache_type =3D REGCACHE_RBTREE,
> -	.volatile_reg =3D is_volatile_reg,
>  };
> =20
>  #ifdef CONFIG_OF

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
