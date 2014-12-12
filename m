From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH/RFC 11/14] ASoC: samsung: odroidx2: Handle I2S CDCLK
 clock conditionally
Date: Fri, 12 Dec 2014 18:53:32 +0000
Message-ID: <20141212185332.GS11764@sirena.org.uk>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
 <1418319952-10163-12-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bE5y7bXmg3Z2om3p"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57068 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934167AbaLLSxg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Dec 2014 13:53:36 -0500
Content-Disposition: inline
In-Reply-To: <1418319952-10163-12-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com


--bE5y7bXmg3Z2om3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 11, 2014 at 06:45:49PM +0100, Sylwester Nawrocki wrote:
> If the codec control it's master clock provider by the I2S module
> we should not be touching it with set_sysclk() calls.
> So skip the set_sysclk() call in the machine driver if "clocks"
> property is found in the codec device node.

Please clarify in the changelog here that this is a transition measure
to support old DTs, it's not clear why we might want to do things for
the I2S controller by fishing around in the CODEC DT otherwise.

--bE5y7bXmg3Z2om3p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUizmrAAoJECTWi3JdVIfQgj4H/05+RNWKkEGexAvjPRagl8cI
87vZG87nRvXXUEgl3qfs/V6KA9XXF/kv0Z49TYmuEwt9S+ZC+dLgJ6sVkIkV2g8T
GizqDj/3JTuD37sU/1urHHqD3AHfe5LCruqHtakyRnntF3dvPbwxP72e9bDUF/vU
6863/rZdGdQ4KvZD28MxXOdjnc5GKwo2LVGpjA+TSeedFf/v0zMJ/tQG8cVf9gb7
MW1h8jeAT5YUiZrvgOYdoRQvqW6cXSqXb4DKyTLx6t+WEimraHGOoOJrvxgSnsrD
ap7CPhFG4pTSUUn7zIffOQ22BzQRhh/GIVMhk/3gCf0EKO/T8hdqr8aIGLwsR8E=
=fr/6
-----END PGP SIGNATURE-----

--bE5y7bXmg3Z2om3p--
