From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND 0/3] ARM: S3C24XX: add missing dma-devices and
 warning fix
Date: Sat, 12 Oct 2013 13:33:29 +0100
Message-ID: <20131012123329.GL2443@sirena.org.uk>
References: <201310111059.19791.heiko@sntech.de>
 <15184009.9QsSDOGPSA@amdn883>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KSn4sQg3MnruwCB4"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35259 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752066Ab3JLMeU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Oct 2013 08:34:20 -0400
Content-Disposition: inline
In-Reply-To: <15184009.9QsSDOGPSA@amdn883>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Olof Johansson <olof@lixom.net>


--KSn4sQg3MnruwCB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 12, 2013 at 06:36:36AM +0200, Tomasz Figa wrote:

> Big thanks for this series and the one adding DMA engine support for
> S3C24xx. It would be great if someone could test this on affected
> platforms, so we could finally drop the old S3C-DMA nonsense.

Did the s3c64xx pl08x stuff get merged?

--KSn4sQg3MnruwCB4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSWUGWAAoJELSic+t+oim90PIP/A/h3bUYILpCaXIUgMMfCCxB
A2DEzheG7eyH2mEuXJzxhPAiGJWeVKxnYokxHcc6b+6r4Uew+aVC1Ke3EpRl+86G
J6B54FsF4TE6vFrPctqNXuBZcB4yGOLTujXIZGa2/fJ1uJWUBHMYom4Y0HUunx1J
jmWa+AHPons19Dy2MltfOg/mC3NMVU/142T37mSbmKFhByd9ETFwCW3cASqzkt5k
7r9b/uS9JsZlcRvhhZQJ6UtspQ4hO256n2aquH77lUmeZxnkrUmVUrI6f9V6Zw/x
mzHLmAt+XMdRqH+PuWVD3ICz2aEJzBKhR7NM3CfDX+sCcoKdYy5lzUd4RcDBQwGG
uRkLoFZcqpKee10nWjzE9uefES18shbR0phZVQfA3ktFudGCF47bfYBC044+F6iE
8w/kGct26GD2baesRveC2N8PGp9M3mUGvALs+nMVxt0YcZ6695BkvOuLbJTlDKqd
2V3xYraymlNSiAX8OCnfkNdg5pE7uS28DqdKJCY36w8gpAMs11bhUZHSZ8pK65K3
ybyKLAsqG4neFC1N2GntDEjSXPjfSKvhn9EXITgprPBFubZ/FNmo4i0whceHneDF
hvMuWrRL+A7ZBhnKHMlweej9yvOxmo/gAkIJ7dLGMmWi8Z2bkYAKrMB8hnIu7tE7
WlWeOVerpqJ+gjszYGcY
=uf/G
-----END PGP SIGNATURE-----

--KSn4sQg3MnruwCB4--
