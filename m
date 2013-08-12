From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 1/4] ASoC: Samsung: I2S: Add quirks as driver data in
 I2S
Date: Tue, 13 Aug 2013 00:13:27 +0100
Message-ID: <20130812231327.GK6427@sirena.org.uk>
References: <1376300994-1679-1-git-send-email-padma.v@samsung.com>
 <1376300994-1679-2-git-send-email-padma.v@samsung.com>
 <52096871.4030703@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mnamcX5BDF+ZiagH"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:44779 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752290Ab3HLXNf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 19:13:35 -0400
Content-Disposition: inline
In-Reply-To: <52096871.4030703@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Kumar Gala <galak@codeaurora.org>


--mnamcX5BDF+ZiagH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 12, 2013 at 04:57:53PM -0600, Stephen Warren wrote:
> On 08/12/2013 03:49 AM, Padmavathi Venna wrote:

> > +- compatible : should be one of the following.
> > +   - samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
> > +   - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
> > +     secondary fifo, s/w reset control and internal mux for root clk src.

> Those descriptions seem a little odd. If I have an SoC that isn't
> s5pv210, yet supports "8/16/24bit multichannel(5.1) I2S with secondary
> fifo, s/w reset control and internal mux for root clk src", will
> compatible="samsung,s5pv210-i2s" work for my HW?

> I wonder if you should instead include the IP block version in the
> compatible value?

We've been round this loop several times, I'd prefer the IP block
versions too but they're at best patchily documented and so as a general
policy the Samsung bindings use the name of the SoC an IP first appeared
in as the version.

> In other words, I don't think we have an answer to the question: Should
> differences between similar HW blocks be encoded into DT properties, or
> should the driver encode them into some table, and look them up from
> compatible value?

For usability it seems better to just be able to say which IP you've
got, this also makes it easier to implement support for new IP features
later on without having to go back and add new properties which would be
sad.

> (although I dare say that at least samsung,supports-rstclr should be
> modified to use the new reset controller bindings)

Really?  That doesn't seem terribly sane - I had thought that was for
bodging resets on the side of things that don't normally have them or
need board specific logic.  Also note that this is actually a magic
register write done to reset the IP on some specific IPs.

--mnamcX5BDF+ZiagH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCWwUAAoJELSic+t+oim9IpwP/j6BFQ9pehqkC2FoC/04+Rvx
HIyv4VtwYLWC8TsfSXuPUnABF/ZM4fyjZCjIaHfpCNO9lwl+WsOHuRp16pVoc2st
O+F7dGcth1ie9X0hdIn13R/z96EIo3ZWSXegrd+SwsMt6sewlRi7A8ZcyXy1PuH3
sJJmHnXN52smpAs4hHayp+Yvd7x9cF+UaOxepz50wpey16LaAPXgI7ntsmJegTrA
UaPLnlmQ05It6VKEkEWIPD5rje5PmB4OMll6ztWYwfPUKIVvoyoLhwIyFaZ0gYed
LbB8DORxtwBgadXaF/Ph7KNNaTjryYMIlerOFo6e7PKZka7YQroZBQKtHWVWUriG
rK7S8nY5ONAqJ4oTclq5jq15CY8OBkiOi7SrrNxgH8C7iQSIpsK1ZNRv/1iHmYeE
I6qgd0zBBu+LsCuxECtsM+Y5KOiJVAzECFrLgkS2uNUBUdQJtj9F8cZvtZ598bmr
O7I2YSZL3Z0NpMWKvlCkDEl5AfUOEUENUqKhQ8h08eBfOYD70l5kPx1m63yL4Ejc
fEbhb0w80T66OLtnCnMRWVhsrgAvOBXcPIXtXM6zrrUYcODp+deRH5aQyjDqgrz1
BUetyq7i5lonP4yK4ACvLq76XEStZOxLbM/w0kT/KPqXXF8jVG705wd6BeVAiDRz
nl3V1JEt3WL5EarCIqoB
=aveP
-----END PGP SIGNATURE-----

--mnamcX5BDF+ZiagH--
