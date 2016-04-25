From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 1/3] i2c: s3c2410: Add missing clock unprepare on
 probe() error path
Date: Tue, 26 Apr 2016 00:23:12 +0200
Message-ID: <20160425222312.GL1550@katana>
References: <1461222291-5642-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nrM5Z5VIJgwP9LWp"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:47335 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751815AbcDYWXU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 18:23:20 -0400
Content-Disposition: inline
In-Reply-To: <1461222291-5642-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


--nrM5Z5VIJgwP9LWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2016 at 09:04:49AM +0200, Krzysztof Kozlowski wrote:
> If during probe() the s3c24xx_i2c_init() failed, the clock was left in
> disabled but prepared state.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20

Applied to for-next, thanks!


--nrM5Z5VIJgwP9LWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXHpjQAAoJEBQN5MwUoCm2WiUP/R3Ujj27iJZ+gKGdCEJqG6Vb
eRSUDP11zfMpS/tpuswKMMDzN00KFFpjMP9kGBWDRgOlJ92XAlk0vzMHEiDCJINL
JDSvpCOSehkwGG3iBrk3l0JL80M5oNvv344HkcoBPg8TxVA+jdmUzV3ZWZxgG6I1
Jw0HpaivHbLmoRGggdFIjb9teaOXHMTItpRhcZj23T8bsW/99lWw+YORCLM4yhWQ
jub9nud6B96kgvKZtQcDv6SDgsAG0Lc01jDPd3qfsvChngSVc4wXxzy/BuG5fUY4
UUsu1L0g1X6lNUnjM25BOZuRKfxyuyk1XOMvDgBWVudzyQzG2thkqOy8vG43Ajz3
xd4896zay0jIhbYqjMwsUZ/NSKr+57tTz+YUADUr1PwBbBEFBRhwO9C5dUcuD+xt
5UGM9xEgFibXHPCiNYY6HtQLf/ML9G77h6HRQ2BVbUo9BPxV7N2J5p9qj81Obw6J
WmDgO5MxqdHBcUEPaJtTg+S5hdLz+jem9c0gkcatdDtqQOSamutDMXzyM7mNJ+pF
MnvZ8jEmv8j+bKoz+UXHvh/Gwo+c3lqRL9m8JUpFGL10Ip05RL1R6McGxBekMaeE
vWHZqeppF9ezcK7DNVQTGNACV1hhtdeGzXSeSQmlDEWMJIj0pVtvlF8sYbk3jX76
OlPDW3LL6EEtK63QO8DG
=s2QF
-----END PGP SIGNATURE-----

--nrM5Z5VIJgwP9LWp--
