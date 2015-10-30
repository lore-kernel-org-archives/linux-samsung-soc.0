From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] mfd: sec-core: Remove unused s2mpu02-rtc and s2mpu02-clk
 children
Date: Fri, 30 Oct 2015 18:12:14 +0900
Message-ID: <5633346E.8040208@samsung.com>
References: <1446191481-21214-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54958 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758333AbbJ3JMQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 05:12:16 -0400
In-reply-to: <1446191481-21214-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lee Jones <lee.jones@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi,

On 2015=EB=85=84 10=EC=9B=94 30=EC=9D=BC 16:51, Krzysztof Kozlowski wro=
te:
> The commit 54e8827d5f0e ("mfd: sec-core: Add support for S2MPU02
> device") added new MFD child devices for S2MPU02: RTC and clock
> provider (the clock provider with new compatible). However support fo=
r
> these devices was not added to existing drivers (rtc-s5m, clk-s2mps11=
).
> New drivers were not submitted neither.
>=20
> This means that the name of children devices is completely unused. Th=
e
> "samsung,s2mpu02-clk" compatible remains undocumented so it is unclea=
r
> what is provided by that compatible.
>=20
> Clean up this by removing unused child devices and undocumented
> compatible.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> ---
>=20
> I don't think that removing the "samsung,s2mpu02-clk" compatible woul=
d
> be considered as ABI break because:
> 1. Kernel did not document it as ABI.
> 2. Kernel did not provide any kind of feature for that compatible. It
>    was totally ignored.
> ---
>  drivers/mfd/sec-core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 2626fc0b5b8c..989076d6cb83 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -103,12 +103,9 @@ static const struct mfd_cell s2mpa01_devs[] =3D =
{
>  };
> =20
>  static const struct mfd_cell s2mpu02_devs[] =3D {
> -	{ .name =3D "s2mpu02-pmic", },
> -	{ .name =3D "s2mpu02-rtc", },
>  	{
> -		.name =3D "s2mpu02-clk",
> -		.of_compatible =3D "samsung,s2mpu02-clk",
> -	}
> +		.name =3D "s2mpu02-pmic",
> +	},
>  };
> =20
>  #ifdef CONFIG_OF
>=20

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
