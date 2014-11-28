From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 2/7] regulator: dt-bindings: Document the ena-gpios
 property
Date: Fri, 28 Nov 2014 11:21:16 +0000
Message-ID: <20141128112116.GG7712@sirena.org.uk>
References: <1417087253-12306-1-git-send-email-k.kozlowski@samsung.com>
 <1417087253-12306-3-git-send-email-k.kozlowski@samsung.com>
 <20141127183058.GB7712@sirena.org.uk>
 <1417165784.18249.15.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cfmcEfPTVFMtqln3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41841 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbaK1LWD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 06:22:03 -0500
Content-Disposition: inline
In-Reply-To: <1417165784.18249.15.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


--cfmcEfPTVFMtqln3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 28, 2014 at 10:09:44AM +0100, Krzysztof Kozlowski wrote:

> I understand your concerns here however I didn't want to overengineer
> this. Is the same GPIO (on more complex PMICs) used in different
> contexts? Like enable control and something more in the same time?

Yes, and it's often reprogrammable at runtime.

> Something like:
>  struct regulator_desc desc {
>  	.name		= "LDO1
>  	.of_match	= of_match_ptr("LDO1"),
>  	.regulators_node = of_match_ptr("voltage-regulators"),
>  	.ops		= &max77686_ldo_ops,
> +	.of_ena_gpio	= of_match_ptr("ena-gpios"),
>  ...
>  }

Yes, and note that this also means existing bindings can use the core
code.

--cfmcEfPTVFMtqln3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUeFqrAAoJECTWi3JdVIfQXvwH/1hdN2Ax6zZjvpwVFcg8WIZ4
5opnuR6iWEq9oAY10SN+bD/lRQesXWe+yw2kikLsC3EGmzPrTq32i2NS/RtDHjaj
RZuUGnqsbPK5IhphhEFRg8JoX1BWmi0FbVxNdnDWu4AdMUI1fj74uaLsQYFFy0Oq
aNfjff2mXfcP/Ru+56FD3hXq491ZE/lCYh+mvUI4YL6x5aUIBwnss7uF845Kehjn
u2LVg2XJE7uuAUrkfrne/VaWaZC6t6ylUTEpqL+JZLxwPY/MG2Cvyq02C5IIGZa+
QeyXbENrZgh1Q9I2YioSdK7U14KIhkhz5mut51qs+vfr10x/TUQwXlf8huf4Yuk=
=bNjk
-----END PGP SIGNATURE-----

--cfmcEfPTVFMtqln3--
