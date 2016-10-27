From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/4] ASoC: Drop
 SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag
Date: Thu, 27 Oct 2016 15:23:05 +0100
Message-ID: <20161027142305.GM25322@sirena.org.uk>
References: <1477408121-24716-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20161025150901epcas5p39c8cc9b980e71ee184fd831ad854a046@epcas5p3.samsung.com>
 <1477408121-24716-2-git-send-email-s.nawrocki@samsung.com>
 <a06af81c-32e0-69d9-1653-0154616b8dc3@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x38akuY2VS0PywU3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:42378 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942652AbcJ0OX2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 10:23:28 -0400
Content-Disposition: inline
In-Reply-To: <a06af81c-32e0-69d9-1653-0154616b8dc3@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, krzk@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>


--x38akuY2VS0PywU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2016 at 01:21:21PM +0200, Sylwester Nawrocki wrote:
> On 10/25/2016 05:08 PM, Sylwester Nawrocki wrote:
> > Since commit 194c7dea00c68c1b1f8ff26304fa937a006f66dd
> > "ASoC: dmaengine: add custom DMA config to snd_dmaengine_pcm_config"
> > custom DMA channels can be also specified in chan_names[] field of
> > struct snd_dmaengine_pcm_config.  This patch removes chan_name field
> > of struct snd_dmaengine_dai_dma_data as it is now unused.
> >=20
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>=20
> I'm afraid this patch needs to be reverted :/ I didn't notice earlier
> the Samsung AC97 controller has 3 substreams per a platform device and
> this cannot be handled with struct snd_dmaengine_pcm_config, which
> allows to specify up to 2 DMA channel names.

Can you send a revert patch with an explanation though...

> The AC97 driver (sound/soc/samsung/ac97.c) seems to have been broken
> for a long time as it currently doesn't have the channel names
> specified at all [1].  It seems in order to fix it the best would
> be to restore the feature the $subject patch removes.

=2E..if the driver just doesn't work and hasn't worked for a long time
perhaps it's better to just drop the driver?

--x38akuY2VS0PywU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYEg2IAAoJECTWi3JdVIfQwLUH/jsghczwE0b6coAkETEk3Lsw
AhUf4Gm9YF02SCSOjrmPpvKQvq/ZmrEFddW01dPCYpF4k4WDS7oKaXr7udXg7yk/
7kTBFsMrSqcqSSrGDFyj+sVskBoOs3Tq9KYiIt72CXCe0JLrMPoCdhoc2WH4fuqS
/+koHrg3caeOE4ottc7M4WVjiVi5KPdQegzjmpiMvsBG3iSbpjtLmldcVCmWXGCg
W1BOkS8qBzSf0lm8XZaEq3IJDJ6pBsuyBUakvIRLaETUJleclWbb/uynTEtaUtXZ
ODD4HZLLhY+IKaw5GYR83soP08Ubb6KjyKU4CZHR089GiPDYFZEtibdGu7dYqd8=
=RpQb
-----END PGP SIGNATURE-----

--x38akuY2VS0PywU3--
