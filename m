From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
 panel nodes
Date: Fri, 28 Feb 2014 15:31:12 +0200
Message-ID: <53108FA0.4040903@ti.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com> <1392204688-4591-20-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="uAMkR61uDAfn7MkQBP2MiuFTNTrrv3oc2"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:52171 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751915AbaB1Nbg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Feb 2014 08:31:36 -0500
In-Reply-To: <1392204688-4591-20-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

--uAMkR61uDAfn7MkQBP2MiuFTNTrrv3oc2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 12/02/14 13:31, Andrzej Hajda wrote:
> The patch adds bridge and panel nodes.
> It adds also DSI properties specific for arndale board.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 39 ++++++++++++++++++++++++=
++++++++
>  1 file changed, 39 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/d=
ts/exynos5250-arndale.dts
> index a0a985d..7d666b1 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -584,6 +584,45 @@
>  		};
>  	};
> =20
> +	panel: panel {
> +		compatible =3D "boe,hv070wsa-100";
> +		power-supply =3D <&vcc_3v3_reg>;
> +		enable-gpios =3D <&gpd1 3 0>;
> +		port {
> +			panel_ep: endpoint {
> +				remote-endpoint =3D <&bridge_out_ep>;
> +			};
> +		};
> +	};
> +
> +	dsi_0: dsi@14500000 {
> +		vddcore-supply =3D <&ldo8_reg>;
> +		vddio-supply =3D <&ldo10_reg>;
> +		samsung,pll-clock-frequency =3D <24000000>;
> +		samsung,burst-clock-frequency =3D <320000000>;
> +		samsung,esc-clock-frequency =3D <10000000>;
> +		status =3D "okay";
> +
> +		bridge@0 {
> +			reg =3D <0>;
> +			compatible =3D "toshiba,tc358764";
> +			vddc-supply =3D <&vcc_1v2_reg>;
> +			vddio-supply =3D <&vcc_1v8_reg>;
> +			vddmipi-supply =3D <&vcc_1v2_reg>;
> +			vddlvds133-supply =3D <&vcc_3v3_reg>;
> +			vddlvds112-supply =3D <&vcc_1v2_reg>;
> +			reset-gpio =3D <&gpd1 6 1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			port@1 {
> +				reg =3D <1>;
> +				bridge_out_ep: endpoint {
> +					remote-endpoint =3D <&panel_ep>;
> +				};
> +			};
> +		};
> +	};

Compared to what I've done on OMAP, you don't seem to specify the video
inputs for the tc358764 at all. In this case it's obvious, as the chip
is a child of the DSI master. But the chip could as well be controlled
via i2c, and so be placed as a child of the i2c nodes.

So even if the driver doesn't use it, maybe it would be more future
proof to have both input and output endpoints for the tc358764?

 Tomi



--uAMkR61uDAfn7MkQBP2MiuFTNTrrv3oc2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTEI+gAAoJEPo9qoy8lh71wZYQAJusntlm939iLvqxgjXUtYx/
rI3ED+GdEIkG3vI7e4CxH9EgWBpEKEHV8onY88aGhOwv8vtXhogPWg/sGJxFxCFZ
8j5lqZDwzx7xeOqNgyToA7xTmKO7qLF1eQn02Fa7nrlVM1Z+JSifPEzG4Gykfqiv
W4ciHwYoUAbfiZQCXdam7zakGJYhIq8wzUDPEiCovcMjXOdPmIFrO8n13vDMdOOy
bqMr8L2/xar8Yjf1tKjrFLlrp59zVzGJdeS4djs4tv8IedSBD1pVVDJ1E8f5AYXI
Tyn/bsg/zCdZEuB2Orb2v2V5EzHT9CZTgW7++IZh5D+CZfkTj+tCr8/2Da7nMVhl
GfCOg/klc3Eb7rbUsr+KmmORBNT8wVH4e1HBf4+RRXPmNw4sUfepEGmzncLpBy0K
wi1jac39QO9vbCXJAAZeAR9P0LVQQDF0mlL0rCdS9E2hLClhBGx9YcqHnU+9Atf2
JNB8VrxqsI6VqFWcWggvvA8xIVdXmfnGlz3JvaAOCmBBeO9/kzom75KFBrM9vTgh
uZalrdfbKcYz7lC8j3F0i2dLpruU3GpWUJ++XDPhD7++NAxmK36J9RFRQWzgwMmc
j0gGR19oBXdMH0nUzLIuQz+gD8afmWqb5tvlVxRy1kkLv+a1fugWxiujSG0QASPq
iAp8mojT6FNxmvngXELz
=KmsM
-----END PGP SIGNATURE-----

--uAMkR61uDAfn7MkQBP2MiuFTNTrrv3oc2--
