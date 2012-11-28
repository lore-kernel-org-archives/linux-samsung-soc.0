From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [GIT PULL] ASoC: Samsung: Updates for v3.8
Date: Wed, 28 Nov 2012 09:08:40 +0000
Message-ID: <20121128090840.GH32691@opensource.wolfsonmicro.com>
References: <001601cdcd28$ce5204c0$6af60e40$@com>
 <CAAgF-Bfv46Xt0hFdPmviCdZbpje1M4MBnmCsHGgdOjcq4SnuJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G44BJl3Aq1QbV/QL"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:56528 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752357Ab2K1JIn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Nov 2012 04:08:43 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-Bfv46Xt0hFdPmviCdZbpje1M4MBnmCsHGgdOjcq4SnuJw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org


--G44BJl3Aq1QbV/QL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 28, 2012 at 11:21:31AM +0530, Padma Venkat wrote:
> On Wed, Nov 28, 2012 at 10:55 AM, Sangbeom Kim <sbkim73@samsung.com> wrote:

> >> > The requirement for an alias is also very odd, where does that come from?

> >> I don't know that Which one is odd. Please let me know.

> > Having them at all is odd - it's not something other DT bindings have needed and there was nothing
> > saying what it was for.

> What is the exact requirement here? Should I remove the alias ids or
> I2S1 and I2S2 nodes as they are in disabled state? This is done same
> way as SPI and I2C. Please explain me.

If you need those aliases you need to explain why.  They're listed as
mandatory so presumably they must be needed for something?  It might be
that this is a good idea we didn't think of before so the answer is just
to document that rather than remove them.

--G44BJl3Aq1QbV/QL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQtdSRAAoJELSic+t+oim9hW4P/iB9/Ver6dz1OkExAxgZhjBi
RsiZwCfP9WJpy53G5JuutnRFqvrAzjEbOaWI9JiVieg5D+Gl8RCpYt78RkOhaOSa
PIcXrtkac9NMkfgx8YjH2wqR2o/aebfFan5y8SAIQNHWE9GRe6BjLb0+FLezFTPY
k2PRsQVExCOeDmv1HvHREmrVBW1OMA2PYQCKH0MfX6nR1CEsOxgu/qgONFUHVlgb
rPpCVHfXcSXxCmidlEwDax7BcXOsJk337CAE/rjS+86WZxWIipwTmpOIsao3Y/HF
l9ywAqA0eXFb++FtgAd/0HolORcxV7UewxYCZr6fJO6o4ZVI/0BpMHOfM/Iasw06
vOwiS99Lf8pkiwuSLEx7B6zNbbERRhP1XBZnOtZoKSoFx2pzTes/yYY5bbKwtwCE
KH9wAHc0vVMpjkwKXZa9TeaebbqQjZN8lGzrGuHfIjZEAOiiWIehjUB09viB4Ic3
Kd08qeia1yQqjxp7TetyjMPGYuMOlLzavKB95+CIioGQ7NhYV/VRK4Tqw0IqhXIg
fko4fZOeVZYLzKeb0ToJkVMr3v1ox4WGhhbyCB9xLFm7rqoEgfkT2bHQ6DsD0Q+p
9aUGm+Ko0RY33/uZPUrDoYufNahH5Fn3yiQZ9mLq3p2PLzyd/gsDCMqPxpe8+o72
Q5O/q8xU/OiWt/S3lCdV
=y6Du
-----END PGP SIGNATURE-----

--G44BJl3Aq1QbV/QL--
