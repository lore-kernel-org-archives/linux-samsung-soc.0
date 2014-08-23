From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 1/3] ARM: dts: Add DT changes for display on snow
Date: Sat, 23 Aug 2014 12:47:26 +0200
Message-ID: <53F8713E.5040408@suse.de>
References: <1406317464-7525-1-git-send-email-ajaykumar.rs@samsung.com> <1406317464-7525-2-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45731 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752456AbaHWKra (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 Aug 2014 06:47:30 -0400
In-Reply-To: <1406317464-7525-2-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Thierry Reding <thierry.reding@gmail.com>

Am 25.07.2014 21:44, schrieb Ajay Kumar:
> Add DT nodes for ptn3460 bridge chip and panel-simple panel.

"simple-panel"

> Add backlight enable pin and backlight power supply for pwm-backlight=
=2E
> Also add bridge phandle needed by dp to enable display on snow.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts |   40 +++++++++++++++++------=
----------
>  1 file changed, 21 insertions(+), 19 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dt=
s/exynos5250-snow.dts
> index 6c36d41..f57f993 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -270,7 +270,7 @@
>  					dcdc3 {
>  						ti,enable-ext-control;
>  					};
> -					fet1 {
> +					fet1: fet1 {
>  						regulator-name =3D "vcd_led";
>  						ti,overcurrent-wait =3D <3>;
>  					};
> @@ -293,7 +293,7 @@
>  						regulator-always-on;
>  						ti,overcurrent-wait =3D <3>;
>  					};
> -					fet6 {
> +					fet6: fet6 {
>  						regulator-name =3D "lcd_vdd";
>  						ti,overcurrent-wait =3D <3>;
>  					};
> @@ -342,6 +342,15 @@
>  			pinctrl-0 =3D <&max98095_en>;
>  			pinctrl-names =3D "default";
>  		};
> +
> +		ptn3460: ptn3460-bridge@20 {

"lvds-bridge"? (AF)

> +			compatible =3D "nxp,ptn3460";
> +			reg =3D <0x20>;
> +			powerdown-gpios =3D <&gpy2 5 0>;
> +			reset-gpios =3D <&gpx1 5 0>;
> +			edid-emulation =3D <5>;
> +			panel =3D <&panel>;
> +		};
>  	};
> =20
>  	i2s0: i2s@03830000 {
> @@ -389,11 +398,13 @@
>  		vdd_pll-supply =3D <&ldo8_reg>;
>  	};
> =20
> -	backlight {
> +	backlight: backlight {
>  		compatible =3D "pwm-backlight";
>  		pwms =3D <&pwm 0 1000000 0>;
>  		brightness-levels =3D <0 100 500 1000 1500 2000 2500 2800>;
>  		default-brightness-level =3D <7>;
> +		enable-gpios =3D <&gpx3 0 0>;
> +		power-supply =3D <&fet1>;
>  		pinctrl-0 =3D <&pwm0_out>;
>  		pinctrl-names =3D "default";
>  	};
> @@ -403,6 +414,12 @@
>  		samsung,invert-vclk;
>  	};
> =20
> +	panel: panel-simple {

Just "panel"? (AF)

> +		compatible =3D "simple-panel";

Use something more concrete than "simple-panel"? (Thierry)

> +		power-supply =3D <&fet6>;
> +		backlight =3D <&backlight>;
> +	};
> +
>  	dp-controller@145B0000 {
>  		status =3D "okay";
>  		pinctrl-names =3D "default";
> @@ -414,21 +431,6 @@
>  		samsung,link-rate =3D <0x0a>;
>  		samsung,lane-count =3D <2>;
>  		samsung,hpd-gpio =3D <&gpx0 7 0>;
> -
> -		display-timings {
> -			native-mode =3D <&timing1>;
> -
> -			timing1: timing@1 {
> -				clock-frequency =3D <70589280>;
> -				hactive =3D <1366>;
> -				vactive =3D <768>;
> -				hfront-porch =3D <40>;
> -				hback-porch =3D <40>;
> -				hsync-len =3D <32>;
> -				vback-porch =3D <10>;
> -				vfront-porch =3D <12>;
> -				vsync-len =3D <6>;
> -			};
> -		};
> +		bridge =3D <&ptn3460>;
>  	};
>  };

This patch will trivially conflict with my Snow cleanup [1]; ptn3460
would go into the appropriate &i2c_* and this hunk into &dp then.

Regards,
Andreas

[1] https://patchwork.kernel.org/patch/4664801/

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
