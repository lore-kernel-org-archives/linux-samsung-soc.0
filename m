From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Enable SND_SIMPLE_CARD for Odroid X2/U3
Date: Wed, 18 Mar 2015 11:51:46 +0000
Message-ID: <20150318115146.GG2869@sirena.org.uk>
References: <1426675939-25125-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zGQnqpIoxlsbsOfg"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53050 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754448AbbCRLvy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Mar 2015 07:51:54 -0400
Content-Disposition: inline
In-Reply-To: <1426675939-25125-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: liquid.acid@gmx.net, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org


--zGQnqpIoxlsbsOfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2015 at 11:52:19AM +0100, Sylwester Nawrocki wrote:
> Odroid X2/U3 sound support can now be specified in device tree using
> the simple card binding, make SND_SOC_ODROIDX2 select SND_SIMPLE_CARD
> to ensure there are always required drivers in place.

No, this isn't an actual dependency so it shouldn't be in Kconfig.

--zGQnqpIoxlsbsOfg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVCWbSAAoJECTWi3JdVIfQiqgH/AnZCmXls1gNwp58Stlpf5y4
9bVewChgF/1TERktx0G2pZvU5OhfsgKSlzGdm8Is1khSSlJZMXA27iQQtfajre26
IgoX/XL3wBKNkqsCYCC7g/W6oP1m3Bsp7oJyqRwJ+qFjniTqOwYMdHoyeg3tsn9N
78Ufy3m5mKvdG6yXVZm79fPfjKIcg4gWN0LucWyXuFGb/ZFCnmd68L7gYtiDfrWm
WiBILhg+d6OfScTdV7Scl+LNoKohEeKiysd8dyuA9V++92VPXWMSApmIIkvzGlVn
XH+WWAL3PGYXUDximzaoupTnUeeZn5BgD1RHHIi1npYcxUcaebPVKrXbpNSFYZQ=
=UBAs
-----END PGP SIGNATURE-----

--zGQnqpIoxlsbsOfg--
