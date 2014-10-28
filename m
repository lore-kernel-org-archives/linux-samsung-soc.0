From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/8] regulator: max77686: Remove support for board files
Date: Tue, 28 Oct 2014 00:37:09 +0000
Message-ID: <20141028003709.GL18557@sirena.org.uk>
References: <1414422226-10948-1-git-send-email-k.kozlowski@samsung.com>
 <1414422226-10948-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QV9egoCq9O4JbpTr"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51987 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752839AbaJ1AiI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 20:38:08 -0400
Content-Disposition: inline
In-Reply-To: <1414422226-10948-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>


--QV9egoCq9O4JbpTr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2014 at 04:03:40PM +0100, Krzysztof Kozlowski wrote:
> The driver is used only on Exynos4 based boards with DTS support.
> Convert the driver to DTS-only version.

This doesn't seem like a particularly persuasive reason honestly and if
you're going to mess around with this stuff please fix it properly...

>  struct max77686_data {
> +	struct max77686_regulator_data *regulators;
> +	int num_regulators;
> +

...the only reason for this array and the specification of the number of
regulators is to make platform data easier to do...

> -	pdata->num_regulators = ARRAY_SIZE(regulators);
> +	max77686->num_regulators = ARRAY_SIZE(regulators);

...and indeed we wind up with a constant here anyway.  At the very least
it'd be better to pull the parsing into the registration, right now we
have the code still laid out for platform data so it's hard to see it as
a win in cleanup terms.  If we're not translating into platform data we
shouldn't need to keep this stuff around outside of the probe function.

What would be even better would be to convert to use the standard DT
parsing with regulators_node and of_match specified in the descriptor
and then delete most of this code entirely.

--QV9egoCq9O4JbpTr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUTuU1AAoJECTWi3JdVIfQ9c8H/0RuK+0E4zNfoMDInchjmjXn
X10/j/Qy4TjcHpEEbYboaeV+n0UmCs8jlLOJKHoqHmpkJkWZQbZNQHygMHmgAlYN
MDBCsiHE/kxs+TAK3FomM5GFtQme/KzUQQkBHdW+RnGlL3U8sF9FwT1k3eUHTCqt
5tJT8z5Vv7utiD6wxR3I6X3YMdc1f0+A9KYb4nz+uoFwdXfKmvW6zpQuzAaAeUhB
AalWvsFH9XvoUDRzES20MxxYavGO4FApwdUY48Ef2FN6HTR91d4KGxsFTamCxRKt
KAYEhZ3kyeWCFT/mHX4Vq0tdhuHXRkLavW5GpRQS5Hm7vuLJaATL35OGzkuTpQQ=
=Kg22
-----END PGP SIGNATURE-----

--QV9egoCq9O4JbpTr--
