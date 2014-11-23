From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v2 5/5] ARM: dts: exynos5410: Add ODROID-XU LEDs
Date: Sun, 23 Nov 2014 02:31:31 +0100
Message-ID: <547138F3.3040502@suse.de>
References: <1416687984-3546-1-git-send-email-afaerber@suse.de> <1416687984-3546-6-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48974 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752838AbaKWBbi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Nov 2014 20:31:38 -0500
In-Reply-To: <1416687984-3546-6-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>

Hello Hakjoo,

Am 22.11.2014 um 21:26 schrieb Andreas F=C3=A4rber:
> Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>

Sorry, I was too quick here: Only the previous two patches got signed
off by you, plus the last one on your 3.14 branch. Are you able to sign
off all patches authored by you there? (An email reply indicating the
Signed-off-by should do, if updating the branch is too much work.)

Thanks,
Andreas

> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
> v1 -> v2:
> * Filled in Sob from Hakjoo Kim
>=20
>  arch/arm/boot/dts/exynos5410-odroidxu.dts | 25 +++++++++++++++++++++=
++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boo=
t/dts/exynos5410-odroidxu.dts
> index 97310bb727e2..b02cd3ab7b38 100644
> --- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
> +++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
> @@ -15,6 +15,7 @@
> =20
>  /dts-v1/;
>  #include "exynos5410.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  / {
>  	model =3D "ODROID-XU based on EXYNOS5410";
>  	compatible =3D "hardkernel,odroid-xu", "samsung,exynos5410", "samsu=
ng,exynos5";
> @@ -39,6 +40,30 @@
>  		reg =3D <0x02037000 0x1000>;
>  	};
> =20
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		blue {
> +			label =3D "blue:heartbeat";
> +			gpios =3D <&gpb2 2 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		green {
> +			label =3D "green:activity";
> +			gpios =3D <&gpb2 1 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +			linux,default-trigger =3D "mmc0";
> +		};
> +
> +		red {
> +			label =3D "red:activity";
> +			gpios =3D <&gpx2 3 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +			linux,default-trigger =3D "mmc1";
> +		};
> +	};
>  };
> =20
>  &mmc_0 {
>=20


--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 21284 AG N=C3=
=BCrnberg
