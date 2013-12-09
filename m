From: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Mon, 9 Dec 2013 17:30:21 +0000
Message-ID: <20131209173021.GC29268@sirena.org.uk>
References: <1386253559-18262-1-git-send-email-broonie@kernel.org>
 <1386253559-18262-2-git-send-email-broonie@kernel.org>
 <CAAgF-Bfk8byZwVBd_5PopM3ji-wdTMR5i-J7w1W4zq4gFk4i+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hVUY+LYn0LT07sdA"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:42077 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753885Ab3LIRa1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 12:30:27 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-Bfk8byZwVBd_5PopM3ji-wdTMR5i-J7w1W4zq4gFk4i+Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org


--hVUY+LYn0LT07sdA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 06, 2013 at 10:44:19AM +0530, Padma Venkat wrote:

> I couldn't test this patch set due to some crash in recent kernel in
> dmaengine_unmap_put. I think this unmap support is not yet implemented
> for pl330 driver. It is mentioned in the commit "dmaengine: prepare
> for generic 'unmap' data", [bzolnier: prepare pl330 driver for adding
> missing unmap while at it].

This is unfortunate...  I'd suggest trying mainline but I see it's
broken in Linus' tree too and no fixes in -next. :(

I'm tempted to push up with your Tested-by a note saying you did your
testing on an earlier version but weren't able to test due to other bugs.

--hVUY+LYn0LT07sdA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpf4pAAoJELSic+t+oim9EpUP/RaB5GEPsoHcNVVRwrpVPoZq
K1JGaMQu8oCx8Rbz8JPR5vEda52dm2l/6XCcx8Utizyk9pRqF7uQSF0QXZz+yq6c
xbTVxRc6tZU8XPUDZXFM/P773yIzaDe4kXa3XIVPRHDyCSUDK2C08ujEnFvNQ5qM
cmcM0QjwTpyHfOJJclc2OLHEATM6ckUxb3HcL9J76Qo2rVzkFAvR8h7OzjxhOhVw
CvpNdsjS/ZRNqu0f456UCcgysR6jbdkvFaRrA0KOH48RX310KGJ8tIfxi5VN960p
q9W39yycIXL+c1XELpq6RK3S4oSl6K6t6XOrasMZq2UuctrsvZIMCVcDXqzYUsWa
aDnJQoqYf4nLGUQp39qhFm7aphsvV26SM1Ug5Xd0e75lf09Y9IBYCKwg0CI3BPLP
N9XSFiyxoLwOEM8Hn9gbNnBhTyHDFcv5cRo1ZVXRHvYad1KGitXRAJHeX6Vd7Iwb
X1oa+roTtlNAAY7MjQoTbF760GQiPC9DKGqMIy6i4FdAEHWfQZUNHkKN42GwYQr4
Mi0emSvIedDjTcWreY5TY+924v2mm9v8lCEgqxuT4pLJN/KQCH/1fHrTSWqdLDqT
FUWYEmxT5GmwbQcfqjvibL2huPYbdjbwozIAUtcdBdnRxBD4tDkHpoujQu62MNF+
NTD3obwuWvaINJ613oea
=BVY8
-----END PGP SIGNATURE-----

--hVUY+LYn0LT07sdA--
