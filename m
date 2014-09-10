From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Wed, 10 Sep 2014 19:17:01 +0100
Message-ID: <20140910181701.GL7960@sirena.org.uk>
References: <540C7F5B.6070307@gmail.com>
 <540C83DE.10505@collabora.co.uk>
 <540C8577.2070907@gmail.com>
 <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
 <CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
 <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
 <20140910143144.GF7960@sirena.org.uk>
 <CAOesGMgn7F7UoGJmO6K74KE_x+Rw8H2MpzCjBjNOq0g9o1TuNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z9sQuz+HmDh2hVO4"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33498 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752980AbaIJSR1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 14:17:27 -0400
Content-Disposition: inline
In-Reply-To: <CAOesGMgn7F7UoGJmO6K74KE_x+Rw8H2MpzCjBjNOq0g9o1TuNg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, Doug Anderson <dianders@chromium.org>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Prashanth G <prashanth.g@samsung.com>


--z9sQuz+HmDh2hVO4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 10, 2014 at 09:36:32AM -0700, Olof Johansson wrote:
> On Wed, Sep 10, 2014 at 7:31 AM, Mark Brown <broonie@kernel.org> wrote:

> > As well as the regulators we'll also need to fix the clocks.  If we're
> > going to start adding these fixups perhaps we want to consider having a
> > wrapper stage that deals with rewriting DTs prior to trying to use them?
> > I'm not sure if it makes much difference but there's overlap with other
> > tools like the ATAGs conversion wrapper and building separately would
> > let the fixup code run early without directly going into the early init
> > code (which seems a bit scary).

> I'm strongly against doing this outside of the kernel, since they're
> closely tied together today. We've always had the quirk tables for
> devices in the kernel, and we used to do this a long time ago on
> powerpc as well (we did it before we built the flat DT out of the OF
> equivalent there, most of the time).

Indeed - sorry, the above wasn't adequately clear.  I think that we
should build this separately but keep it part of the kernel source.  The
split I was thinking of was purely technical.

> > As far as I can tell the problem here is coming from the decision to
> > have simplefb use resources without knowing about them - can we agree
> > that this is a bad idea?

> As already argued, there are good reasons to sometimes allow this, as
> long as it can be expected that it's something that's just used during
> early boot. For example, having DEBUG_LL output on a pre-mapped
> framebuffer could be really useful. Once DRM comes up, it'll tear down
> the existing one.

The problem here seems to be that that just during early boot assumption
isn't playing out so well...

--z9sQuz+HmDh2hVO4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUEJWaAAoJECTWi3JdVIfQPKAH+QGMFAzlIbyo1eL82SAD72vm
S6lCyyeHNcl3W/C92czss8vSVuR5/K428l9lvEQohrMN4W1GVo1m+GQ59ftDvwrd
wOKZnXcuDMR90re2AFb4WoGAl/W0svtbDQrBlKeivyr8lHCWtRrHmLI6PfJgd+En
SkKVgpDZ2meEu9/ZtmSfud8mIGKCTylpZnfvOa1rVE7mfbBnEy7bSWkXywN2Q0m8
lx12hHUyDd2gucw7jZZsxElhAfb7/NRlgiwekBcPvqs/L47QKNmRNtob5g8FKSeF
Y1VlAqkKoDD+eyMj6a9A1HkpW1OxA/l/VoDW8vybSKfvIbx901m4/72+iIJvYjs=
=gS6h
-----END PGP SIGNATURE-----

--z9sQuz+HmDh2hVO4--
