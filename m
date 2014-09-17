From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Wed, 17 Sep 2014 14:52:42 +0300
Message-ID: <5419760A.7020908@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="w1e2rHFt46iGsneeBqEHjINkBS07KPaEW"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:46692 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753107AbaIQLw4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 07:52:56 -0400
In-Reply-To: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--w1e2rHFt46iGsneeBqEHjINkBS07KPaEW
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 27/08/14 17:39, Ajay Kumar wrote:
> Add documentation for DT properties supported by ps8622/ps8625
> eDP-LVDS converter.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/video/bridge/ps8622.txt    |   20 ++++++++++++=
++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/bridge/ps86=
22.txt
>=20
> diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.txt =
b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> new file mode 100644
> index 0000000..0ec8172
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> @@ -0,0 +1,20 @@
> +ps8622-bridge bindings
> +
> +Required properties:
> +	- compatible: "parade,ps8622" or "parade,ps8625"
> +	- reg: first i2c address of the bridge
> +	- sleep-gpios: OF device-tree gpio specification for PD_ pin.
> +	- reset-gpios: OF device-tree gpio specification for RST_ pin.
> +
> +Optional properties:
> +	- lane-count: number of DP lanes to use
> +	- use-external-pwm: backlight will be controlled by an external PWM

What does this mean? That the backlight support from ps8625 is not used?
If so, maybe "disable-pwm" or something?

> +
> +Example:
> +	lvds-bridge@48 {
> +		compatible =3D "parade,ps8622";
> +		reg =3D <0x48>;
> +		sleep-gpios =3D <&gpc3 6 1 0 0>;
> +		reset-gpios =3D <&gpc3 1 1 0 0>;
> +		lane-count =3D <1>;
> +	};
>=20

I wish all new display component bindings would use the video
ports/endpoints to describe the connections. It will be very difficult
to improve the display driver model later if we're missing such critical
pieces from the DT bindings.

 Tomi



--w1e2rHFt46iGsneeBqEHjINkBS07KPaEW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUGXYKAAoJEPo9qoy8lh71AOgP/3fCOrwcDPTe9lq3AOmIN91G
xowHY/h40oWxdPBHmgcrcPevUMVUWlMzI4ndArsQLNwIId4Z1l72l0lWFTNyJY63
7DxxoaAURuj7aTpoH1mEqGEZoXBPcEhN8vGJNaUDGvvjbxwL5LKF7s/ScIjAm/rV
l8FHjWQHIWLI9aAqtVU1so2ehnMwLyvJHeUp3tBTLQ5Hea0WtNovrP5Zsj97D+2K
s+hjVEHSJ/WRa4n0voY+bY/9tSJZrPaV57Jwl4EhSUuoZWDiGnnsxzE/P1HHWPGI
eM/xiTglowxsQYQBojr4KqdHUOvV7+w4wUvczJEqNj8qA8RTEPYJANJFH420Qjxo
MiwSNouYxi2tan38pOp7EJ+IYA8GR9btM54mMgAD5XBo8v6e6/aq5hAiQ3nBp+PW
rHHPSybZwM9SW5Ex87/GKZUqxSA8Jm7U8I0yAqRcjmSCl8MTNnKpaGFadA6Z+Z23
hyyQFixaxIW8sftx4zTZw/E4SL3qoV75vtlGcRahpOW/9xYPOY+bJlyz0FKXyLD2
Q15Q/RkQ73KC4TJ8W6ezQNVuPNIv2G6eZwrvK/gPfvctcsX79+kXZjIIfS8eagSo
0KMT9Bpo9irFpRQCDi6JBSOdqbUcfMHmKwXx8s2riHj+UR4/HFtcvxgVsQmGIOWx
k6mhzAWW0Hfc5PoWRHdz
=fiiX
-----END PGP SIGNATURE-----

--w1e2rHFt46iGsneeBqEHjINkBS07KPaEW--
