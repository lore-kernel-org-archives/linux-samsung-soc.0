From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 5/6] ARM: dts: Add vmmc and vqmmc supplies for Peach Pit
 and Pi boards
Date: Tue, 19 Aug 2014 20:37:44 +0200
Message-ID: <53F39978.3080901@suse.de>
References: <1408460913-13863-1-git-send-email-javier.martinez@collabora.co.uk> <1408460913-13863-6-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58608 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751576AbaHSShs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Aug 2014 14:37:48 -0400
In-Reply-To: <1408460913-13863-6-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hi Javier,

Am 19.08.2014 17:08, schrieb Javier Martinez Canillas:
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/bo=
ot/dts/exynos5420-peach-pit.dts
> index 8e50042..5b9dbb9 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -547,6 +547,8 @@
>  };
> =20
>  &mmc_2 {
> +	vmmc-supply =3D <&tps65090_fet4>;
> +	vqmmc-supply =3D <&vqmmc_sdcard>;
>  	status =3D "okay";
>  	num-slots =3D <1>;
>  	supports-highspeed;
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boo=
t/dts/exynos5800-peach-pi.dts
> index 939f91c..dcac443 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -545,6 +545,8 @@
>  };
> =20
>  &mmc_2 {
> +	vmmc-supply =3D <&tps65090_fet4>;
> +	vqmmc-supply =3D <&vqmmc_sdcard>;
>  	status =3D "okay";
>  	num-slots =3D <1>;
>  	supports-highspeed;

A convention that I picked up was to place overridden status property
first. Do your new properties really need to go before that?

Also, if you look at today's for-next, then supports-highspeed should b=
e
cap-{sd,mmc}-highspeed, so it may be worth to rebase.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
