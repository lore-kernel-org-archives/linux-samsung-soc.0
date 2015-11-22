From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v5 2/3] regulator: s2mps11: add support for
 S2MPS15 regulators
Date: Sun, 22 Nov 2015 13:24:55 +0000
Message-ID: <20151122132455.GP26072@sirena.org.uk>
References: <1448015873-8743-1-git-send-email-alim.akhtar@samsung.com>
 <1448015873-8743-3-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e2bLSPRkEYxxSNev"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448015873-8743-3-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: lee.jones@linaro.org, k.kozlowski@samsung.com, alexandre.belloni@free-electrons.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, Thomas Abraham <thomas.ab@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--e2bLSPRkEYxxSNev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 04:07:52PM +0530, Alim Akhtar wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
>=20
> The S2MPS15 PMIC is similar in functionality to S2MPS11/14 PMIC. It conta=
ins
> 27 LDO and 10 Buck regulators and allows programming these regulators via=
 a
> I2C interface. This patch adds initial support for LDO/Buck regulators of
> S2MPS15 PMIC.

Acked-by: Mark Brown <broonie@kernel.org>

--e2bLSPRkEYxxSNev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWUcImAAoJECTWi3JdVIfQRfsH/0z7aVPEZ/0UewsXS6a1T+ck
ZY5lIkR3J2SVWgNHkrJaXT+5sZGsq/gdpWCUsT1MCEXmNii8E9PporqFPS4OVwKf
maBUu9zWAupBmXdf8YoXCq1DYE/GWDxp0nU/ouMn5O9MwQpyefNdsU3Vz8z/K2kx
e5TLMvmWH8bDCR1H07GpSMD6Sc3DF9m2PGWMQZ9seS3GazuWZe0Es/Ut2XJUB8GW
I4MbCekgdq3i6ehct/lx4ou4iLfuQn0wigDwlbvSLTXb3hDNZZbUmRAS0WvVCISU
gbAT0cV2ah1/W8vTIvrpaBGnwTli2w7VGK3QYBHClq5bEhieSkIvNPr0WgkvdRI=
=U7YO
-----END PGP SIGNATURE-----

--e2bLSPRkEYxxSNev--
