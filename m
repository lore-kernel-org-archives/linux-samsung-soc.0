From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Initialize the dma_data for secondary dai
Date: Thu, 28 Nov 2013 11:38:00 +0000
Message-ID: <20131128113800.GB27568@sirena.org.uk>
References: <1385632932-16579-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37498 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758635Ab3K1LiV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Nov 2013 06:38:21 -0500
Content-Disposition: inline
In-Reply-To: <1385632932-16579-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, lars@metafoo.de


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2013 at 03:32:12PM +0530, Padmavathi Venna wrote:

> This is made based on Mark Brown for-next branch of sound.git
> This patch is based on Mark Brown below patches for
> generic dma engine support for samsung audio IPs.
> ASoC: samsung: Use ASoC dmaengine code where possible
> ASoC: samsung: Provide helper for DMA init

Why don't we need this fix for mainline?  The dmaengine change is just
moving the initialisation through a layer of indirection but there was
initialisation anyway.  I'm concerned that there's a bug that ought to
be fixed for v3.13 as well here.

>  	return snd_dmaengine_pcm_register(dev, &samsung_dmaengine_pcm_config,
> -					  SND_DMAENGINE_PCM_FLAG_COMPAT);
> +					  SND_DMAENGINE_PCM_FLAG_COMPAT |
> +				SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME);

This is already done.

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlysVAAoJELSic+t+oim9STcQAIOILSBoVzm/abmfpi6Yc97h
dQ0FBT4CtOiDvUfMdWfn+9LMNFelo+v1fe7ittLi9iB9jcaDkjliGLq4+R2YQS8r
xkgWN+ZF5lso7qzPCjJNLvpIJ1sl41qbaI6VzKy/c2UPH7N302+cJLV4wkIlAX07
aVeATYU5fjndLP0uKUqOfjbKG3Sq/qjD878w2YZWd9oOj7G2KTVwUaSuBC4SfVnu
HprDe85Knnqoan4406Db9e3uyX4VBoWJ8FJ2l8qbmIr7N/cx18Dg9JaCG6D2Qxbj
T6h/ORtlPEFcgMv5aWCSeZ1dVt0KKqHrgW++z7LmrzpBgqyO1tNINNgi+0YMlc3X
h2I0rZRuF5tY704KFgMLM6j3Ogocr0J2MK/Cm1TqjHZwCMHUxT4we692S+1BGr9/
RFZ1mMoauv3m7t+uQ2d4rGm9unSnnQfLzYWk67UgzZmqrYb+E0OMsiGDv6jfF/o2
qXKDxbxdckxHdaLObgOXkoHJw7hyns1i1i+3JxSzxBHE9MLOFNpPanGjB5kP9Ffu
QT/e3dYuepn0XTrMZnFiLX1A7N9OFY88No+EkaDk4vnDe3ZEu9+3Sd2oFQ91Wgcy
03EiYgGNXES28ZY/pu7Sco1JlP6sALMRah363xnPoe1rTa9qYZK4OyKE+RiNi597
BpGS7bySN9ryf2CSI6ZR
=cCGU
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
