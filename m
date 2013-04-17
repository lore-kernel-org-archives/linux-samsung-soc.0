From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 0/6] Initial Device Tree support for S3C64xx
Date: Wed, 17 Apr 2013 14:08:24 +0100
Message-ID: <20130417130824.GB13687@opensource.wolfsonmicro.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38241 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965132Ab3DQNI0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Apr 2013 09:08:26 -0400
Content-Disposition: inline
In-Reply-To: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 11:14:37PM +0200, Tomasz Figa wrote:
> This series adds Device Tree support for Samsung S3C64xx SoC series.
>=20
> It fixes several problems preventing from booting an S3C64xx-based system
> using Device Tree, adds all the infrastructure for Device Tree-based board
> support, including mach-s3c64xx-dt and dts include files for S3C64xx SoCs,
> and basic device tree source for FriendlyARM Mini6410 board.

Tested-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

in the non-DT case :P

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRbp7BAAoJELSic+t+oim9egMP/1CmxcpXWPzLP4la+nfRPCBK
PoS2Ps5ursdxMGESMSE3KnPZzbDXoIuil8P4PqrL0TQAzZfn7EogWjheoY3mWB9J
IQzSzJ+RAhNGR8ewh7uJGDEwBdHl1MlM4n79nDqyOX24j+6tnEuuLkiH8roT6xQP
sUDyZzQNSMQFhPSWPUdsMWidjmi+F2veFwIoP79ckUR6etrznao+/vlB2Z1e5n76
bN+/Gdu3LovAT6UHCQaNX/3ab0pfLsUw6jgC3XgS0/k03mQwgCnkMtvg4Z9tZEH6
PFpLtB298uA9yBfdT+ktlz/WUbBa6DtSALwL5HzAdeStImGky60+kq7wlWwvOcs1
edq80p+RHBhwzpQbiTO99yu9GqJX+Bk4CP/lH9XCdWrF36rcAXOtxhYWpD8sX1yg
o8gR4nx1yHphktj62Dlkx0Qst4xEZ1dWSSiHfX5hZKw3T8rCHkZSt6uOYKCJVGRl
09LjWMVgDUkS66eFTjVUHC24539Z0YgSzz7ORw/CZWGVNiN3+e47kM3KiuLuzyL4
ouEOf0xlOm1RV/eEA/vz1aA/3zEa5DiXj77DQApFmg650hVSVTPktRylikp5MYel
lXH6Wk6cRQs0WqR1i86ve2XZJGVJ/Q+no5yHOLy47yo4WP1JQBJBAzrIa4m4kXPk
X3CtflyyrxnOx+Ue/xo4
=Urp8
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
