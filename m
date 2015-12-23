From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: s2m,s5m: constify regulator_ops structures
Date: Wed, 23 Dec 2015 11:37:55 +0000
Message-ID: <20151223113755.GP16023@sirena.org.uk>
References: <1450537080-17387-1-git-send-email-Julia.Lawall@lip6.fr>
 <20151223000043.GE16023@sirena.org.uk>
 <alpine.DEB.2.02.1512230819490.2081@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tZCmRiovzb4sxAVa"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:47276 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751080AbbLWLiD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Dec 2015 06:38:03 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1512230819490.2081@localhost6.localdomain6>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Sangbeom Kim <sbkim73@samsung.com>, kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org


--tZCmRiovzb4sxAVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 23, 2015 at 08:20:43AM +0100, Julia Lawall wrote:
> On Wed, 23 Dec 2015, Mark Brown wrote:

> > On Sat, Dec 19, 2015 at 03:58:00PM +0100, Julia Lawall wrote:
> > > The regulator_ops structures are never modified, so declare them as const.

> > > Done with the help of Coccinelle.

> > This doesn't apply against current code, please check and resend.

> It works fine for me on today's linux-next (80c75a0f1d).  What goes wrong?

It just doesn't apply against my tree.  Presumably there's a change
somewhere else in -next (probably the MFD tree).

--tZCmRiovzb4sxAVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWeoeSAAoJECTWi3JdVIfQuOUH/0O+2OIz+OZ+m8BNcOepVoPi
buFL50f5mG0EZOOp3eMoAAcpQ3K8IvNGPSHjicPlwUTKdqKA7js8ZrZYSz3En8zY
oyk2dY8bGQRpgN24KQUbKdZJmRdqxpaepbMzVCB15HLWQmPfwbRCpTyOaF7Q37nc
7NS4aMD2K+uU9zIpwqrQhL3ciOjho8HdDWZh72rK6inIiaLRo8OO5rO00Epi3yOD
e813AWUvH5b9PIYJyZz/VWDYl48h6sFOVFU+a1e4zmM6FoKji3xkQj9zKyKq6+zL
Yg2rlMrigRZAjpgOexg7gtvUXocKo4WGaDGEKgCb9pFG3JJh+pDvcqxxqpQbzT8=
=qTEo
-----END PGP SIGNATURE-----

--tZCmRiovzb4sxAVa--
