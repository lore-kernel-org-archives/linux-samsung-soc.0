From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix return value check in
 s3c24xx_iis_dev_probe()
Date: Fri, 17 Apr 2015 14:23:31 +0100
Message-ID: <20150417132331.GB10513@sirena.org.uk>
References: <1429186682-20629-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43608 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753362AbbDQNYm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Apr 2015 09:24:42 -0400
Content-Disposition: inline
In-Reply-To: <1429186682-20629-1-git-send-email-weiyj_lk@163.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: weiyj_lk@163.com
Cc: Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2015 at 08:18:02PM +0800, weiyj_lk@163.com wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> In case of error, the function devm_ioremap_resource() returns
> ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().

Applied, thanks.

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVMQlTAAoJECTWi3JdVIfQ7usH/29jTfUa7Ysx/fcv/oRtjQWC
wESIOxeJkIkXaZaf8GruC0awnnHUqw6fulQdf6ABVKpWuhmBB8F/zlrw289wEG6z
Bhoh2cHKldD7OhrzzzamkmxBUSXrFTeJ7ATowKxX241lKMd2bVEeU9Bgu4t9BOZR
WFAKZncVtkFC0IIW/XrOgBHFLrCHb1Tt3ec3Mu3Twaco20dMirgPtCY7yQyMRUC+
qlPM52gSbZ88slw0RkVF9IDVFLyhlrq5/mLzePBIJoUWn3DzHwcLm3iOfSvh+dof
2xgljn5+/J+oINn8+dZHU5urvJN8ijHKxQUe7L6E+kZNwBQUzOiwB0Kr6NyDZlg=
=9KtI
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
