From: Eduardo Valentin <eduardo.valentin@ti.com>
Subject: Re: [PATCH v2 4/5] ARM: dts: exynos4x12: Device tree node definition
 for TMU on Exynos4x12
Date: Tue, 15 Oct 2013 09:37:48 -0400
Message-ID: <525D452C.4020802@ti.com>
References: <1380010102-25817-1-git-send-email-l.majewski@samsung.com> <1381300194-13134-1-git-send-email-l.majewski@samsung.com> <1381300194-13134-5-git-send-email-l.majewski@samsung.com> <20131015082750.4b2f3325@amdc308.digital.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="RwODSSp5i7fJDR9ckJemrPhl2DugWJaVT"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:55458 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758664Ab3JONiD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 09:38:03 -0400
In-Reply-To: <20131015082750.4b2f3325@amdc308.digital.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: kgene.kim@samsung.com, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <eduardo.valentin@ti.com>, Lukasz Majewski <l.majewski@majess.pl>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, devicetree@vger.kernel.org, Amit Daniel Kachhap <amit.daniel@samsung.com>, linux-samsung-soc@vger.kernel.org

--RwODSSp5i7fJDR9ckJemrPhl2DugWJaVT
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 15-10-2013 02:27, Lukasz Majewski wrote:
> Hi Kukjin,
>=20
>> The TMU device tree node definition for Exynos4x12 family of SoCs.
>>
>> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

BTW, you can add my

Reviewed-by: Eduardo Valentin <eduardo.valentin@ti.com>

on patch 4 and 5 of this series.

>>
>> ---
>> Changes for v2:
>> - None
>>
>>  arch/arm/boot/dts/exynos4x12.dtsi |   10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi
>> b/arch/arm/boot/dts/exynos4x12.dtsi index ad531fe..64c0ece 100644
>> --- a/arch/arm/boot/dts/exynos4x12.dtsi
>> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
>> @@ -176,4 +176,14 @@
>>  			};
>>  		};
>>  	};
>> +
>> +	tmu@100C0000 {
>> +		compatible =3D "samsung,exynos4412-tmu";
>> +		interrupt-parent =3D <&combiner>;
>> +		interrupts =3D <2 4>;
>> +		reg =3D <0x100C0000 0x100>;
>> +		clocks =3D <&clock 383>;
>> +		clock-names =3D "tmu_apbif";
>> +		status =3D "disabled";
>> +	};
>>  };
>=20
> Can you pull this DT node definition for TMU (as a fix to v3.12)?
>=20
> It is crucial for Exynos4412.
>=20


--=20
You have got to be excited about what you are doing. (L. Lamport)

Eduardo Valentin


--RwODSSp5i7fJDR9ckJemrPhl2DugWJaVT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iF4EAREIAAYFAlJdRS8ACgkQCXcVR3XQvP1kvwEA4rfbYgOgcZi1caxoieyaw0vi
oUUyE5+dK1hKwf6UlQQBALKVmudGU1+f0oesnQoXVi+xkFTPAQ4CPTrFNmQ/nF6N
=Kvu7
-----END PGP SIGNATURE-----

--RwODSSp5i7fJDR9ckJemrPhl2DugWJaVT--
