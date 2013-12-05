From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Initialize the dma_data for secondary dai
Date: Thu, 5 Dec 2013 11:50:15 +0000
Message-ID: <20131205115015.GP29268@sirena.org.uk>
References: <1385632932-16579-1-git-send-email-padma.v@samsung.com>
 <20131128113800.GB27568@sirena.org.uk>
 <CAAgF-BdqRzB5MxTf_9nZkgSOY=F6dGAs0yhTkNHqrUQLonFAsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aE2Tjr+Wh4rS13mJ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:43159 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753801Ab3LELuk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Dec 2013 06:50:40 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-BdqRzB5MxTf_9nZkgSOY=F6dGAs0yhTkNHqrUQLonFAsw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, lars@metafoo.de


--aE2Tjr+Wh4rS13mJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2013 at 04:33:19PM +0530, Padma Venkat wrote:
> On Thu, Nov 28, 2013 at 5:08 PM, Mark Brown <broonie@kernel.org> wrote:

> > Why don't we need this fix for mainline?  The dmaengine change is just
> > moving the initialisation through a layer of indirection but there was
> > initialisation anyway.  I'm concerned that there's a bug that ought to
> > be fixed for v3.13 as well here.

> Yes. We need this for mainline. Not dependent on your dmaengine changes.

Ah, just saw this one - I'll cook up a version of it, due to the
refactoring the change doesn't apply directly to v3.13.

> >>       return snd_dmaengine_pcm_register(dev, &samsung_dmaengine_pcm_config,
> >> -                                       SND_DMAENGINE_PCM_FLAG_COMPAT);
> >> +                                       SND_DMAENGINE_PCM_FLAG_COMPAT |
> >> +                             SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME);

> > This is already done.

> Should I send another patch by removing this flag from this patch?

No need.

--aE2Tjr+Wh4rS13mJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoGh0AAoJELSic+t+oim9320P/ilvkvmQ0JLX5Avox9MURpU2
ZZ4wc5E/6ubg7wK5mkoy3qSYJJD43CsV7XwvD4FOOOmUyANBTNZfhwtQaBr+nf8y
wlviH4Gz/jD0JryRjgqmMm0MEUCBFVNzqYJi8FGAj0i6M6fy5l0YL9Emwzy6Xm5O
6OSphNwSwDuHvJ5UQ1xU8+WiRSxLg/XTlGA/cNEUCq475L3MK+llcd4SQNtZRc8K
gVfnIFFvNy2l0DktNQGJdGbdW1bjpDpgxV+LGFGb6Wzhf3kZYjZLWoal4YtEKz7w
+HJ673isdYWAcFw1KpXabzl1GPScpKwICuKRFFg49sr53UTU+Po6qMRwQc8RJtvM
C+D3XNYqJItxJzpGRlpFtIb2m3rOcdfJrQGewpK1cks9l1VpQkmSp47b4VWWZzlc
PECwFqsT/mKyW1QU7RI1RbQTlgAP6VAjztsJHyGV2dss6vHfxAMTNbYaCSRWUKqV
KGpFBd5vwNoi1/pr5lxjqLUC9cof/WXN8p/1giZqrXKEtR/Ufe4pjszFAUNFSX9E
w2s7NO5jAUU2RMc6RX4Wd8XQ3EGnxjcTUYFLL93zxY3zV3OBFaKfG7A6cPoKDSee
ns3O2aTJaXQBjsUi2eaXPhgSX5r/FsqK9Wu182urrouXvuCwxw3+Y/W1qs6x8Xcv
b+lliJ7kPBJcIRHGBucV
=mqoX
-----END PGP SIGNATURE-----

--aE2Tjr+Wh4rS13mJ--
