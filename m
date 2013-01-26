From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] Asoc: Samsung: Add support for I2S runtime S2R
Date: Sat, 26 Jan 2013 15:27:13 +0800
Message-ID: <20130126072711.GN10580@opensource.wolfsonmicro.com>
References: <1359030931-27354-1-git-send-email-rcsekar@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pz/qqzCPDfGwIFOg"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60088 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751337Ab3AZH1U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Jan 2013 02:27:20 -0500
Content-Disposition: inline
In-Reply-To: <1359030931-27354-1-git-send-email-rcsekar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "R. Chandrasekar" <rcsekar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, jassisinghbrar@gmail.com


--Pz/qqzCPDfGwIFOg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 06:05:30PM +0530, R. Chandrasekar wrote:
> From: "R. Chandrasekar" <rcsekar@samsung.com>
>=20
> This patch adds runtime suspend to resume support for I2S.
>=20
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> Signed-off-by: R. Chandrasekar <rcsekar@samsung.com>

This is good but doesn't apply against topic/samsung, please check and
resend.  Note that the signoffs should be in author order - the author
should be first, then people forwarding on the patch.  Other people
should have other tags like Acked-by or Reviewed-by.

--Pz/qqzCPDfGwIFOg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRA4VEAAoJELSic+t+oim9j1EQAIBFX3sFbqMgZoyBRj1s2Rk4
K7s1MbyR1dOvhSw4LVJzF7ktgXcjAyy/AT8KsJCFfffs7Da4EcRo3qv7ar3W9gwb
e9qx7i312Hb8BFWljwm7o1v+6+Fcg1/CxntoNPmOwAx6agA+YPjGKfvNfdNMiZqn
U93J0w1h+FHu5R7YG2I63S7G3vVqlkbHZdAz2hpLPCS5mP0X0eCYl0QIdOIvkbc5
ilMaXGkQAKofezaDN7wjSGxcLINXgbFfy5FLR70P8UrwUjv8N0kjOdHBuM/gT45P
g4TSBzw6PjPKwlRt7huMd2Mnb6v/1sVvXIragQH8+2dP6m0KHpNyZjtzvRnN/PLt
WmxSyr44wtaF3e5Yvrkq5cZwfkexJWWD8Z+i192Df88duUmdg5Y2Rr9lTCLOjb3P
CBBYxv8SX/itnmcmoRv+9/w0s8JErr0fTWnlCZz7x0FQLt3w1NXdu564AqM/Bj5i
9hGkFPgr5FBOLDeTyP1ChHhOJQdDlotztGFlDX7bDuTP70L7W8PkIjCrbbJ3xV4E
AeSVdBelfcg1LTpKY5mbfnBu+1/wurGgz8ARiQ7d8A7K9zwBjkCyOQhNJII2xNgu
7lwfvJQaFMeWtQcyF+T38U6fbV+FQ9jW0ixokbWnLW5DvaXJ9KGe+PRr+anV7/WT
/kFn/63bdnwpwBhLrxhO
=FeGH
-----END PGP SIGNATURE-----

--Pz/qqzCPDfGwIFOg--
