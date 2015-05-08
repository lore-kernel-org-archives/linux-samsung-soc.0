From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [RESEND][PATCH 1/1] ARM: dts: Add HS400 support for exynos5422-odroidxu3
Date: Fri, 08 May 2015 11:21:34 +0200
Message-ID: <554C801E.2070401@fivetechno.de>
References: <554C6899.4070400@fivetechno.de> <554C706B.9070506@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="l3kUn14LvdbRj4D2scExt4cjhg7mhF7O0"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:51154 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751332AbbEHJVh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 05:21:37 -0400
In-Reply-To: <554C706B.9070506@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--l3kUn14LvdbRj4D2scExt4cjhg7mhF7O0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Am 08.05.2015 um 10:14 schrieb Krzysztof Kozlowski:
> On 08.05.2015 16:41, Markus Reichl wrote:
>> HS400 timing values are added for exynos5422-odroidxu3 board.
>>
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de> Tested-by:
>> Anand Moon <linux.amoon@gmail.com>
>=20
> Once again, I did not see email from Anand.
>=20
>> --- This patch is analog to [0], which is applied already. This
>> patch needs [0] for the pin-ctrl definition of sd0_rclk.
>>
>> [0]:
>> https://www.mail-archive.com/linux-samsung-soc%40vger.kernel.org/msg42=
902.html
>>
>>
> ---
>> arch/arm/boot/dts/exynos5422-odroidxu3.dts | 7 ++++++- 1 file
>> changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> b/arch/arm/boot/dts/exynos5422-odroidxu3.dts index a519c86..0408ec0
>> 100644 --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts +++
>> b/arch/arm/boot/dts/exynos5422-odroidxu3.dts @@ -298,15 +298,20 @@
>>
>> &mmc_0 { status =3D "okay"; +	num-slots =3D <1>;
>=20
> This looks unrelated...  If it is really not needed for HS400 then
> please prepare separate patch.

I will come up with a 2. version after Anand's tag and split these.

>=20
>> broken-cd; card-detect-delay =3D <200>; samsung,dw-mshc-ciu-div =3D
>> <3>; samsung,dw-mshc-sdr-timing =3D <0 4>; samsung,dw-mshc-ddr-timing
>> =3D <0 2>; +	samsung,dw-mshc-hs400-timing =3D <0 2>; +
>> samsung,read-strobe-delay =3D <90>; pinctrl-names =3D "default"; -
>> pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>; +	pinctrl-0 =3D=

>> <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_rclk>;
>=20
> Did you checked this with board schematics?

Yes, I checked that the sd0_rclk is connected to=20
gpc0-7 as in base patch.

>=20
> A reviewed-by tag from someone would be nice.
>=20
> Best regards,
> Krzysztof
>=20
>=20

Best Regards,
--=20
Markus Reichl


--l3kUn14LvdbRj4D2scExt4cjhg7mhF7O0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlVMgB4ACgkQ7DLr+WDJfp77cgCfcpKEA/mqmJL5X98b//AsGrva
QMUAmwYJVVJ5fgqt5lBq5D2ZImglYyoR
=ZVxe
-----END PGP SIGNATURE-----

--l3kUn14LvdbRj4D2scExt4cjhg7mhF7O0--
