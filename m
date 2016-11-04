From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 4/7] ASoC: samsung: i2s: Do not use platform_data for
 DMA parameters
Date: Fri, 4 Nov 2016 11:13:22 -0600
Message-ID: <20161104171322.rzkl4hfim6goxcro@sirena.org.uk>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
 <1478276094-19135-6-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lbis36xuqt2jjox5"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58834 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755610AbcKDRNk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 13:13:40 -0400
Content-Disposition: inline
In-Reply-To: <1478276094-19135-6-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, kgene@kernel.org, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com


--lbis36xuqt2jjox5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 04, 2016 at 05:14:51PM +0100, Sylwester Nawrocki wrote:
> All related platforms use either devicetree or the DMA slave
> map API for mapping DMA channels to slave devices so we can now
> stop using platform_data for passing DMA details.

Acked-by: Mark Brown <broonie@kernel.org>

--lbis36xuqt2jjox5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYHMGxAAoJECTWi3JdVIfQONoH/REljyZrJH6NNyQwloRZUctu
T+fJzEI9EE2pBO/+HQnCEwH8SHlM30RzstLvH/n335SXk12lfT1tzWe5IcpvjQv6
HlCvCYAydscBhc4/o3RGfEr/kt0Dq7odg1qsX2eUTgTTvqfYrY5DVcmohOR/oYm2
c0hCx0pnsJbC6pWMzPwSy2wzTHavlGlmBCQUtB6GCZJKDD85Fsrc/8Fv+nxJVyzt
o68mXpJUfxqnA9Dm2gKJ9R+V2gzAWXfgpu6X6vBu6+ph8fGusIsmfKyhdLLiWeIu
1paKbzgNgGUHImbyp1EvqlSzleP++MhnYT3a6qv3gUQLD4CnyQ3/a/EG+hfh/RI=
=Mp1F
-----END PGP SIGNATURE-----

--lbis36xuqt2jjox5--
