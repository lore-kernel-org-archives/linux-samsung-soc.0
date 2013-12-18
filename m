From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2 v2] ARM: s3c64xx: get rid of custom <mach/gpio.h>
Date: Wed, 18 Dec 2013 12:46:35 +0000
Message-ID: <20131218124635.GN28455@sirena.org.uk>
References: <1386939234-12828-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TlGginnuNEm5PkhK"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:59974 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752673Ab3LRMql (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 07:46:41 -0500
Content-Disposition: inline
In-Reply-To: <1386939234-12828-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <tomasz.figa@gmail.com>


--TlGginnuNEm5PkhK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 13, 2013 at 01:53:54PM +0100, Linus Walleij wrote:
> This isolates the custom S3C64xx GPIO definition table to
> <linux/platform_data/gpio-samsung-s3x64xx.h> as this is
> used in a few different places in the kernel, removing the
> need to depend on the implicit inclusion of <mach/gpio.h>
> from <linux/gpio.h> and thus getting rid of a few nasty
> cross-dependencies.

Tested-by: Mark Brown <broonie@linaro.org>

--TlGginnuNEm5PkhK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsZkoAAoJELSic+t+oim9olIQAIvpKvtfPHxctphMkw3YdLjB
4lwX209InI4r3Fq1qxphcxX0PzAO70z+MOfxdZy/uTMrj39N5eGISRsv8VyJONPO
0owgObvUXIwZyiwOdQHFMEMle2eGGAOMXWRRAUU5CYqFbJs9SfczrSaXD67hrPpv
AJcVgV/0QCd9IPXuoq0zULvIprdr2T1lxNZo74+5JWF+RH93CtEX4hYaDw3fZtTp
oF/9cJEZsPkhwbPT31f+5B2ZBN23TgjxTGkHjPE0ZK/Ag4DRKs5af/7qz/8Aa/l3
npo8EDXuk1xzd8Te8UGseRG/0GZLN1nVIfTUhXUtktN7grR+eZMs0puF5a1SyzNE
4ZsV/t9IT78liwH0t0ZjC9OBRZJ7PkC+c5/TsiMxX90zT1QGn6UXRUODMC7y+T7P
DjQo3MQ5lG1AEcIq1drF5pjIoIvHZi8tqiV8FTHU5wtR8YnUC6lsUu6hPoVq+1Es
VPwD/LH5pfAb6VmBgDU5pKGpdYP53x7bFcATRgggrDvN4FzC4C4izG9GAVCJHHt+
cnzrFoCeRprTc1la1yK3Fzh7DAKiQYfmD9GP62gqhUtsXAxvr53nxFpK7dY/4JY9
gEbf8Kq0b/OfCPwTZGmxr6NhOjVKzFFLPuktrvnQTZ6SfNrKJK/8JR9EuLPd93X4
3rRjyhR2PqPentKw58xA
=LCi3
-----END PGP SIGNATURE-----

--TlGginnuNEm5PkhK--
