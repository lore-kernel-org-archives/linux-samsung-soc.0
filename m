From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/4] mfd: max77686: Allow driver to be built as a module
Date: Tue, 8 Mar 2016 11:11:44 +0700
Message-ID: <20160308041144.GB13692@x1>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-4-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:36356 "EHLO
	mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753330AbcCHELz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Mar 2016 23:11:55 -0500
Received: by mail-pf0-f170.google.com with SMTP id 63so3495068pfe.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2016 20:11:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1455251419-8919-4-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>

On Fri, 12 Feb 2016, Javier Martinez Canillas wrote:

> The driver's Kconfig symbol is a boolean but nothing prevents the dri=
ver
> to be built as a module instead of built-in. It is true that most sys=
tem
> integrators will choose the latter but the config should not restrict=
 it.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>=20
>  drivers/mfd/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6c4ebd9f4cb6..005ace26230e 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -493,8 +493,8 @@ config MFD_MAX14577
>  	  of the device.
> =20
>  config MFD_MAX77686
> -	bool "Maxim Semiconductor MAX77686/802 PMIC Support"
> -	depends on I2C=3Dy
> +	tristate "Maxim Semiconductor MAX77686/802 PMIC Support"
> +	depends on I2C
>  	depends on OF
>  	select MFD_CORE
>  	select REGMAP_I2C

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
