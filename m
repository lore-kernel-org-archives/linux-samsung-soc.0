From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Wed, 10 Sep 2014 15:31:44 +0100
Message-ID: <20140910143144.GF7960@sirena.org.uk>
References: <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com>
 <540C202E.2060009@collabora.co.uk>
 <540C7F5B.6070307@gmail.com>
 <540C83DE.10505@collabora.co.uk>
 <540C8577.2070907@gmail.com>
 <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
 <CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
 <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wtjvnLv0o8UUzur2"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33101 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753121AbaIJOcT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 10:32:19 -0400
Content-Disposition: inline
In-Reply-To: <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, Doug Anderson <dianders@chromium.org>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Prashanth G <prashanth.g@samsung.com>


--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 10, 2014 at 06:06:46AM -0700, Olof Johansson wrote:
> On Mon, Sep 8, 2014 at 12:40 PM, Grant Likely <grant.likely@secretlab.ca> wrote:

> > Well, lets see... We've got a real user complaining about a platform
> > that used to work on mainline, and no longer does. The only loophole
> > for ignoring breakage is if there nobody cares that it is broken. That
> > currently isn't the case. So even though it's based on a patch that
> > has "DO NOT SUBMIT" in large friendly letters on the front cover, it
> > doesn't change the situation that mainline has a regression.

> Yeah, I'm with you on this Grant, it doesn't matter what the patch is
> labelled as.

> One way to deal with this could be to add a quirk at boot time --
> looking for the simplefb and if found, modifies the regulators to keep
> them on. That'd go in the kernel, not in firmware.

Well, we should also be fixing simplefb to manage the resources it uses
though that doesn't clean up after the broken DTs that are currently
deployed.

As well as the regulators we'll also need to fix the clocks.  If we're
going to start adding these fixups perhaps we want to consider having a
wrapper stage that deals with rewriting DTs prior to trying to use them?
I'm not sure if it makes much difference but there's overlap with other
tools like the ATAGs conversion wrapper and building separately would
let the fixup code run early without directly going into the early init
code (which seems a bit scary).

> Much better would have been if the DRM changes worked when they
> landed, so that the migration form simplefb to drm was invisible to
> the user. Or at least, to get them working ASAP since they're still
> broken. :(

As far as I can tell the problem here is coming from the decision to
have simplefb use resources without knowing about them - can we agree
that this is a bad idea?

--wtjvnLv0o8UUzur2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUEGDMAAoJECTWi3JdVIfQgGwH/jVRmqj9t9wek3zlWMAqWEqT
f5ld4q4AatBZP0aTomuuiGNtXPdhbfwwILvS72uxMQ7kJXqJDvfdjS4jPPI+315C
l0ZZAsMm6CJBqHykMH3SNKprX8Zy/hAfI8cDSjuzFOqyfG0sFCz1TVKjgsmWO1ER
Au5Jm0Y3YrIKV5R5HZH1b/1VciYKyur5MGpkmnCYUI6Rj67lh7Y5Wh9dhUSEaXZ9
ze9b+LbZBqvrdcvUX8ynd1exQ7gef3NB/BkQbtXKw2vnojSSQJhrCtXH06co+KUR
aojHGlt8E+gmz8hVh153MDShuF7AEPTNtSMAA85sPgf0yGB9wNKHEvd1WBRv90Q=
=Yu1z
-----END PGP SIGNATURE-----

--wtjvnLv0o8UUzur2--
