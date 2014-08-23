From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 2/3] ARM: dts: Add DT changes for display on peach_pit
Date: Sat, 23 Aug 2014 12:35:49 +0200
Message-ID: <53F86E85.3050200@suse.de>
References: <1406317464-7525-1-git-send-email-ajaykumar.rs@samsung.com> <1406317464-7525-3-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45633 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752334AbaHWKfx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 Aug 2014 06:35:53 -0400
In-Reply-To: <1406317464-7525-3-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Thierry Reding <thierry.reding@gmail.com>

Am 25.07.2014 21:44, schrieb Ajay Kumar:
> Add DT nodes for ps8622 bridge chip and panel-simple panel.

"simple-panel"

> Add backlight power supply for pwm-backlight.
> Also add bridge phandle needed by dp to enable display on peach_pit.

Note that peach_pi[t] is inconsistent with the file names being
peach-pi[t] here and in the two subjects.

>=20
> Note that, peach_pit doesn't support "chunghwa,claa101wb01" panel,
> but still we choose to reuse the binding since "chunghwa,claa101wb01"
> has similar LCD timings.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   36 +++++++++++++++---=
----------
>  1 file changed, 19 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/bo=
ot/dts/exynos5420-peach-pit.dts
> index 228a6b1..79beba8 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -30,11 +30,12 @@
>  		i2c20 =3D "/spi@12d40000/cros-ec@0/i2c-tunnel";
>  	};
> =20
> -	backlight {
> +	backlight: backlight {
>  		compatible =3D "pwm-backlight";
>  		pwms =3D <&pwm 0 1000000 0>;
>  		brightness-levels =3D <0 100 500 1000 1500 2000 2500 2800>;
>  		default-brightness-level =3D <7>;
> +		power-supply =3D <&tps65090_fet1>;
>  		pinctrl-0 =3D <&pwm0_out>;
>  		pinctrl-names =3D "default";
>  	};
> @@ -100,6 +101,12 @@
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> +
> +	panel: panel-simple {

Just "panel"? (AF)

> +		compatible =3D "chunghwa,claa101wb01", "simple-panel";

Drop "simple-panel" (Thierry)

> +		power-supply =3D <&tps65090_fet6>;
> +		backlight =3D <&backlight>;
> +	};
>  };
> =20
>  &dp {
> @@ -113,22 +120,7 @@
>  	samsung,link-rate =3D <0x06>;
>  	samsung,lane-count =3D <2>;
>  	samsung,hpd-gpio =3D <&gpx2 6 0>;
> -
> -	display-timings {
> -		native-mode =3D <&timing1>;
> -
> -		timing1: timing@1 {
> -			clock-frequency =3D <70589280>;
> -			hactive =3D <1366>;
> -			vactive =3D <768>;
> -			hfront-porch =3D <40>;
> -			hback-porch =3D <40>;
> -			hsync-len =3D <32>;
> -			vback-porch =3D <10>;
> -			vfront-porch =3D <12>;
> -			vsync-len =3D <6>;
> -		};
> -	};
> +	bridge =3D <&ps8625>;
>  };
> =20
>  &fimd {
> @@ -155,6 +147,16 @@
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&max98090_irq>;
>  	};
> +
> +	ps8625: ps8625-bridge@48 {

"lvds-bridge"? (AF)

> +		compatible =3D "parade,ps8625";
> +		reg =3D <0x48>;
> +		sleep-gpios =3D <&gpx3 5 0>;
> +		reset-gpios =3D <&gpy7 7 0>;
> +		lane-count =3D <2>;
> +		panel =3D <&panel>;
> +		backlight =3D <&backlight>;
> +	};
>  };
> =20
>  &hsi2c_9 {

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
