From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] ARM: dts: Leave Exynos5250 SPI controller disabled
 by default
Date: Thu, 12 Sep 2013 14:50:28 +0100
Message-ID: <20130912135028.GR29403@sirena.org.uk>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
 <1378982427-5802-2-git-send-email-broonie@kernel.org>
 <10382663.35TJtu8bGt@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XfgxuImQih7pKHD1"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58045 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750901Ab3ILNui (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 09:50:38 -0400
Content-Disposition: inline
In-Reply-To: <10382663.35TJtu8bGt@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org


--XfgxuImQih7pKHD1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2013 at 01:56:44PM +0200, Tomasz Figa wrote:

> I wonder if exynos5250-arndale shouldn't be also considered in this patch.

There are no SPI devices on that board (at least not ones that are
currently instantiated by the DT).

--XfgxuImQih7pKHD1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMcahAAoJELSic+t+oim9vGcQAJ1yXG/0Nl3/7nHDCutWRjOQ
oKG+DeeMC/hu0qZ+MoEAxDg0ofdLk6l5Szbrkzp6X60nB7WGXodaRe2dSwBuT++d
hh5jtB8Siu0VsyzOx4k/Q1cSMQY8/1ZGXMj3jUGxxn2GaikFGqZp+PvqVhJKxab+
D2EpL7XsQcMF5uLabbjnRpBr407/2bz0ZuH9kaMLYHFcxSQRFxBWU/+ijpdtxSkm
Vk6sY2wUpaLc1Jl0M9ktWifeRflIaNZj9QgK2xz4vdcJg3JcN45BDBKrC6CEwrC7
zHh+r0p6OBIKogjZ95ElPbl+0LDMQbmlWGvbHZWIhPviShYRRUSWJOKRe2bUQLbF
mzwNC0P3HjKuV2sjqxnKvREyaIxZ/FkOmlZJA07aonfMV+liShBhFemlblv7xhmm
r26/tV5bqL5jJbASu+pn7Bx0UnryKAy+Mt603ODVh1dqS28UWEHEiDqSot8PsBp8
MeIn52ROQbsG7qQhR7W1F/ro1JLPiNfPfZQ7Eyv4v/egYfk/AkcM7COdsAOLJ+hG
pzh1uqn2gd/l2TRVMrftC9KARcykYwd/0OA5V7EOQr0enccCRf+npw6D+OQtlapd
I709k0Ep5I0Df+sQaOlsej/gzJ00A7V6cP/lnjFZFcTPzlvZQC54lAKr9ikWyoe3
CMi978p76M1eI0aEp+oC
=IwAY
-----END PGP SIGNATURE-----

--XfgxuImQih7pKHD1--
