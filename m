From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH -next] ASoC: samsung: Fix return value check in
 s3c2412_iis_dev_probe()
Date: Tue, 29 Jul 2014 19:56:09 +0100
Message-ID: <20140729185609.GH17528@sirena.org.uk>
References: <1405827787-26055-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lAQf9ELXiMBEg3QV"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33416 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753184AbaG2S4b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 14:56:31 -0400
Content-Disposition: inline
In-Reply-To: <1405827787-26055-1-git-send-email-weiyj_lk@163.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: weiyj_lk@163.com
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org


--lAQf9ELXiMBEg3QV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2014 at 11:43:07AM +0800, weiyj_lk@163.com wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR(). Also remove redundant return value check of
> platform_get_resource().

Applied, thanks.

--lAQf9ELXiMBEg3QV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT1+5GAAoJELSic+t+oim90NwQAIwabohwhJ3kXXnMlvMNj/at
T5x6oYclecVnLev+xxbhwyFWwOe5I+btQ2cksZaODLAp1Ula8XdOngSOusH9uvoS
qBnrcIJi47+nb7g422QOki1AADMeADwa62iqqqeUfQPBRAk69sycOTRpm9cVHLdF
wA2XMUKKfoAIpOLyYo3YWvhhpWFNU31UM+ngBh2Clt3y4Fm/ik34vLyrWcfYnnLr
IYOKcuG0ZDyzgjTWo5kh3ZcCyx4nrVhVfIJEHKQhxv+ehToCG6A74oJCvEmbI5ef
2iJ4thuvhq+CloLOe9xjhypLkDtnqO0SLsPApVx7hUhDQbEBUAdH/oLnn1p424vO
4mXP4dVF2iwcZga3mC8uiBt9N3cdkmYph/XQYM90aSn8ZJZll+i52uGbTU+Lr4Rc
SPxkJRbxMk4wntjnOMnCpcQgpB3GOFu9o/26NCIuM2EyjaDuHr1vKgNsQ8pjv/SF
Io8/2o/hsSI7E4hrL/1/Ec35MuPmqClItqFXH3SlSBH9N9LDQL+2ZZs/GI7Ouc84
huFECiM1+CBnyrlkX0ajYD/FRchs8nb/z8C8pMrMCRmjZJ/wA8b0UqhwTGcp7mvW
mzoQi6gz9n+TN9CuJ4zfnB0YcGkswwLD0w6fqtLH2RJmL1XeEfRNJC/21vx0aWdI
65j9OWXIHXgBDxvyb2Y0
=IfyT
-----END PGP SIGNATURE-----

--lAQf9ELXiMBEg3QV--
