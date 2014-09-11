From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Thu, 11 Sep 2014 17:16:23 +0100
Message-ID: <20140911161623.GN4015@sirena.org.uk>
References: <540C7F5B.6070307@gmail.com>
 <540C83DE.10505@collabora.co.uk>
 <540C8577.2070907@gmail.com>
 <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
 <CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
 <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
 <20140910143144.GF7960@sirena.org.uk>
 <20140911090608.598CFC40862@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nrM5Z5VIJgwP9LWp"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35183 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756729AbaIKQQs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Sep 2014 12:16:48 -0400
Content-Disposition: inline
In-Reply-To: <20140911090608.598CFC40862@trevor.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Prashanth G <prashanth.g@samsung.com>


--nrM5Z5VIJgwP9LWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2014 at 10:06:08AM +0100, Grant Likely wrote:
> On Wed, 10 Sep 2014 15:31:44 +0100, Mark Brown <broonie@kernel.org> wrote:

> > As well as the regulators we'll also need to fix the clocks.  If we're
> > going to start adding these fixups perhaps we want to consider having a
> > wrapper stage that deals with rewriting DTs prior to trying to use them?
> > I'm not sure if it makes much difference but there's overlap with other
> > tools like the ATAGs conversion wrapper and building separately would
> > let the fixup code run early without directly going into the early init
> > code (which seems a bit scary).

> We've already got a dt fixup hook in the machine struct, created for
> exactly this reason. Fixing an incorrect DT provided by firmware:

> arch/arm/include/asm/mach/arch.h:
> struct machine_desc {
> 	...
> 	void (*dt_fixup)(void);
> 	...

Hrm, that's in the machine descriptor which doesn't seem the ideal
place - something keying off machine ID would be nicer.  But that's
relatively speaking just detail.

--nrM5Z5VIJgwP9LWp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUEcrWAAoJECTWi3JdVIfQiw0H/0dER5qQpAylgjS9egW2EY+D
d5tMSHuvJgReqUfaIQ+s7RAYSmJsZXS/Ra+sL0MrHZh4BV0GWahYRf2pcVwhfd2o
dxhMYkNNoC0hQsGmx/4fvL+pSM7gIxvsuPXeLGP5cNQfu6nJ80E7PLZ7QG0+IS60
UuS3192t1jmNjmCKb6xcwufYUK9fIexGy1jQ73N2Lk3g+1Z5b5QzyVJ9vTK7590L
eyUrQ7kuqcVf6IUglFTuzJc1qv2Afw0RmUvTW8sE31NyQCHF1Kt/8i6U9RpbBiSv
627TIo9tn4FkyzhW9S2tjhszo9y5aVdS++8e3IIDK6ZyAdlxaeHXTEAP1XX9l9Y=
=atGB
-----END PGP SIGNATURE-----

--nrM5Z5VIJgwP9LWp--
