From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH v2 14/21] ARM: dts: exynos4412-trats2: add panel node
Date: Fri, 28 Feb 2014 15:33:10 +0200
Message-ID: <53109016.2060105@ti.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com> <1392204688-4591-15-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="LQ7kGX9aHgaaioOcPVGFTcPl6QlQb2gbn"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:49071 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752285AbaB1Ndb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Feb 2014 08:33:31 -0500
In-Reply-To: <1392204688-4591-15-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

--LQ7kGX9aHgaaioOcPVGFTcPl6QlQb2gbn
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 12/02/14 13:31, Andrzej Hajda wrote:
> The patch adds s6e8aa0 panel node for trats2.
> It adds also trats2 specific properties for DSI
> and regulator required by panel.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts | 47 +++++++++++++++++++++++++=
++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dt=
s/exynos4412-trats2.dts
> index fb7b9ae..0986d08 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -442,6 +442,15 @@
>  		};
>  	};
> =20
> +	lcd_vdd3_reg: voltage-regulator@1 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "LCD_VDD_2.2V";
> +		regulator-min-microvolt =3D <2200000>;
> +		regulator-max-microvolt =3D <2200000>;
> +		gpio =3D <&gpc0 1 0>;
> +		enable-active-high;
> +	};
> +
>  	sdhci@12510000 {
>  		bus-width =3D <8>;
>  		non-removable;
> @@ -498,6 +507,44 @@
>  		};
>  	};
> =20
> +	dsi_0: dsi@11C80000 {
> +		vddcore-supply =3D <&ldo8_reg>;
> +		vddio-supply =3D <&ldo10_reg>;
> +		samsung,pll-clock-frequency =3D <24000000>;
> +		samsung,burst-clock-frequency =3D <500000000>;
> +		samsung,esc-clock-frequency =3D <20000000>;
> +		status =3D "okay";
> +
> +		panel@0 {
> +			compatible =3D "samsung,s6e8aa0";
> +			reg =3D <0>;
> +			vdd3-supply =3D <&lcd_vdd3_reg>;
> +			vci-supply =3D <&ldo25_reg>;
> +			reset-gpio =3D <&gpy4 5 0>;
> +			power-on-delay=3D <50>;
> +			reset-delay =3D <100>;
> +			init-delay =3D <100>;
> +			flip-horizontal;
> +			flip-vertical;
> +			panel-width-mm =3D <58>;
> +			panel-height-mm =3D <103>;

I have the same comment here as for the bridge chip: I would specify the
video ports/endpoints between DSI master and the panel, even if you
don't use them at the moment.

 Tomi



--LQ7kGX9aHgaaioOcPVGFTcPl6QlQb2gbn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTEJAWAAoJEPo9qoy8lh71AkUP/0hrrPakQF5JbwFrpEVYkJ8r
toJDIrT25MmURSxllpHmOsw0FBLo2eBNyuOYLyeX6zoi4BFTvKvuqbCFqwiG80Ze
5N23+aFj+KNikR0Qefu2YtQJuMl6jhf3FMHfSWcUpSHJlbp0DxpHsYgaWrCJX5lg
GnRiHPuXuyG0TKFM2N49zfP/8rXSWZyOywlGGzRI408NU4To5/MYSdz/Sl4NdDY9
H/nocM7Tm6IeNdY9XwVW0s1GmwWClWCBmXMzmjjlSuLxYzLu2mNkGmy/FQb72uGB
9H7+hcxVWNfHYld3rwSVF7Wcrd6+Mbe9WXF3cJ4NhurhmDOeK/vB1+opfQBFfaal
ATWjvB8u5bmkrS2dqsYXqnXZuOW6us/vKSTR7UT5BHnCMq5BnJ6ZNk0Huet1xcr6
pgzGtQCIa2oNl7RvCyN/cav9htjCEJsf8Q4ZT3MSWLIRQlucPn5ZT0Eg41d+rNM1
Nn8FKWWc1DWOQsN1cTabKjjiVNuYzv3+QRCKdytD1fKRGhR8264JQYfd59RzWqKb
irb3QhsWnzfLWtD8NOROLbAcUxqoWkZ9pGK2tNHaT/8lA8whuXrzDC4s8CQYINjl
mQVcfIJa5w6Ot7Y/K7meMqEw6KoWWK3jf1tBA6RU5itZaz9E6+CEFpYv8JyWmgf8
lSif1lvFesrS05VnVCJe
=DeyF
-----END PGP SIGNATURE-----

--LQ7kGX9aHgaaioOcPVGFTcPl6QlQb2gbn--
