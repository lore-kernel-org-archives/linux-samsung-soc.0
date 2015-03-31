From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH 1/1] ARM: dts: Add HS400 support for exynos5422-odroidxu3
Date: Tue, 31 Mar 2015 14:27:50 +0200
Message-ID: <551A92C6.7070906@fivetechno.de>
References: <551970E5.3000308@fivetechno.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="tEj1UxXdjxDqdwKPqu8i6qAT00VrwjWRo"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:59205 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750907AbbCaM1y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 08:27:54 -0400
Received: from [192.168.34.101] (reichl-x64.fritz.box [192.168.34.101])
	(authenticated bits=0)
	by linuxbbg.five-lan.de (8.14.9/8.14.5/SuSE Linux 0.8) with ESMTP id t2VCRp6d019015
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2015 14:27:51 +0200
In-Reply-To: <551970E5.3000308@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tEj1UxXdjxDqdwKPqu8i6qAT00VrwjWRo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 30.03.2015 um 17:51 schrieb Markus Reichl:
> HS400 timing values are added for exynos5422-odroidxu3 board.
> ---
> This patch is analog to [0].
> This patch needs [0] for the pin-ctrl definition of sd0_rclk.
>=20
> [0]: https://www.mail-archive.com/linux-samsung-soc%40vger.kernel.org/m=
sg42902.html
>=20
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot=
/dts/exynos5422-odroidxu3.dts
> index a519c86..0408ec0 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -298,15 +298,20 @@
> =20
>  &mmc_0 {
>  	status =3D "okay";
> +	num-slots =3D <1>;
>  	broken-cd;
>  	card-detect-delay =3D <200>;
>  	samsung,dw-mshc-ciu-div =3D <3>;
>  	samsung,dw-mshc-sdr-timing =3D <0 4>;
>  	samsung,dw-mshc-ddr-timing =3D <0 2>;
> +	samsung,dw-mshc-hs400-timing =3D <0 2>;
> +	samsung,read-strobe-delay =3D <90>;
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
> +	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_r=
clk>;
>  	bus-width =3D <8>;
>  	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
>  };
> =20
>  &mmc_2 {
>=20

hdparm -t /dev/mmcblk0

without this patch:
/dev/mmcblk0:
 Timing buffered disk reads: 230 MB in  3.01 seconds =3D  76.30 MB/sec

with this patch:
/dev/mmcblk0:
 Timing buffered disk reads: 588 MB in  3.00 seconds =3D 195.92 MB/sec

cat /sys/kernel/debug/mmc0/ios

without patch:
clock:          52000000 Hz
vdd:            7 (1.65 - 1.95 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    8 (mmc DDR52)
signal voltage: 0 (1.80 V)

with patch:
clock:          200000000 Hz
vdd:            7 (1.65 - 1.95 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    10 (mmc HS400)
signal voltage: 0 (1.80 V)

Best Regards
--=20
Markus Reichl


--tEj1UxXdjxDqdwKPqu8i6qAT00VrwjWRo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUaksYACgkQ7DLr+WDJfp5kVgCeNeyOIIUFzRNPS+PGBdZVsnQz
fVoAniKHgF/JNRLDXZFUG4h2QrJe+DEY
=BcJt
-----END PGP SIGNATURE-----

--tEj1UxXdjxDqdwKPqu8i6qAT00VrwjWRo--
