From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] ARM: dts: Add pwm-fan node to the Odroid-U3 board
Date: Mon, 03 Nov 2014 18:16:12 +0100
Message-ID: <5457B85C.4020105@suse.de>
References: <1415025804-24274-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57101 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750819AbaKCRQP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Nov 2014 12:16:15 -0500
In-Reply-To: <1415025804-24274-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi,

Am 03.11.2014 um 15:43 schrieb Kamil Debski:
> Add pwm-fan node to the Odroid-U3 board file to enable PWM control of=
 the
> cooling fan.
>=20
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroidu3.dts |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boo=
t/dts/exynos4412-odroidu3.dts
> index c8a64be..764bda4 100644
> --- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
> +++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> @@ -31,6 +31,19 @@
>  			linux,default-trigger =3D "heartbeat";
>  		};
>  	};
> +
> +	pwm: pwm@139D0000 {
> +		pinctrl-0 =3D <&pwm0_out>;
> +		pinctrl-names =3D "default";
> +		samsung,pwm-outputs =3D <0>;
> +		status =3D "okay";
> +	};

Please add the pwm label in the .dtsi if necessary and then just do &pw=
m
{...}; before &usb3503 below.

> +
> +	pwm-fan {
> +		compatible =3D "pwm-fan";
> +		status =3D "okay";
> +		pwms =3D <&pwm 0 10000 0>;
> +	};
>  };
> =20
>  &usb3503 {

Regards,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 21284 AG N=FCrn=
berg
