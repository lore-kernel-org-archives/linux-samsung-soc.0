From: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: samsung: Provide helper for DMA
 init
Date: Mon, 9 Dec 2013 17:17:20 +0000
Message-ID: <20131209171720.GX29268@sirena.org.uk>
References: <1386253559-18262-1-git-send-email-broonie@kernel.org>
 <CAAgF-BdD_DONQYPOenMwBmc6N+EOJQ3TwJz1hpG2qZVfzhR63Q@mail.gmail.com>
 <20131206112708.GD29268@sirena.org.uk>
 <CAAgF-BcVqUt7wnYiDxWNsyo79JoZqiSCc=z7obRptXmdx2Ht_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JrKXExVCTktVujz6"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58903 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755766Ab3LIRRZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 12:17:25 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-BcVqUt7wnYiDxWNsyo79JoZqiSCc=z7obRptXmdx2Ht_g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org


--JrKXExVCTktVujz6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2013 at 05:30:47PM +0530, Padma Venkat wrote:

> This is required only after your changes because in dmaengine we are
> requesting the dma channel statically but in mainline(with samsung
> proprietary ops) we are requesting the dma channel at run time during
> playback or capture.

OK, so it does get set somewhere but not here?

--JrKXExVCTktVujz6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpfsdAAoJELSic+t+oim9kP0P/22I8H03YHdY7qcWX1/PH9VL
Y4+CFeMDXV1vZcjjo8EqGOjoV1Fq0qllwO0KVgppBozpqCRTYael9jnyaEo/XNxQ
/jxP4XJF2wP/Wr9pmqWutwTDLyB2nH5cuX7vIvbI2AEz2ONEBoYbZdXb1Uwu3F+v
fMMdT2u/kmN/RqcV/fCwtbfbBMvFu3JPSxFKCWImTJIhqAxydbxZjzwwGYOgL9Cw
s7dKgCbE7tzkNwC5Ej+lEozzGuGByIMjHwohfWTCjjghEyDCi1oRvK+RbodL/ZWq
oVu4re10Rmgz2aQeTQSa4LXpo3nDPeIP4vBHMa9BIvQEYzLQKVSZohrPJ7eSo6gq
0cacqRCH7zvYKKeKaYX0epgr3r+f9jdcV4E/XeidwKDheqVg3GTE0A7BRf5yPHRk
LGN4nOkpQbwXego/azqPPoUw6ZnUXK3qq4vbf7LdCcWNrAO7u0fP3uAOpC+eop64
D2+OQX6fN8wwgh3d3PZv8WNRH+c3VMHfUdPWrVSrrkDRVU3n3fMjnhjhK2mDrq9G
2vqhjFOq3itmWtK476c6/S8ZAOceRlmcR4w6ScBtwd2tHgpj8aJIejl31cDclHqR
irDJ3zhfUgrdBKmBhO02BEad+r0P8u5T7oRo59llQofefOjQDdNQd9vULepJg/iw
f98YlcxSK5n8tnXhM/Ws
=84cO
-----END PGP SIGNATURE-----

--JrKXExVCTktVujz6--
