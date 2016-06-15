From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 4/6] ASoC: Add DT bindings documentation for max98504
 amplifier
Date: Wed, 15 Jun 2016 10:25:50 +0100
Message-ID: <20160615092550.GV2282@sirena.org.uk>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-5-git-send-email-s.nawrocki@samsung.com>
 <20160613153227.GJ2282@sirena.org.uk>
 <57601F72.20001@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BtV3mSscmI0cqW3r"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39112 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889AbcFOJ0B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 05:26:01 -0400
Content-Disposition: inline
In-Reply-To: <57601F72.20001@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com


--BtV3mSscmI0cqW3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 14, 2016 at 05:14:58PM +0200, Sylwester Nawrocki wrote:

> I suspected these don't belong here. I'll add a DAPM control for speaker
> source and will learn about the TDM API. I'm inclined to simply omit
> the PCM Rx channels configuration feature for now, as the MAX98504's PCM
> interface is left unconnected on our board.

That works too.

--BtV3mSscmI0cqW3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXYR8dAAoJECTWi3JdVIfQvqEH/2upYadZfg/aOAX3UUnDVqIv
Zmcxs8yLh2tscylArDFQRt1ipYJ8xtwsvvQjIIafAh61vWLrZ5kC+1/h1btGpolc
i30cHwG/1g92y4vaCwRf9JGhjPjiP1lk1/wW51jjWs365GOo/RNfoxivjAh36BOl
0f2SwLW8e960GjMfKyjHKtF3zf+RnBtB1b5V5YERvrnvQjUSBzo3VvNMONfiF10o
M/22AzDSMxcuQm48LVe5nB0GztgxJe56yz7G1tjRHqDVUZEINYIQCbsp2323mZON
2RJrIWrMgREkGG6cFgos+zi7oD4MaCVvVXW51Su/M1MhYyxhnhjoHrS2HZvxemo=
=eVV2
-----END PGP SIGNATURE-----

--BtV3mSscmI0cqW3r--
