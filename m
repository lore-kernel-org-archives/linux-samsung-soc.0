From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 0/4] Pending S3C64xx updates
Date: Tue, 24 Jan 2012 21:31:27 +0000
Message-ID: <20120124213127.GH1135@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50361 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756710Ab2AXVba (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 16:31:30 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch series is a collection of s3c64xx updates I've had hanging
round in my tree for varying lengths of time that it'd be good to get
merged.  There's no particularly relationship between them except that
they're all for s3c64xx.

Mark Brown (4):
      ARM: S3C64XX: Make s3c64xx_init_uarts() static
      ARM: S3C64XX: Define some additional always off clocks
      ARM: S3C6410: Use device names for both I2C clocks
      ARM: S3C64XX: Add hookup for Tomatin module on Cragganmore

 arch/arm/mach-s3c64xx/clock.c                |  106 ++++++++++++++++++++++++++
 arch/arm/mach-s3c64xx/common.c               |    2 +-
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |   27 ++++++-
 arch/arm/mach-s3c64xx/mach-crag6410.c        |   11 +++-
 4 files changed, 143 insertions(+), 3 deletions(-)

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHyMoAAoJEBus8iNuMP3dpp4P/3R1UHoNaH4GFwA1IJXARixk
eycZdBocuOmXtYuSI5xfVmiWZB6PLILe3kDtEjpO+r3DQfUlWx0cmLqDtLkOY1Oe
uvgJ/obz6C4gaZiqcN8GY44qvFsVcAfA8O7T3ypnb23w4dIrEi26/FukANqVWObX
A1v+fcFydkFnOa+q49rPwwnUkLzP3LlPZItQrjxcCiMzlaDAdGzh0hkBXTzINkDb
XvRx2DSV2fOTYMqSmEHK8b2nMiv7sm9GiNWfTV8pa5atnhas8FTGEMQwgeqLm7Uo
0w0LTA1nhBc0OZK6sUb15aHkMvbHCS2aCVaVw1yDdgAkRbgkrBrNsqOZ+esrOBV5
vYHNC3OPyCVBkiEMGLMjGCOGXi4XS/8O7lKpn3j0ZhW+9ov2bGk25Ab1VaPgyQ0d
9rlt8zas8KCkDQHJJVOIuUgecm4aCKKsOENZdc4k4Jui1QfqCUsLfaGSDTxr9nue
dHJWwfZrD4+0lw4W7NutoR+6SaIwZYKycQT7o2lOLKVBStFiURn+nKq/PVZwf7C4
1Hhbe++eAn4i3xRwOS43vYUc13eNvN2QHv2vGtRlNeeB5g8JO/FVV0xDrgoxsFPB
d242WJQZVClpurvvAYAV9G4M6T2OgfAsIKpfbVVj3uMmCIYp8Kq0ZUOeGCWfP6Pu
jgJsj2+sw/yvQhVAmqTZ
=+k3W
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--
