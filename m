From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH 1/1] ARM: dts: Add HS400 support for exynos5422-odroidxu3
Date: Tue, 07 Apr 2015 17:33:06 +0200
Message-ID: <5523F8B2.4070404@fivetechno.de>
References: <551970E5.3000308@fivetechno.de> <551A92C6.7070906@fivetechno.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="t1shsrqrNpl2Jheo2LShrSI2EeEIS0ONr"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:52723 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750990AbbDGPdY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Apr 2015 11:33:24 -0400
In-Reply-To: <551A92C6.7070906@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc@vger.kernel.org, 'Alim Akhtar' <alim.akhtar@gmail.com>, 'Ulf Hansson' <ulf.hansson@linaro.org>, 'Jaehoon Chung' <jh80.chung@samsung.com>, Anand Moon <linux.amoon@gmail.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t1shsrqrNpl2Jheo2LShrSI2EeEIS0ONr
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

the base patch in [0] has been applied now.

My patch was meanwhile

Tested-by: Anand Moon <linux.amoon@gmail.com>


Am 31.03.2015 um 14:27 schrieb Markus Reichl:
> Am 30.03.2015 um 17:51 schrieb Markus Reichl:
>> HS400 timing values are added for exynos5422-odroidxu3 board.
>> ---
>> This patch is analog to [0].
>> This patch needs [0] for the pin-ctrl definition of sd0_rclk.
>>
>> [0]: https://www.mail-archive.com/linux-samsung-soc%40vger.kernel.org/=
msg42902.html
>>
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boo=
t/dts/exynos5422-odroidxu3.dts
>> index a519c86..0408ec0 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> @@ -298,15 +298,20 @@
>> =20
>>  &mmc_0 {
>>  	status =3D "okay";
>> +	num-slots =3D <1>;
>>  	broken-cd;
>>  	card-detect-delay =3D <200>;
>>  	samsung,dw-mshc-ciu-div =3D <3>;
>>  	samsung,dw-mshc-sdr-timing =3D <0 4>;
>>  	samsung,dw-mshc-ddr-timing =3D <0 2>;
>> +	samsung,dw-mshc-hs400-timing =3D <0 2>;
>> +	samsung,read-strobe-delay =3D <90>;
>>  	pinctrl-names =3D "default";
>> -	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
>> +	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_=
rclk>;
>>  	bus-width =3D <8>;
>>  	cap-mmc-highspeed;
>> +	mmc-hs200-1_8v;
>> +	mmc-hs400-1_8v;
>>  };
>> =20
>>  &mmc_2 {
>>
>=20
> hdparm -t /dev/mmcblk0
>=20
> without this patch:
> /dev/mmcblk0:
>  Timing buffered disk reads: 230 MB in  3.01 seconds =3D  76.30 MB/sec
>=20
> with this patch:
> /dev/mmcblk0:
>  Timing buffered disk reads: 588 MB in  3.00 seconds =3D 195.92 MB/sec
>=20
> cat /sys/kernel/debug/mmc0/ios
>=20
> without patch:
> clock:          52000000 Hz
> vdd:            7 (1.65 - 1.95 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      3 (8 bits)
> timing spec:    8 (mmc DDR52)
> signal voltage: 0 (1.80 V)
>=20
> with patch:
> clock:          200000000 Hz
> vdd:            7 (1.65 - 1.95 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      3 (8 bits)
> timing spec:    10 (mmc HS400)
> signal voltage: 0 (1.80 V)
>=20
> Best Regards
>=20


--=20
Markus Reichl


--t1shsrqrNpl2Jheo2LShrSI2EeEIS0ONr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUj+L0ACgkQ7DLr+WDJfp5LWgCg4cmeIiEImQSQ9LPQgYhXsjfa
W/IAniczDseb4mn12lpiIqX5wKex4u5n
=xWvv
-----END PGP SIGNATURE-----

--t1shsrqrNpl2Jheo2LShrSI2EeEIS0ONr--
