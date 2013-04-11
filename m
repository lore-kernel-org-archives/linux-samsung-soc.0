From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 19/30] ASoC: samsung: use irq resource for idma
Date: Thu, 11 Apr 2013 17:48:27 +0100
Message-ID: <20130411164827.GL9243@opensource.wolfsonmicro.com>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
 <1365638712-1028578-20-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZNC4bMBTQymodJa2"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38136 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934850Ab3DKQs3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 12:48:29 -0400
Content-Disposition: inline
In-Reply-To: <1365638712-1028578-20-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>


--ZNC4bMBTQymodJa2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 11, 2013 at 02:05:01AM +0200, Arnd Bergmann wrote:
> With multiplatform kernels, we cannot use hardwired IRQ
> numbers in device drivers. This changes the idma driver
> to use a proper resource, like all other drivers do.

Applied, thanks.

--ZNC4bMBTQymodJa2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRZulMAAoJELSic+t+oim9E7IP/3kUmsmBFE8LUBkksHy29YOA
vKT0ntpXjt2+0FhQNt6a5CztU0Hg/uI8luXxJiIBP5BxyjerKMh3JQylM/gDGW7H
Rzw49SKaF8v8OQczGZWwuog2fHiNAAq+glYXYWOkWOSG1eE4ZtkkIQP2aZA5oDHy
9hP+sAL/5C93szb2b88GVlzxhuylpaVSxx7trI3cWwsoDPtoRZvO/nqZopnkT33g
a+UQszEhqM+3iMfe9woykvhl+mufhE+A3MsNobTVbqROt1tUnwDxGlaFUGfFIHvA
umXkXBI0X5KfvUyp2ae6EE834VgnAAXHv0k6twwNMPwIDw89ZkUzBhYb7h4YohOy
FI0reNuIRFNxRFbvAjnJpBUFLju249bdTFk7NjsvhkhvLY1ImEhmFyYltTvz4dNv
x1c6ATIkX2gqBCWE5Fov2L+gYgTKwgPpw0LwsWu2EMZa8AX1QhNbRZi9PCJktttq
qUaMTnTx9xcusSmoPYHIIqpHJBKC3/CKGCLbiJELTu5KqaFWiodhBRARyTdOqNyU
t1C4Mame2ctQe8ShIkfG81A9pSXDdfutMRYDonNz8ooYWG7vtDSyyjbV3nOlI1gw
Pn2W5+IIRJptDQTl77Xo/i7jEfv1WZicCFmgVetnt7bCy7B7a4QJOSqagqd7Za+T
lmqhV+da7CBdA+lT6VzZ
=kczq
-----END PGP SIGNATURE-----

--ZNC4bMBTQymodJa2--
