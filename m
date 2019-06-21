From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] gpio: Fix return value mismatch of function
 gpiod_get_from_of_node()
Date: Fri, 21 Jun 2019 13:06:10 +0100
Message-ID: <20190621120610.GG5316@sirena.org.uk>
References: <1560938081892.33415@sensor-technik.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3d1h++6StbrqEHAg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560938081892.33415@sensor-technik.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Waibel Georg <Georg.Waibel@sensor-technik.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


--3d1h++6StbrqEHAg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2019 at 09:54:48AM +0000, Waibel Georg wrote:
> In case the requested gpio property is not found in the device tree, some
> callers of gpiod_get_from_of_node() expect a return value of NULL, others
> expect -ENOENT.
> In particular devm_fwnode_get_index_gpiod_from_child() expects -ENOENT.
> Currently it gets a NULL, which breaks the loop that tries all
> gpio_suffixes. The result is that a gpio property is not found, even
> though it is there.

Acked-by: Mark Brown <broonie@kernel.org>

--3d1h++6StbrqEHAg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0MyDIACgkQJNaLcl1U
h9Ce/gf/YPxi8n+w5bYAPtpy4hSIHZ/x4vLS/FxaCkM3TdPBix4ZZyClGg1pQMb3
/VzCXGrjhUGQ7SRmqEAPKnzhZZsPU7QwbMOWwdM6s0tNeTL3qR6s1ZupYXSo3M8P
X62jCDKfmUFr7ilslBjtgljbsw95j5b5qKBt3rCnsvQP7zYR4go8NLxYD0hrPK2Z
hnZherbhbmIZo1Dn5n0rpdK7Ci3mXR3E7Mt/qHVHgCR43xHk1QPIChvzzoC/G05Z
Sz34TnSTJo2qukyYhzL7ThMpaVxgkUKSTGZJsT/p79oO8OHpRrW3QVvoRp9dj2cY
bYGkcmlParaEOWVxkdXg2j3i4NNbLw==
=cGhj
-----END PGP SIGNATURE-----

--3d1h++6StbrqEHAg--
