From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/1] i2c: s3c2410: Remove class based instantiation
Date: Tue, 3 Jun 2014 13:54:20 +0200
Message-ID: <20140603115420.GA2713@katana>
References: <1401786022-29587-1-git-send-email-sachin.kamat@samsung.com>
 <20140603100546.GA12261@katana>
 <CAK5sBcEkCy0kDL_bG_RsDJ6nwuqZeAGN0fXpPV-MJkHugxuubw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54331 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754827AbaFCLyY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 07:54:24 -0400
Content-Disposition: inline
In-Reply-To: <CAK5sBcEkCy0kDL_bG_RsDJ6nwuqZeAGN0fXpPV-MJkHugxuubw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ch.naveen@samsung.com, Olof Johansson <olof@lixom.net>


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The reason for the removal is the boot delay it is causing on Exynos 5250
> based boards by throwing the following errors continuously.
>=20
> [   55.005300] s3c-i2c 12ce0000.i2c: cannot get bus (error -110)
> [   59.005300] s3c-i2c 12ce0000.i2c: cannot get bus (error -110)
> [   63.005300] s3c-i2c 12ce0000.i2c: cannot get bus (error -110)

I know. That's why I implemented the deprecated class. Still, users may
need more time to switch over. Keep it an out-of-tree patch until then.


--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTjbdsAAoJEBQN5MwUoCm2e9sQAIWT6BXvG27gge/qvGEFjl0y
Karsn3KJfiIOLX/Pk06osAt3UmckkR8yWaPbzk5xrrGtD0RVGgFd76nOwvSfsU3C
jW2n3Q2VIgrU3Vd5jxkO7wlbOdlcUpFyphG58fPSF76bwUFHQe6+ecwNHYjjXGFu
sRYgdK9NyZXnFhJUSk//fXULkgHR8fzTw+fY2R9y5yTgmznkdjj4qYEV1HFKzLEO
2h2eBS0ii8ZZj7C5TjxEE/WYAhphUWucW1u+FrQ3K0pgqbSHIVK5GOzzpbK1EeP5
8edhyRebw8ztLglCuLI7LA5jlesizGlS8jxByLwkUctshlyYCSDLHYpw5C483+YK
OvtPHHa+oO9uCQukcIE+V69QsDQ55oOecz53Leiop3uffmLEgUxpa5S1iGMJT/1F
6e+GR3h+vTnLSmvw+IVGvtgPtMa+um22i0Su7WL/iX1D3GLYbGD9X4Nt/frb3G/x
WnKTb1y3h8C90L6vy1nbeDYofC9x6nzc9RYaE0YDqFeUcJBILUoz9aeWzRfMjXXp
Oh4/vs+GOOuUnG7H+S9V8NOujKupyknc1aSJGdH63heJiMj+VuE69Ve9NLn6lNOv
QpP46ixbFTwc+PXBId5hWF2R2bDyOdHF735VSBZHIMvCFjc3mUSgRO0Ldcjr41g6
9JrMzYXeca+K3HNrWsdV
=+OKN
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
