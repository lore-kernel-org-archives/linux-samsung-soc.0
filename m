From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH V4 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src'
 clock to rtc node
Date: Tue, 31 Mar 2015 14:06:51 +0200
Message-ID: <551A8DDB.9060307@fivetechno.de>
References: <551A8991.7080706@fivetechno.de> <551A8C4E.2030400@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="wEVkUpaIW7M2lpIqslJlPqlDNLMPStc3D"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:41388 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752519AbbCaMG7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 08:06:59 -0400
In-Reply-To: <551A8C4E.2030400@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, cw00.choi@samsung.com

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wEVkUpaIW7M2lpIqslJlPqlDNLMPStc3D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 31.03.2015 um 14:00 schrieb Javier Martinez Canillas:
> Hello Markus,
>=20
> On 03/31/2015 01:48 PM, Markus Reichl wrote:
>> The Exynos5422 SoC has a s3c6410 RTC where the source clock
>> is now a mandatory property.
>>
>> This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
>> It is based on v4.0-rc2.
>>
>> ---
>> Changes since v3:
>> 1. Readded slipped #include statement.
>> Sorry for the mess.
>> Changes since v2:
>> 1. Dropped unused phandle.
>> Changes since v1:
>> 1. Dropped Documentation.
>> 2. Split into 2 parts.
>>
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>>
>=20
> When you re-spin your patches with small changes, you should keep all
> the {Reviewed,Tested,Acked}-by tags collected on previous versions so
> the maintainer picking the patches knows who already reviewed the code.=

>=20
> Best regards,
> Javier
>=20
>=20
Ok, will copy it in next time.

Thanks,
--=20
Markus Reichl


--wEVkUpaIW7M2lpIqslJlPqlDNLMPStc3D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUajeAACgkQ7DLr+WDJfp4q0ACgjZtktUeoh5C9LMRbGS5vaHpw
COEAoMI9c8l8LiUkjM8S93K1qvV/jAzn
=HcIK
-----END PGP SIGNATURE-----

--wEVkUpaIW7M2lpIqslJlPqlDNLMPStc3D--
