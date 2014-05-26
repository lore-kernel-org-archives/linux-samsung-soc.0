From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: max98090: Add NI/MI values for user pclk 19.2 MHz
Date: Mon, 26 May 2014 14:29:11 +0100
Message-ID: <20140526132911.GX22111@sirena.org.uk>
References: <1400757703-24431-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="my+VSKri2szq3kvl"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43086 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751600AbaEZN3a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 09:29:30 -0400
Content-Disposition: inline
In-Reply-To: <1400757703-24431-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen Zhen <zhen1.chen@samsung.com>


--my+VSKri2szq3kvl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2014 at 01:21:43PM +0200, Sylwester Nawrocki wrote:
> From: Chen Zhen <zhen1.chen@samsung.com>
>=20
> This patch adds the clock divisor and multiplier NI, MI values for audio
> sampling frequencies 44100 and 48000 Hz and PCLK 19.2 MHz. This is useful
> for the Odroid X2/U2 boards when the codec works in master mode and its
> MCLK clock is fed from the I2S CDCLK output.

Applied, thanks.

--my+VSKri2szq3kvl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTg0GkAAoJELSic+t+oim9dssQAIQwnbmWdsTJcUAHJQpEObPI
65PsiKH1TUgAh1DcltFcgnWIiL0GItPFm5gquEbLJpRW9JUSMfFv3xUKft9MocVf
z/ghahnNwZrT9FYVkilxzzfBkrJqdQF0y+LKIbgwqoM1gwl3XUr7olDs4Fds1FYm
dDJaz//YVJYQcyNP640PHEMClwNE3sClmWHJvnnfoVTllZEhSKVBN6YlZc3UwTqi
GVt5UibOMlpjNOs14reNLbdphRAgSXAawWrEoHjUTIYNkflQ0hypKrfftwyXN8Hn
o2hkQ2VQoQBJR2xaGU3wokLSltxLJOnJqYtE5g0ffbd6xV0wuqiLStZmMzMSIXiN
FqJOKnG+bVE+CcgAFVFpqQA0dzf/XGtfLIUJpzu29V/necKSiEZFjw6D7B3VWF0k
2VmwM02BscaX3Tq11EEllhLd7I5CzAbU/NxG3ZjDs9cw6lerA/P2d0kKet33iNw+
0A93viQLDTiOuapAU8knB4ZYyCfGrQt98NteVCSHgPJoYoy/AfekNrC6X5mpvmWW
ZIq+Yv3Z5LDptn0oysVVnAQAaIjApe6lWC1bjTq48vl5WfgxTptG71fRmqkMhd/P
jtmP1KzgFLMYYj/KKt+6yCA7uKrJHJA9B5IVXqqLi8CdDjnAmUwTyPLghLYEePUv
rxxFNci5LMdhvk+fsGq7
=c48G
-----END PGP SIGNATURE-----

--my+VSKri2szq3kvl--
