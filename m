From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: s2mps11: Remove unused set_voltage_time_sel
Date: Mon, 18 Apr 2016 12:00:01 +0100
Message-ID: <20160418110001.GS3217@sirena.org.uk>
References: <1460965378-5256-1-git-send-email-k.kozlowski@samsung.com>
 <20160418095713.GO3217@sirena.org.uk>
 <5714B8C4.5070207@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HywJcj55HbA57jnN"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50990 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753553AbcDRLAL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2016 07:00:11 -0400
Content-Disposition: inline
In-Reply-To: <5714B8C4.5070207@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


--HywJcj55HbA57jnN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 18, 2016 at 12:36:52PM +0200, Krzysztof Kozlowski wrote:
> On 04/18/2016 11:57 AM, Mark Brown wrote:

> > That's not the bug, the bug is that the driver is providing the
> > operation without providing a non-zero value for it.  The device tree
> > configuration is to override what the driver is doing.

> So your recommendation would be to set the ramp_delay value in
> regulator_desc structure?

Or at least fix the changelog to describe the problem more clearly.

> The problem is that value of 30 mv/us in datasheet looks untrustworthy
> (copied from other pages) and vendor kernel (which should be a
> reference) uses 12 mv/us. Anyway setting any value greater than 0 seems
> like better idea than just sticking to 0...

Yup.  Probably the more conservative value is going to be safer.

--HywJcj55HbA57jnN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXFL4wAAoJECTWi3JdVIfQ19UH/jwzcEev73SrFAxjvcs7P+ks
7rap5iTP3R2Fe7cphfIjyG0JnJmXaVgVEqOgL+sdS2ldHZg6pCsz5boGkj76CVch
MyUKalWkL+0tCEHWBVbo/5m93gun8b8pswYZ8MJQ8ZojV48QS3CdDmBXCKg2Yfg6
jmoP7KkscpBGySCXOMTh3ej6Dje0wHzKoIKaGkSzfWXbmNkJAgoA8foxq+Scxdmm
FOLFwp1F3LUI3h1fsqy+WYr/rlbf08pM3mDIIlJG8V59QydEShVR5rsLjjb1zwNm
9izt/hSPjYrEF2duWsbWl8f/6nauXdTMFiwsrUYD2YoNeZNsEcxxqI+OhNSSeng=
=iHT7
-----END PGP SIGNATURE-----

--HywJcj55HbA57jnN--
