From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 1/5] ARM: dts: remove old USB2 PHY node hook for Arndale
Date: Fri, 22 Aug 2014 19:32:49 +0200
Message-ID: <53F77EC1.6080604@suse.de>
References: <1408726745-31135-1-git-send-email-b.zolnierkie@samsung.com> <1408726745-31135-2-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35605 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932410AbaHVRcx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 13:32:53 -0400
In-Reply-To: <1408726745-31135-2-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Mark Brown <broonie@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Am 22.08.2014 18:59, schrieb Bartlomiej Zolnierkiewicz:
> drivers/usb/phy/phy-samsung-usb2 driver got replaced by
> drivers/phy/phy-samsung-usb2 one.  Remove the leftover hook
> from Arndale dts file.
>=20
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Reviewed-by: Vivek Gautam <gautam.vivek@samsung.com>
> Reviewed-by: Jingoo Han <jg1.han@samsung.com>
> Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Mark Brown <broonie@linaro.org>
> Cc: Kamil Debski <k.debski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot=
/dts/exynos5250-arndale.dts
> index d0de1f5..dad8f9b 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -570,8 +570,4 @@
>  			connect-gpios =3D <&gpd1 7 1>;
>  		};
>  	};
> -
> -	usb@12110000 {
> -		usb-phy =3D <&usb2_phy>;
> -	};
>  };

This will trivially conflict with my exynos5250 cleanups in the Spring
series: &ehci {...} there.

https://patchwork.kernel.org/patch/4664751/

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
