From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] i2c: exynos5: Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS
 instead of open-coded
Date: Sun, 24 Apr 2016 23:17:16 +0200
Message-ID: <20160424211715.GF4317@katana>
References: <1460596084.6630.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VuQYccsttdhdIfIP"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41013 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753199AbcDXVRX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Apr 2016 17:17:23 -0400
Content-Disposition: inline
In-Reply-To: <1460596084.6630.1.camel@ingics.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org


--VuQYccsttdhdIfIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2016 at 09:08:04AM +0800, Axel Lin wrote:
> Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS to simplify the code.
>=20
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Applied to for-next, thanks!


--VuQYccsttdhdIfIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXHTfbAAoJEBQN5MwUoCm2CvkP/iYdOMZT/Z5EdwsCaB0R6TsY
oZWCwD8W2WD5gYImuOT1SACZ8dni65VP8ihhAqdunrzoVeXyLg12p6wR8MIpGPow
gkVCGJFFpNXIkrsRjrwYkp4L4glOBDGof5salxPsHrvepQikE+MtNmXpL6Igk7qY
nLWAxTlkc8LneBv+rpQZIhKIXdG/Udn7kp8H0gGvIv/9IZFeJy5XewsL09QXguRQ
4Bi3fVCo+yu6g/NuW7pOVGLsbQtVoSKwZUskfCzm+FUS5qH8g9C8/YehpLzxeH7q
E9eQIlTgJlJkZrjgkOZxHaJ0mxYsFIg84n4eZotTw63IE6GVDkc3Uwfr51t5VIft
jRkJLNB5mBqF18xC/60otzbcsDiTpRSpzo62Yx1xNHNthVvGB9kh1KubsU5Hck0V
/wfANJpTmA1X1O7cshieQ+amYZmcJxVGdEBhpwPifVquUJAMxUjNKW0E7YiMfhv7
Rfv2kdkhcD00apMVAUeHM9T2bnBwrsuF6lBAUZpqYAPjGmXkJUyjO2jqgKETvuAM
j/jeRfb2XnFX9+akSNGdjVq+2Yl9sPtprvdhcs4fqQVnVqzJQISjqrm/AZqBt5IZ
OYtoRpCwudVhCpDTqYP49MDUihocaCGbz/SAnaVI02m7giJGLUyeOySXfHPMeKEE
uL+wK07xzPJYNbLcu3mN
=D6ic
-----END PGP SIGNATURE-----

--VuQYccsttdhdIfIP--
