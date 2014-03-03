From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] regulator: s2mps11: Don't store registered
 regulators in state container
Date: Mon, 3 Mar 2014 10:09:08 +0800
Message-ID: <20140303020908.GY2411@sirena.org.uk>
References: <1393581710-17754-1-git-send-email-k.kozlowski@samsung.com>
 <1393581710-17754-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0786ZyFfTSxuegBe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393581710-17754-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--0786ZyFfTSxuegBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 28, 2014 at 11:01:48AM +0100, Krzysztof Kozlowski wrote:
> Regulators registered by devm_regulator_register() do not have to be
> stored in state container because they are never dereferenced later.
> The array of regulator_dev can be safely removed from state container.

Applied, thanks.

--0786ZyFfTSxuegBe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTE+RBAAoJELSic+t+oim9J6AQAIqCqKcSBtRPNH3aFO6ufFhl
9PY4++PZkU6B23PtSO6ARgaMokABH/qimoA8HNOvEBggn4BU27ehJTbjt206rTJV
8M7VFVGbY3Z58+bE/xG8ScdJ5jCJ1JMlxasQ/V726TVyIKQuF5y4Se4TWMlZEHeh
qyJtLuw52EsyYqRsKCzRI1ci9RjwDm9KBpgdYIB4+gDKVULa0yn3zpd0leYjCKzC
ZzyArBd9AVKdy6PJJ6prbVRC6W1i2h+xf43OyLriS0Kl7n7/bmyVQtJNFP5ViOVX
F+CPBXFlQQQIMef6k8v59W5Qjr0nGAkHDk/brcw2X6e/pmm2z1n/YSi1g7UUKLg1
UbU9kiyotK/VLbnaVd/eO9VMTLZ98HfOhmnhXC2hFA92+n+W9iGDDPMG0PqKvFg/
Q14N8T+9SM++39TLIcxbtz5rZIfF561QYCNhmi7odXFKD2k4H7fQRUBUKvDXMGYO
bo60X41fO6wJ02cVTmkrwFNKz5Q6P7IghyS/oDoIO6GkDLpp7w4QTWJntozp36uH
Y6zO6C84qi3UNccNhNRu9CbmplP8Ia2I0pC+8rRLqtiEb6tcjEG+4hrpAPGs1CfW
3HtXy3NF148pyVpdXiduKK0J9UQmHgWE9Og1FgUlB6L/8J0FjaTWRkNRr3X9VsYQ
N4EVZ01MnPC6mo4T5YP0
=Tle+
-----END PGP SIGNATURE-----

--0786ZyFfTSxuegBe--
