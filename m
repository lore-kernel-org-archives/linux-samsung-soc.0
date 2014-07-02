From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] ARM: dts: Remove outdated usb2 phy entry from exynos5250.dtsi
Date: Wed, 02 Jul 2014 06:50:16 +0200
Message-ID: <53B38F88.1040608@suse.de>
References: <1403881475-2001-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45820 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750893AbaGBEuU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 00:50:20 -0400
In-Reply-To: <1403881475-2001-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>

+ kgene, devicetree

Am 27.06.2014 17:04, schrieb Sjoerd Simons:
> The exynos5250.dtsi has two entries for describing the usb2 phy. One =
for
> the newer driver using the generic PHY framework and one for its
> predecessor. The older node is only referenced by the arndale dts, wh=
ich
> seems redundant given starting from dba2f05880c the common dtsi also
> includes the phy entries.
>=20
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts |  4 ----
>  arch/arm/boot/dts/exynos5250.dtsi        | 15 ---------------
>  2 files changed, 19 deletions(-)
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
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/ex=
ynos5250.dtsi
> index 834fb5a..7c545d50 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -600,21 +600,6 @@
>  		};
>  	};
> =20
> -	usb2_phy: usbphy@12130000 {
> -		compatible =3D "samsung,exynos5250-usb2phy";
> -		reg =3D <0x12130000 0x100>;
> -		clocks =3D <&clock CLK_FIN_PLL>, <&clock CLK_USB2>;
> -		clock-names =3D "ext_xtal", "usbhost";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <1>;
> -		ranges;
> -
> -		usbphy-sys {
> -			reg =3D <0x10040704 0x8>,
> -			      <0x10050230 0x4>;
> -		};
> -	};
> -
>  	usb2_phy_gen: phy@12130000 {
>  		compatible =3D "samsung,exynos5250-usb2-phy";
>  		reg =3D <0x12130000 0x100>;

I've stumbled over the same duplication in the .dtsi, LGTM,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
