From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/2] mfd: sec-core: Modify RTC compatible name of
 S2MPS13
Date: Mon, 23 Mar 2015 12:34:58 +0000
Message-ID: <20150323123458.GE24804@x1>
References: <1426586058-15987-1-git-send-email-k.kozlowski@samsung.com>
 <1426586058-15987-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:33166 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752158AbbCWMfD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Mar 2015 08:35:03 -0400
Received: by weop45 with SMTP id p45so136574378weo.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2015 05:35:02 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1426586058-15987-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Tue, 17 Mar 2015, Krzysztof Kozlowski wrote:

> From: Chanwoo Choi <cw00.choi@samsung.com>
>=20
> This patch modify the RTC compatible name of S2MPS13 because S2MPS13'=
s RTC is
> equal to S2MPS14's RTC.
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> ---
>=20
> Changes since v1:
> 1. New patch.
> ---
>  drivers/mfd/sec-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 0a7bc43db4e4..59bf322feacd 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -76,7 +76,7 @@ static const struct mfd_cell s2mps11_devs[] =3D {
> =20
>  static const struct mfd_cell s2mps13_devs[] =3D {
>  	{ .name =3D "s2mps13-pmic", },
> -	{ .name =3D "s2mps13-rtc", },
> +	{ .name =3D "s2mps14-rtc", },
>  	{
>  		.name =3D "s2mps13-clk",
>  		.of_compatible =3D "samsung,s2mps13-clk",

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
