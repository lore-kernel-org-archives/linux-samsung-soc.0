From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Thu, 11 Sep 2014 19:03:22 +0100
Message-ID: <20140911180322.GP4015@sirena.org.uk>
References: <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
 <CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
 <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
 <20140910143144.GF7960@sirena.org.uk>
 <CACxGe6u=QkGTKGfaE_jJ5VFMhdVKQNggp3qVBUgNP7rDbZss_A@mail.gmail.com>
 <20140910153919.GH7960@sirena.org.uk>
 <CACxGe6uBcTPMh4p=oi7m_TVpjUrkgbQvxbStAn27HXEJxYe5fw@mail.gmail.com>
 <20140910165723.GK7960@sirena.org.uk>
 <20140911092233.CBC5CC40738@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O27Gs9jTTFWz3gAR"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35324 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042AbaIKSDx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Sep 2014 14:03:53 -0400
Content-Disposition: inline
In-Reply-To: <20140911092233.CBC5CC40738@trevor.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Prashanth G <prashanth.g@samsung.com>


--O27Gs9jTTFWz3gAR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2014 at 10:22:32AM +0100, Grant Likely wrote:
> On Wed, 10 Sep 2014 17:57:23 +0100, Mark Brown <broonie@kernel.org> wrote:

> > It's not quite as simple as just disabling PM - for example in the
> > clocks case we've also got to worry about what happens with rate changes
> > (which is going to get more and more risky as we get smarter about being
> > able to push configuration changes back up the tree), regulators have a
> > similar thing with voltage changes.  With simple enables and disables we
> > have to worry about things like handling users who actively want to
> > power things on and and off but may potentially be sharing a resource
> > with an undeclared dependency.

> I think we can be okay with the above. This is a best-effort situation
> where we don't want to tear down how firmware has set up the board if
> it can be reasonably assumed that something depends on it (simplefb).
> However, if clocks or regulators are shared with other devices and those
> drivers ask for other settings, then there is simply no recourse. In
> that situation there must be a driver for the video device that takes
> care of any constraints.

When things break I'm not sure that users are going to understand that
something that used to work for them was only provided on a best effort
basis, I think they will expect things to carry on working.  It's not
going to be great if enabling some driver for a device that happens to
be in the same power domain as a component used in a framebuffer causes
the display to vanish, or if better power management in an existing
driver causes breakage.  It's relatively OK to have a brief hiccup
during boot but usage seems to have expanded beyond that point and I
think we need to take robustness more seriously.

Given that we have straightforward ways to communicate resource usage it
seems sensible to add robustness to the system by making use of them.

--O27Gs9jTTFWz3gAR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUEePqAAoJECTWi3JdVIfQ7DoH/1HMb4rl9GM3pqpiEkbp817g
bG50fz3l6fxxbWmf6y9odQ6VG96wg4WugZwXJBUXtSwXKcEFIxTGHnt2VQ0YTHuA
v3iV/KjFGkzA9q/acXr/AIPsYKwSR84rUKWfUtmYUUJHBwYBTve3hY8yj2dBUwTX
ER/slZzxvCP+dKuLRp0sZ98L3m3FQMM4HMZDsqko0V+pu70G1pID+go6rrrF4+IF
9SXg6pbs0xrf+2qpHqdl47VCdVObyJ3Ier6Z/397k8U4xWMgxXuTKWYT+lnq5zSX
X/EEpaqcw8lt00mG394HdNaf1lKPrZQrQPaF06VqzRu/tdYJeYgmUl1PPaaP7C8=
=1DQg
-----END PGP SIGNATURE-----

--O27Gs9jTTFWz3gAR--
