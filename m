From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] regulator: s5m8767: Remove regulator_dev pointer
 from state container
Date: Mon, 7 Apr 2014 13:42:51 +0100
Message-ID: <20140407124251.GF14763@sirena.org.uk>
References: <1396872924-14675-1-git-send-email-k.kozlowski@samsung.com>
 <1396872924-14675-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JCYGd/UpHK4EX+A4"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44364 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754650AbaDGMnC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Apr 2014 08:43:02 -0400
Content-Disposition: inline
In-Reply-To: <1396872924-14675-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>


--JCYGd/UpHK4EX+A4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 07, 2014 at 02:15:24PM +0200, Krzysztof Kozlowski wrote:
> Don't store pointer to regulator_dev returned by
> devm_regulator_register() in state container. It isn't used anywhere
> outside of probe.

Applied, thanks.

--JCYGd/UpHK4EX+A4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTQp1IAAoJELSic+t+oim97m0P/RgrqfR8lOZIlGgzg9spvf7r
y2ZmW4KmQT2gqbQOIj7R0S/cb95nf+ABx6VId1YQL0O6bMYxnPFYvHINIIrspm10
Kg4q9GhSMW9gQzV9UTDqaHykhs7crDBdr0NQHpnFYZSAtUPd1N0FfThGaEHOHbiI
VoNQ1gkGTgSQd4b2jyKBCfsxH+/BLKV4dbSe3QRER3qC6Vxhui/UsKaZQrSbi8Jn
nZOVvmuqIb0uc/shfG/uxKPbyNxxlt58+eAvmQSsyEOFF89pN67bL3mCh7/p5BbS
PhyfuJK7JR+WU4yDnoWVsGSc/Blut9bxHbBUtsITRw9YiDf7LS+mBzaXC3GVEU8u
7xJCdY2JPHXnKLbsITWLiDjKAUDxMLBVCFjNewLFhdfcQD+bvERrGJZ4Vvql0wzf
D1YZuYv4z7t/cW5qFZjnxALjpoQoqCHkhBjDWPuhpYfdDSmOytad5ZwYqvgaSrqj
ORd6PT14nbG5l/zHHYErFqbCINktDp1CByhH+A8d4yMwXW6VPZIjoX5Bu6vpi0J6
9XaxhT686NGhvwUkhHP6DxANnkEFn2QYG3N9XSBrPsX8Blq20WMYWQABnEFOzAsn
YSKPHlA4gK/nqsSa/kvMNGzTX0muolNG84YnLG1dOtuETIglbKt27dkJG4Q2rnZm
G16dMuP62MoR0FDLDAYO
=OxiB
-----END PGP SIGNATURE-----

--JCYGd/UpHK4EX+A4--
