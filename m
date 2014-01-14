From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ARM: S3C[24|64]xx: move includes back under <mach/> scope
Date: Tue, 14 Jan 2014 14:10:10 +0000
Message-ID: <20140114141010.GK15567@sirena.org.uk>
References: <1389707618-17011-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="08ATZu8fEq0x2T3M"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53983 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751367AbaANOKd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jan 2014 09:10:33 -0500
Content-Disposition: inline
In-Reply-To: <1389707618-17011-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko Stuebner <heiko@sntech.de>


--08ATZu8fEq0x2T3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2014 at 02:53:38PM +0100, Linus Walleij wrote:
> When refactoring and breaking out the includes for the
> machine-specific GPIO configuration, two files were created
> in <linux/platform_data/gpio-samsung-s3c[24|64]xx.h>, but as
> that namespace shall be used for defining data exchanged
> between machines and drivers, using it for these broad macros
> and config settings is wrong.

Acked-by: Mark Brown <broonie@linaro.org>

--08ATZu8fEq0x2T3M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS1UU+AAoJELSic+t+oim9D+8P/3aTdxwERDrtKwVBECp5Tt9Y
tp8p0Qtp0rLjo3LTj9THKemPDdNZo8uNDmYFLBVduNuCNuWgJ132OQSCYgDD46Ws
6mLoEhAVN5786LmaNNJqU9pkpIkaVLD5cwvieQAXdQ4Il8PedDVXj63ceGyj/bTe
DYd4ToqSmz6EvUMoHty5m7AHiCUfcvt6zZ02PBHEFHSLGCgpzj5mCKV/7U+g1kJm
HKmnDFSoNvs5hrUpNKTL/9M1/4CWWu3IEoprZgRkVp8m7+jFe1jo3UTV8p50e/yZ
dB+FKFl4jvZS7gZveQeBTC7trQJcjpBPNNaY2noX4sASTiOMW975WCdL85eVJ8xT
kHuWexW+OpmrPaGRuSO1IAasf2iMNJwAWjc/UEj1bd/kPCzPIDx7xAVoSQR8pnK1
+PBnrI/A+ci3lfvzzmTpIaLs/wCFFsbYlaq4LysqQpDKCGvcc3hKN67F9X/CUAFe
d7/a79HOLj51kVlQpAaRMkt7vwdXHU/QLXGuk32FGHvV4bci8slvdMpxAKOhzIk3
Ht3lmRxB3o4Y/8QTl2Ch4BpMFwyqd+0Htey25e0+lYMiNMjRG5f69ehHSVL4QcA/
THMP2/t77ytEpJj6kVaNAR2m9KiRiecTeI0x3PUiJJoptMJ1T0Yk+exg6qr0c8VS
pK+MuMIUo3qHfUFIzLvs
=8i/r
-----END PGP SIGNATURE-----

--08ATZu8fEq0x2T3M--
