From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Samsung: I2S: fix return value check in
 i2s_alloc_dai()
Date: Fri, 25 Oct 2013 10:26:30 +0100
Message-ID: <20131025092630.GQ18506@sirena.org.uk>
References: <CAPgLHd8nzO9Q1fF1KsuJna_JVJDd+cimBC3ipd3nTP9Sz=fE9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WZLuFERxa6Y0cbOt"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:55755 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524Ab3JYJ0s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Oct 2013 05:26:48 -0400
Content-Disposition: inline
In-Reply-To: <CAPgLHd8nzO9Q1fF1KsuJna_JVJDd+cimBC3ipd3nTP9Sz=fE9g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org


--WZLuFERxa6Y0cbOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2013 at 05:06:24PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> In case of error, the function platform_device_alloc() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.

Applied, thanks.

--WZLuFERxa6Y0cbOt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSajlDAAoJELSic+t+oim9RD4P/RaDW/rZuPlo2zALckMmWgPM
Ws6VQDmYeR2fxq+cuzxJD4QpSKrtPEw9UbprWYoMf8EMfilbVjys79OK8bjvKGVR
Yotc05XUXCMOs+OnZEuex0J9x9uung+UhxyahSdXwysyAd8VGVEPDhj6RGbol6ca
+KaqPejbQp9pmeN1wqeOG4ZDvRNC38WhNG0aGW2pfFkTIBCmZYbp6JF1VSPaA24R
kP72LeZZ0XiwiZ28f8/Jcnizt7opGVXmqXIPSxq5wGe9GIsENwfWIthnRvyZUbAX
E3ecDpDUQLxLmIYuUxYaHLEtZTgKc9EBHqvVdxDfI1lGHjM6zDfif4ivA2Yf5LZX
ehdPY5I3E9r+Mq0U6pKp3yd5/5wG5wicJOnZTK5nRPV17fVSx81epOgqq2PUdul8
w1CGs+iAeVCSWucFN1VBIdbduf2F71zxlH6Tshv99lPURv/4z0O3lI2Bu++kYC0A
5yWtNfmK/abPD7EdsrHOVcDtN1ECOE7djw3Kf3+yama8u50a8PLjoWFbrkKcorcm
BbnKtVpnF0I41niPBXu+t5JPVjNlxsA2b4w96YpsAV76l5yy71iC9EkPe24Ao3hC
0tYizYJkxJJmf3Vm2a83+6CiSEwDkOE8DM5Vcg2ZRHnqSWEiy5NoIYLONEbMZnKB
akiYdZMyhT+zxAXXGMk5
=viAv
-----END PGP SIGNATURE-----

--WZLuFERxa6Y0cbOt--
