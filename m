From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] regulator: s2mps11: Add external GPIO control for
 S2MPS14
Date: Mon, 14 Apr 2014 22:13:41 +0100
Message-ID: <20140414211341.GE12304@sirena.org.uk>
References: <1397462949-22379-1-git-send-email-k.kozlowski@samsung.com>
 <1397462949-22379-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1397462949-22379-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 14, 2014 at 10:09:07AM +0200, Krzysztof Kozlowski wrote:
> Add support for external control over GPIO for LDO10, LDO11 and LDO12
> S2MPS14 regulators. External control can be turned on by writing 0x0 to
> control register which in case of other regulators is used for disabling
> them. These LDO10-LDO12 regulators can be disabled only by I2C GPIO or
> PWREN pin so the patch actually allows proper way of disabling them.

Applied, thanks.

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTTE+CAAoJELSic+t+oim9C1IP/1l3mwCCzoqIxlnGF7DrchAy
BdDsqVdAXmJK98v+ZQPOHJicXflc6Io95NhayTrBvW6v2dO2cdLgwNv5zXzhuVaA
nrIs7pEgqCKT5RK7Orgv9rU6RFvkhjQ2Aoy9ELW4erI5valunwR5r6628NsZEfCZ
1bU16a/Rg+IxvYRbAU0+nAyKJz4ImNNmcLSa4OkFmp+UmqUIySVpNV5AxJzA2sXZ
jRYRrohNPOgprQbs5ObPKaFGZ2SmIGITjZ0Cn7rhVuO7LcCICTU97AfegDCTEwD9
trCcs06s3DsvIlabMdn5r3SFBg77N5uDceSYzadEuowF1ypdd0D1XxOYs6pjRkvl
tR6cKWVauDXGeh4mcYRbyuYyT46VmDqKmncXitNpGmIGdcMWM1kBBnN3J1he25JT
DaaGnXoPJzjjpyoK4EQOgUWfca7sVX/5yHMRpcF7iG5+TUqVbWHNrC7OZp60buHp
Ims5PaLcjriI9UUR+7FpNoTbdGaz/Ja+iaBx9g4mvW5SwAXn51LOprnNtD07udk5
Dy06/u2jsj/VDHtD2UIDYrB9Kw+k3HL7FB3dwu9BfZVguXn+a1MSK7te3lDTj34w
J9WahutfjGaJaGwjQ50MOr5ivqEzrKoOhWKuQkKQALCjcZGe91peW5tKX4eA4FdI
xVsXhhl6GqXGWkTMCJLx
=qfGf
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
