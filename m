From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 00/15] ASoC: samsung: Add clk provider for I2S
 internal clocks
Date: Wed, 14 Jan 2015 19:49:24 +0000
Message-ID: <20150114194924.GJ3043@sirena.org.uk>
References: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="va4/JQ6j8/8uipEp"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57481 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163AbbANTtk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 14:49:40 -0500
Content-Disposition: inline
In-Reply-To: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--va4/JQ6j8/8uipEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 14, 2015 at 07:42:27PM +0100, Sylwester Nawrocki wrote:
> This series is an attempt to resolve the CDCLK clock gating issue on Odroid
> X2/U3 as reported by Daniel Drake [1], by exposing the CDCLK gate clock
> (and the two other clocks) through clk API. The upside is we can switch
> Odroid X2/U3 to the simple-card, once the CDCLK clock is taken care of by
> the clk core and DT.

Applied all, thanks.

--va4/JQ6j8/8uipEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUtshDAAoJECTWi3JdVIfQjmUH/AkaYVY7qpEU82AepFRSMQfp
5zT6rPpijkiriWRw1gK2XyzrYcuyTzxyNJXGRbvM8uvZn2DEZUY6IL7Vx7r3G5tc
wWdXwOYbjjq4OWdgY/WPxzGgqxpEMomqME8nh7h4SP+HMNDq64H45F2B3Vs+XIa8
V9sgYiG09bp9RmQ1mT8gPRA6IepQKrz11rShg1gQ9RtoNi11U3jkjnSFaPLwP0L8
0iilsevDkqjqyheZz9KeZ32H43eK9qYWwo5B6s7I6sKTT2EVWOjMYBK+5a184T66
i3ccAoXyp9NqthNP6VRRpzCY1BkwvGeQm2LLeZHvBg87WUeKVoRDz1gwV+2tpr0=
=zCSO
-----END PGP SIGNATURE-----

--va4/JQ6j8/8uipEp--
