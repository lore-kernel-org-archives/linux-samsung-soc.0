From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: samsung: i2s: Use specific name for i2s dais
Date: Fri, 1 Sep 2017 11:17:04 +0100
Message-ID: <20170901101704.bkitbx5udvmoiutk@sirena.org.uk>
References: <20170828100102.17591-1-jcsing.lee@samsung.com>
 <CGME20170828100105epcas2p18b821aec5caf1d690c33c2b1426d1a17@epcas2p1.samsung.com>
 <20170828100102.17591-2-jcsing.lee@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lioiphepqqcz5xms"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43948 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751791AbdIAKRn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Sep 2017 06:17:43 -0400
Content-Disposition: inline
In-Reply-To: <20170828100102.17591-2-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, galaxyra@gmail.com, Chanwoo Choi <cw00.choi@samsung.com>


--lioiphepqqcz5xms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 28, 2017 at 07:01:00PM +0900, Jaechul Lee wrote:
> Add specific dais name when components are registered. Component and dai
> name will follow their parent dev name, if the name isn't described.  In
> case of this driver, each dais will have same name like '11440000.i2s0' by
> fmt_single_name function.

This doesn't apply against current code, please check and resend.

--lioiphepqqcz5xms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlmpM50ACgkQJNaLcl1U
h9C6dwf+NQ8ruKXo6gK37d84X19TV1GKAmt5F8SSAelf4HCvXRlC/hkJKaWndA/d
umIB2tr0BtCEnDEATztxZn18E1P+SkpDuqeKzCsrluRyC+6TZGjCCF8VLCabWhd2
GgwHzb8d07tAA0pr5hQptcSkoOl5jRY9zTuE5SoyAltVmkR57qSGEkj2MrqAr6tT
3az50uQ//Nz3hDd5ITDlX7LRlgWrLZHkOjkCBOL3F/7QThK+HS6IrMq1ZrAMNS1N
gWi6gJw3d0308LLvVR9s5P9B+cyU9neZPjmUHoFJ5/XgC2ReGf/fhIzfbXcJdtrH
3olWdTR/kAfgTBF7YsYi/ZPakmVvqw==
=W/BC
-----END PGP SIGNATURE-----

--lioiphepqqcz5xms--
