From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: ASoC: samsung: Fix IISMOD setting in
 i2s_set_sysclk()
Date: Fri, 21 Nov 2014 18:08:29 +0000
Message-ID: <20141121180829.GV3815@sirena.org.uk>
References: <1416477797-27332-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U9vhhefU4FbM2lKk"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33961 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750939AbaKUSKN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 13:10:13 -0500
Content-Disposition: inline
In-Reply-To: <1416477797-27332-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>


--U9vhhefU4FbM2lKk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 20, 2014 at 03:33:17PM +0530, Padmavathi Venna wrote:
> In the i2s_set_sysclk() callback we are currently clearing all bits
> of the IISMOD register in i2s_set_sysclk. It's due to an incorrect
> mask used for the AND operation which is introduced in commit
> a5a56871f804edac93a53b5e871c0e9818fb9033 (ASoC: samsung:
> add support for exynos7 I2S controller) and also adds the missing
> break statement.

Applied, thanks.

--U9vhhefU4FbM2lKk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUb3+cAAoJECTWi3JdVIfQCCcH/i/wftWMkSdzY+5rK2yCyrg8
RJ7XMLXS6I/MKDhhKIskJowXxy425deShcOyq7ZJGoeSoXoq6Wx9g8dotyi/0bNb
/Y3gPTbGaD6wPcyp4ec+g8QXtjRlPIo/mKAnR63fYOJykws2nFmRhLKsxVTe/Plj
jVdM2whZHngKfhiNdQhaUvjGJzX0ioHpbQpeKi+i21WjxY/QjpbVIWiVWfJyPkim
rgm41/i/z6kAo3aEXAhL0+E82AzFIr3H9iafDbhhJIevdx0p4IKWbztmDLKxTqpJ
4uApmFxVIXzxz+AEhyXgz4cOvcv+N6f2RnUNb/nMF+dloQGCK8IXWTPKqfgYfjQ=
=4pvT
-----END PGP SIGNATURE-----

--U9vhhefU4FbM2lKk--
