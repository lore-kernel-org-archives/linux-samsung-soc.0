From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 3/4] regulator: s2mps11: add support for S2MPS15
 regulators
Date: Thu, 29 Oct 2015 08:08:35 +0000
Message-ID: <20151029080835.GM4058@x1>
References: <1446094723-6212-1-git-send-email-alim.akhtar@samsung.com>
 <1446094723-6212-4-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:37214 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750889AbbJ2IIj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 04:08:39 -0400
Received: by wmff134 with SMTP id f134so20099468wmf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2015 01:08:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1446094723-6212-4-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: broonie@kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>

On Thu, 29 Oct 2015, Alim Akhtar wrote:

> From: Thomas Abraham <thomas.ab@samsung.com>
>=20
> The S2MPS15 PMIC is similar in functionality to S2MPS11/14 PMIC. It c=
ontains
> 27 LDO and 10 Buck regulators and allows programming these regulators=
 via a
> I2C interface. This patch adds initial support for LDO/Buck regulator=
s of
> S2MPS15 PMIC.
>=20
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/regulator/Kconfig   |    4 +-
>  drivers/regulator/s2mps11.c |  135 +++++++++++++++++++++++++++++++++=
+++++++++-
>  2 files changed, 136 insertions(+), 3 deletions(-)

[...]

> @@ -1070,6 +1202,7 @@ static const struct platform_device_id s2mps11_=
pmic_id[] =3D {
>  	{ "s2mps11-pmic", S2MPS11X},
>  	{ "s2mps13-pmic", S2MPS13X},
>  	{ "s2mps14-pmic", S2MPS14X},
> +	{ "s2mps15-regulator", S2MPS15X},
>  	{ "s2mpu02-pmic", S2MPU02},
>  	{ },
>  };

Are you going to s/pmic/regulator/ for the existing devices too?

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
