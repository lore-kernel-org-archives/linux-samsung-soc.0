From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Mon, 29 Sep 2014 17:37:57 +0100
Message-ID: <20140929163757.GU16977@sirena.org.uk>
References: <540C8577.2070907@gmail.com>
 <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
 <CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
 <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
 <20140910143144.GF7960@sirena.org.uk>
 <CACxGe6u=QkGTKGfaE_jJ5VFMhdVKQNggp3qVBUgNP7rDbZss_A@mail.gmail.com>
 <20140929125716.GE26008@ulmo>
 <CACxGe6uDYNOuhgM_5iQTp=iB4X-osSz8WESiUb2QGj5ZmWFp-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qpPEP5KwiTnADq8L"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53082 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754059AbaI2QiJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 12:38:09 -0400
Content-Disposition: inline
In-Reply-To: <CACxGe6uDYNOuhgM_5iQTp=iB4X-osSz8WESiUb2QGj5ZmWFp-A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Thierry Reding <thierry.reding@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>


--qpPEP5KwiTnADq8L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 29, 2014 at 02:12:43PM +0100, Grant Likely wrote:
> On Mon, Sep 29, 2014 at 1:57 PM, Thierry Reding

> > Though there are two cases: one is to use simplefb as a means to have
> > early boot messages on a graphical display (and optionally hand off to a
> > real driver). The other is to use simplefb as the only framebuffer
> > driver until a proper driver has been implemented. The latter would have
> > the disadvantage of not allowing unused resources from being garbage
> > collected at all. Then again, I don't think power consumption is going
> > to be a very big issue on hardware where no proper display driver is
> > available.

> When simplefb is the only framebuffer to get a platform working, it is
> reasonable to have a placeholder driver that grabs the resources and
> nothing else. When a real driver is implemented, and merged, the
> placeholder driver should drop compatibility with the device node at
> the same time.

I'd thought there was some objection to doing this?  It does seem like a
sensible approach.

--qpPEP5KwiTnADq8L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUKYrlAAoJECTWi3JdVIfQNEQH/31xmpsweDNNkodldrDB50N3
T1L2btHWUtuRdfxEaOh8hVvABI9ZXXzR6k7m6kFHwmroj1ad5s9duOGf4vbOZHO/
aRnKb9ZhPQG6RopvRb30B74MJTaAWJgvHr3oZ1n0UoN7RQDSgVOaWuwb+WgJHCoQ
Kgmbp+GexW2iCPhyQxULl++7z6ggLbfO9YdaQ8cgCTzqrGm5my20u+UTT1VLM20A
jN/wd/j63XjSmMeLvSqf4kbGmc36qfhourqGdy8iBBLyZ4CPJb6bbTe2QDT30cfa
Dhv6D9erxmPsH8yryj5iQXzStl5yAewSkxReZ5R5rf+aBl/iLv/k/jwTErm+ZYo=
=ayJn
-----END PGP SIGNATURE-----

--qpPEP5KwiTnADq8L--
