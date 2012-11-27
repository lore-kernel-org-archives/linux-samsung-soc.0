From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix build of I2S driver
Date: Tue, 27 Nov 2012 06:43:13 +0000
Message-ID: <20121127064313.GV9411@opensource.wolfsonmicro.com>
References: <1353944420-3972-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <15c501cdcc36$db54cb00$91fe6100$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7XuS4gr/+Xj300Yp"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:36340 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753881Ab2K0GnQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 01:43:16 -0500
Content-Disposition: inline
In-Reply-To: <15c501cdcc36$db54cb00$91fe6100$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sangbeom Kim' <sbkim73@samsung.com>, 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--7XuS4gr/+Xj300Yp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 27, 2012 at 09:33:43AM +0900, Kukjin Kim wrote:

> I checked Samsung audio driver stuff just now. If you don't mind, I will
> drop the patch 48a2050d ("ARM: SAMSUNG: Delete the unnecessary variable")
> instead of applying this.

That works just as well for me, thanks.  Padma, as I said in the commit
log this should be done as part of a single patch series rather than
sending separately to ARM or ASoC so that both trees continue to build
at each point.

> If any unprepared patches for Samsung audio in my tree, please let me know.

Will do.

--7XuS4gr/+Xj300Yp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQtF+rAAoJELSic+t+oim9nYsP/0yQZFOpRxX01wYSx1/QrsMP
ogpuXZuJHOOJjAY+ieDWK6rsybQX7GGOHuElMHtyEpgVWebPQoT2xOzrdAo0av8g
hkF8TjqP7qrRD249Dwy+TCqOFW8sAM0al/RzAcjW1FR9L7SwNkOvCSMAJCeoL+K6
/rUtYGCgcgCHQZFPMJnCnHzx/d9av5A8lNLAqGL8OrmZOIcGBSK9hixb9QQGc3Sf
rJNS6wv5LNDeH6+GDi9pVQKwNXHBU5JUPzWCCok3tSoI1GMi/qdi519ZYzYWXWps
RM8bTMyNwfjfgUDMwEpy/PAXDNpodrc1pIX+0hJJcMRA+lPnd0qkrW8irEsK+xf7
WbgZGz9TjpvHt+GjEMDH6gVyrPpqUeGKzPJMzeWaTcZoYmgWJ70pe5ggLYZtrJOP
96pUKej3NBF4sY1mStql0rmqWESZdQSAA7pzghYvaYwShotR3Qvhz5adB7nXzkkZ
q3B8eb0wrqt2ofT1jQkAbHs46TuRCK04lwjW0z3qymMKvBlk8slQi6D3eSUi0Ftr
qXurW7LY2Wxb33K4bNCivgw94zgdaKFUXOFS4C0L1kbNyZkM9mgX2U5fEBQ247N5
BOLbWLRnvf+8vE7vbt3+gW0SgDHfmV3O3YPgjA3jBFCJcOX2hGQ/v/aWmymZ7O6q
NVcdzztqz5DoPXuT8Nkt
=sd06
-----END PGP SIGNATURE-----

--7XuS4gr/+Xj300Yp--
