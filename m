From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND 7/8] ASoC: samsung: s3c24xx_uda134x: debug/error
 trace cleanup
Date: Fri, 5 Aug 2016 11:03:43 +0100
Message-ID: <20160805100343.GO10383@sirena.org.uk>
References: <1470390429-30902-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5FetH82qe0Z6y/zI"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54796 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799AbcHEKD5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 06:03:57 -0400
Content-Disposition: inline
In-Reply-To: <1470390429-30902-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org


--5FetH82qe0Z6y/zI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 05, 2016 at 11:47:09AM +0200, Sylwester Nawrocki wrote:
> Switch from pr_* to dev_* macros and drop some debug traces.

I've only got patch 7 here, what's the story with the other patches?

--5FetH82qe0Z6y/zI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXpGR4AAoJECTWi3JdVIfQ79UH/iTaFVb3O99hDHo43s6Yo2dQ
8On9rrQOW1RfAmnPj/95qywJnuYrS1lgpqL5f0FWlPX4bTLF7UtvNRon3tZ7RJft
DiAiJlqtCJIJQsuhDanvQe7YwtTtrTi0gI843hBgYrgT/2GcQzL6onupNkCw0fHV
1zvqQ1Q30MMoHk6GoqIYCfhwrfcLvrS5mEIXkxBUz2tAUYWO5PqFP0egxUAalibI
UGU1dHpUDHjtGVx7IOit3a8OWM2XRC7W8foSDnS5+M/IoogN0NOi+l7LiziaV17N
2MOYfccfUyKn1KZIgB9FuOgj+PznV4iqT5DTryz60HIGBvahYkDXoH1SCpjFWYM=
=cum7
-----END PGP SIGNATURE-----

--5FetH82qe0Z6y/zI--
