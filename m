From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: sec-core: Remove unused s2mpu02-rtc and s2mpu02-clk
 children
Date: Fri, 30 Oct 2015 09:31:30 +0000
Message-ID: <20151030093130.GR4058@x1>
References: <1446191481-21214-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:36699 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750935AbbJ3Jbi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 05:31:38 -0400
Received: by wmec75 with SMTP id c75so7302938wme.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2015 02:31:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1446191481-21214-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Fri, 30 Oct 2015, Krzysztof Kozlowski wrote:

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

Applied, thanks.

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

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
