From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH V2] ARM: dts: Add DT changes for display on peach_pi
Date: Fri, 01 Aug 2014 18:54:25 +0200
Message-ID: <53DBC641.3090601@suse.de>
References: <1406910258-28036-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57959 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754729AbaHAQy3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 12:54:29 -0400
In-Reply-To: <1406910258-28036-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com

Hi,

Am 01.08.2014 18:24, schrieb Ajay Kumar:
> Add DT nodes for panel-simple "auo,b133htn01" panel.
> Add backlight enable pin and backlight power supply for pwm-backlight=
=2E
> Also add panel phandle needed by dp to enable display on peach_pi.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
> Remove "simple-panel" compatible string and use only ""auo,b133htn01"=
=2E
>=20
>  arch/arm/boot/dts/exynos5800-peach-pi.dts |   27 ++++++++++---------=
--------
>  1 file changed, 10 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boo=
t/dts/exynos5800-peach-pi.dts
> index f3ee48b..f8c2e61 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -28,11 +28,13 @@
>  		i2c20 =3D "/spi@12d40000/cros-ec@0/i2c-tunnel";
>  	};
> =20
> -	backlight {
> +	backlight: backlight {
>  		compatible =3D "pwm-backlight";
>  		pwms =3D <&pwm 0 1000000 0>;
>  		brightness-levels =3D <0 100 500 1000 1500 2000 2500 2800>;
>  		default-brightness-level =3D <7>;
> +		enable-gpios =3D <&gpx2 2 0>;

=46or Spring I was asked to use GPIO_ACTIVE_* - here that would mean
s/0/GPIO_ACTIVE_HIGH/ IIUC and if necessary
#include <dt-bindings/gpio/gpio.h> before the .dtsi #include.

A modified version of your patch for Snow, rebased onto my cleanups, ca=
n
be found on my spring-next branch.

> +		power-supply =3D <&tps65090_fet1>;
>  		pinctrl-0 =3D <&pwm0_out>;
>  		pinctrl-names =3D "default";
>  	};
> @@ -98,6 +100,12 @@
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> +
> +	panel: panel-simple {

Nit: panel-simple seems backwards in English language, and given that
simple-panel would be referring to the implementation, I used just
"panel" for Spring.

> +		compatible =3D "auo,b133htn01";

=46WIW this depends on auo,b133htn01 getting added to Documentation and
panel-simple, which I think hasn't happened yet?

https://patchwork.kernel.org/patch/4625321/

> +		power-supply =3D <&tps65090_fet6>;
> +		backlight =3D <&backlight>;
> +	};
>  };
> =20
>  &dp {
> @@ -111,22 +119,7 @@
>  	samsung,link-rate =3D <0x0a>;
>  	samsung,lane-count =3D <2>;
>  	samsung,hpd-gpio =3D <&gpx2 6 0>;
> -
> -	display-timings {
> -		native-mode =3D <&timing1>;
> -
> -		timing1: timing@1 {
> -			clock-frequency =3D <150660000>;
> -			hactive =3D <1920>;
> -			vactive =3D <1080>;
> -			hfront-porch =3D <60>;
> -			hback-porch =3D <172>;
> -			hsync-len =3D <80>;
> -			vback-porch =3D <25>;
> -			vfront-porch =3D <10>;
> -			vsync-len =3D <10>;
> -		};
> -	};
> +	panel =3D <&panel>;
>  };
> =20
>  &fimd {

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
