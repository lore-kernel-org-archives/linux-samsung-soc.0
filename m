From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: samsung: clean up references to outdated
 Kconfig symbols
Date: Sat, 14 Feb 2015 12:22:55 +0800
Message-ID: <20150214042255.GA9110@finisterre.sirena.org.uk>
References: <1421664067.9655.51.camel@x220>
 <20150206235044.GO31311@finisterre.sirena.org.uk>
 <1423298284.2246.5.camel@x220>
 <20150209060704.GB19229@finisterre.sirena.org.uk>
 <1423646498.21685.35.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423646498.21685.35.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Valentin Rothberg <valentinrothberg@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 11, 2015 at 10:21:38AM +0100, Paul Bolle wrote:

> TL;DR: what exactly should I resend and when?

This is disappointing; you're someone who's been contributing for quite
some time now, I'd really expect you to be faimilar with the process of
submitting patches and able to identify answers to your questions.

> > What's posted doesn't apply against -next.

> That's because of trivial conflicts with commit a59aa180ea56 ("ASoC:
> samsung: Replace depends on REGMAP_I2C with depends on I2C"). That
> commit landed in next-20150127 (ie, eight days after I sent this short
> series). I guess I resolved these conflicts in the local version of
> these patches and promptly forgot about them, as they were so trivial.

For something like this I'm just not even going to look at what's
required to fix up by hand, sorry.

> > As ever submit against the tree listed in MAINTAINERS

> >    git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

> Which is not entirely obvious, since this series only touches files
> below sound/soc/samsung/. That directory is mentioned in MAINTAINERS
> under "ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" and under "SAMSUNG AUDIO
> (ASoC) DRIVERS". (Why does that directory need two entries?) Neither
> entry mention a repository.

Of course neither of those entries list me either yet you managed to
figure out that you should send the patch to me.  The same process that
helps you identify that things should be submitted to the subsystem
maintainers should allow you to identify where they're likely to try to
apply changes.  Or simply looking at how other similar patches get
merged.

> And now I wonder what I should resend: the three patches 2/4, 3/4, and
> 4/4 with the trivial conflicts resolved or the entire series? And when
> do you prefer I resend?

Again this is something I'd really expect you to be familiar with.  As
ever if there are changes you would like to see integrated into the
kernel then please submit them using the normal patch submission
process.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU3s2eAAoJECTWi3JdVIfQfh4H/jM8fa4kDiAXAxmCQCNKEwsG
lf82YS1B9sX8nM4nZr4oNvL2+JtY4bePdfaovPVYoRwYS14ENTGCJmqP9ec/3o+7
w0pUroy0YEEUBs4O1Kc4YiASDZRq0KGoG/NS29CrgYAuezWaE2PYxGySYPpXhJq0
zxFH1A906EUo7RRu6SvOq4zVlxlTUu99lBdGv0Yvz/syfI5TL/ZdLv7wMCrs11hu
st/sSvqTyz/JFY+6fJwm6/mPWoo5HdOfu92lyNiCiB4UDAbbcIq7cor85tNcwMO8
yX6AvylalYWAVssqD+ZuwIN3ZzNFA34LqUVLskipW66HY95aa4YQqpZfPXFt9v4=
=bCF0
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
