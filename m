From: Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: samsung: MACH_SMDK6450
Date: Fri, 4 Jul 2014 12:45:05 +0100
Message-ID: <20140704114505.GA19453@sirena.org.uk>
References: <1404287238.12021.7.camel@x220>
 <023d01cf9720$5ed32fc0$1c798f40$@samsung.com>
 <CAOesGMjdVrOfyrF6X3KoMQxBBYzNZskUsaMaHH653LJgwqpA+Q@mail.gmail.com>
 <4203198.qV4EZfpui2@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46427 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752409AbaGDLpk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 07:45:40 -0400
Content-Disposition: inline
In-Reply-To: <4203198.qV4EZfpui2@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Paul Bolle <pebolle@tiscali.nl>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Ben Dooks <ben-linux@fluff.org>


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2014 at 11:01:52AM +0200, Arnd Bergmann wrote:
> On Thursday 03 July 2014 20:39:41 Olof Johansson wrote:
> > On Thu, Jul 3, 2014 at 5:39 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:

> > Mark is the _only_ linux developer in the world who will give you crap
> > for sending him patches to the very same email that he signs off all
> > his work with.

> > I really wish Linaro would just let him sign off with his
> > long-standing kernel.org email address instead so the rest of us
> > wouldn't have to keep track of this.=20

Me too, it's a constant source of aggrivation.

> FWIW David Miller has a similar policy: he only applies networking
> patches that are sent to the netdev mailing list. This seems like
> a good idea in general (to ensure they are getting exposed to the
> public).

Right, I do tend to insist on this as well (I also think some other
patchwork users do this as well as davem, things need to hit the list to
go into patchwork), plus including comaintainers where that's relevant.
For the most part anything that ends up going to the work address also
has one of those problems.

> Mark, any chance we could convince to pick up patches from
> alsa-devel in the future even if they are sent to the wrong
> personal email account of yours? I would assume that would only
> require a small change in your filter rules, not a change in your
> workflow.

I do look at the lists but it's very easy for things that only go there
to get missed and it's fairly low priority, the volume is very high and
obviously there's a lot of duplication from things that do land in my
inbox.  Copying things into my inbox causes duplication problems due to
things going to lkml, lakml and subsystem specific lists and alsa-devel
being moderated for non-subscribers and subject mangling doesn't help
anything.

What's more likely to happen is that I just start ignoring the work
policy which is something I've been considering anyway.

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTtpO9AAoJELSic+t+oim9CXgP/37k6EolG1DjJQUOJw9Ax3LR
QiEofSrDa+xgy7+SJOWeYhKOglaGhmRNrXpzdBXsaHO+gjqDPDDnqeuSv3axwQDp
l86hGn49MBVQ5bSYj01uOVJ5gw4YpdRyvqVMQiPhLUlicFJljW5LYYZ7xflEEQr9
zDSW2tmHJNpaVrBjnStSm/3TeQ0CwT36d+06PKRQt6vVqdMJsa1LB6oKntRYya4c
NNqGGesVNjZJu+JiqER0w5ROgzG3K+x04QxEu7zl3yjZHjUhqWx7FGlvUyqcXVUT
m+BN6txHW0DFTFEjhskwujHBSA96hnlFJq8Th1U2NnjY3CjyOwsbGogtxNG9A3Sm
6xx2lVazPcFAucF1pXBiTPkmtM35c6o39YH8+QaFDXXLRHQFVu442EE6U5ry8QyN
8gKzbcPIZdawPRHQ4HW62QI43wXG77+A3OjOEwCHnvZh8UKTotci01JkbP5bx+x/
pzHRH10WMWtlNL3i7zo3eGSrDhT7n/2/hJuwtJKh8otEWBpS2J37Yk+AYiHe1fVZ
NIXDWTMCwps0PadyvUYkFu+U0U+00yKysZ0b/wB72B3j/pBOyJknByAvsi80fZv0
cFecmcaK0hej18Vdo5yUv90WwOqEBaHtod58VRqaou7t8dOwjsR702pjLj3wBS/j
1Tj3tmv0bmqZSoJ5vUK5
=Gdbm
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
