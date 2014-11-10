From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: ALC5631: Add device tree binding documentation
Date: Mon, 10 Nov 2014 14:50:55 +0000
Message-ID: <20141110145055.GS3815@sirena.org.uk>
References: <1415606519-30744-1-git-send-email-krishna.md@samsung.com>
 <1415606519-30744-2-git-send-email-krishna.md@samsung.com>
 <20141110133708.GQ3815@sirena.org.uk>
 <E07FA6F208344BC093C8D95F677E8F4A@sisodomain.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2CmXnuBWhlSJqbcw"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56514 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753073AbaKJOwU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Nov 2014 09:52:20 -0500
Content-Disposition: inline
In-Reply-To: <E07FA6F208344BC093C8D95F677E8F4A@sisodomain.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: D Krishna Mohan <krishna.md@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com


--2CmXnuBWhlSJqbcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 10, 2014 at 07:39:51PM +0530, D Krishna Mohan wrote:
> Hi Mark Brown,

Don't top post.

>     The codec driver is present in mainline as rt5631.c., Its realtek's
> alc5631 so retained that name.
> Similarly machine driver also is named as arndale_rt5631.c but inside that
> driver I have used alc5631 naming as the
> audio daughter card on arndale board mentions alc5631 so I have used this
> convention here so that user should not
> feel the absence of the driver.

> Is that ok or do you want to have one naming all over?

Ugh, OK.  That was hidden at the back end of the series.  Please:

 - Use subject lines matching the style for the subsystem.
 - Support both variants of the device name, not just one.
 - of_match_table() is there to reduce ifdefs.

--2CmXnuBWhlSJqbcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUYNDOAAoJECTWi3JdVIfQhWgH+gMPQQKju4CX559ktRMsnunI
UOpvVTwnAzHnOqFYct1zIRoVnFIaz5kCh3gKIx1Xf5KVwkJGumdAbVxBfVG/NNn5
nC7zUn5Hbf+D7xcs2JrQpRxVb2DRHd5Ytl/suNaZUIJpkgbyRqO1wo7lssbMIMkZ
OvdmbPZutlwsCqTUqdS3k82JsnpiQFx8jumDUeqMvgxfWHqYcJ33AlcRrvc5Ip3/
YATVfUJi6NTvxvqTxK3NXTCezVeTW6rDiBPje2Q3OlXBitvbCelePuuseB2O787q
H2vz6pYcMV5ryv681NkrrPM9tM3VaCJ5WJdn0hucEiux1billVBtucBOTQe6YxU=
=KXO1
-----END PGP SIGNATURE-----

--2CmXnuBWhlSJqbcw--
