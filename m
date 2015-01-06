From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 16/16] ARM: dts: Fix I2S1, I2S2 compatible for exynos4
 SoCs
Date: Tue, 6 Jan 2015 18:15:17 +0000
Message-ID: <20150106181517.GQ2634@sirena.org.uk>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
 <1418997336-17777-17-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VRppCkiwz5ce4F2G"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39010 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753129AbbAFSP2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jan 2015 13:15:28 -0500
Content-Disposition: inline
In-Reply-To: <1418997336-17777-17-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--VRppCkiwz5ce4F2G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2014 at 02:55:36PM +0100, Sylwester Nawrocki wrote:
> I2S1, I2S2 on Exynos4 SoC series have limited functionality compared
> to I2S0, "samsung,s3c6410-i2s" compatible should be used for them.
>=20
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

This should probably go to stable as a bug fix too.

--VRppCkiwz5ce4F2G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUrCY0AAoJECTWi3JdVIfQQlwH/2my2+bXKtZ1EKixvR7YC0FN
3wPWY2YVyiIG/CPvDFvb7OnO5p/APQo8Q04eFR0am0ZAcGkEovlyzOOzrNsFs0tT
DqKL6gte6WfSS8hqDykCGsBBMpCdtQFzLhl0PsQvGtkKWLWNI/UdkmJw+QAlqFIa
/vMRGJsmOvsXg5tfSMx4a5I3xnbIOMfrKBOv4vAP32f8LJcDXLGS5NpCaAluGCAT
maAuaxHtJufBWsW3rPo2xDjibC/3x/ZRwQRVxLX+hMVq0EzvQrOZgzLNbierDcmb
sfC+t/LBsdvNIw/vS850U+qbXv68b7jqlQ3djlr7Gvd8BZU0TaLvxPIOJhx+6D0=
=zn4H
-----END PGP SIGNATURE-----

--VRppCkiwz5ce4F2G--
