From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] regulator: s2mps11: Rename s2mpsxx regulator as
 *-regulator
Date: Fri, 30 Oct 2015 12:24:10 +0000
Message-ID: <20151030122409.GS4058@x1>
References: <1446202913-20467-1-git-send-email-alim.akhtar@samsung.com>
 <1446202913-20467-2-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:33400 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750888AbbJ3MYR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 08:24:17 -0400
Received: by wmeg8 with SMTP id g8so10574795wme.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2015 05:24:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1446202913-20467-2-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: broonie@kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 30 Oct 2015, Alim Akhtar wrote:

> S2MPSXX regulators are probed with the same name as their parent MFD
> device, this is a bit confusing.
> As we discussed the same here[1], this patch rename the current regul=
ator
> names from *-pmic to *-regulator.
>=20
> [1]-> https://lkml.org/lkml/2015/10/28/417
>=20
> Suggested-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/regulator/s2mps11.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

You need to squash these patches together, or you will hurt
bisectability for your platform.

But the code looks good:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.=
c
> index b2f3a28e720c..3242ffc0cb25 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -1199,11 +1199,11 @@ out:
>  }
> =20
>  static const struct platform_device_id s2mps11_pmic_id[] =3D {
> -	{ "s2mps11-pmic", S2MPS11X},
> -	{ "s2mps13-pmic", S2MPS13X},
> -	{ "s2mps14-pmic", S2MPS14X},
> +	{ "s2mps11-regulator", S2MPS11X},
> +	{ "s2mps13-regulator", S2MPS13X},
> +	{ "s2mps14-regulator", S2MPS14X},
>  	{ "s2mps15-regulator", S2MPS15X},
> -	{ "s2mpu02-pmic", S2MPU02},
> +	{ "s2mpu02-regulator", S2MPU02},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, s2mps11_pmic_id);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
