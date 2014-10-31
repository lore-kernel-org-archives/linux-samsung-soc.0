From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 6/8] regulator: max77686: Add external GPIO control
Date: Fri, 31 Oct 2014 10:32:17 +0000
Message-ID: <20141031103217.GJ18557@sirena.org.uk>
References: <1414422226-10948-7-git-send-email-k.kozlowski@samsung.com>
 <544EA4FA.6040704@collabora.co.uk>
 <1414486356.24949.19.camel@AMDC1943>
 <1414498308.24949.32.camel@AMDC1943>
 <1414579362.18868.11.camel@AMDC1943>
 <5450C63B.3000602@collabora.co.uk>
 <CAAVeFuLncbkNLGxEAj90yMmugRDNjtjeGoV_QYTMDZ7NVMJCmg@mail.gmail.com>
 <1414681386.26703.6.camel@AMDC1943>
 <CAAVeFuJo1wTyxOo4FEZM3=GTejuSHi+mnr=QV6HUeV5mAOCmqg@mail.gmail.com>
 <1414741898.20071.8.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rTCTeMwohXf/yKXV"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58865 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757225AbaJaKd3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 06:33:29 -0400
Content-Disposition: inline
In-Reply-To: <1414741898.20071.8.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Linus Walleij <linus.walleij@linaro.org>


--rTCTeMwohXf/yKXV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 31, 2014 at 08:51:38AM +0100, Krzysztof Kozlowski wrote:

> However new DT style parsing (regulator_of_get_init_data()) does the
> basic parsing stuff and this removes a lot of code from driver. The
> driver no longer parses all regulaotrs but the regulator core does it.
> Unfortunately regulator core does not parse custom bindings (like such
> GPIOs) so I would have to iterate once again through all regulators just
> to find "gpios" property.

We could always add a callback for the driver to handle any custom
properties...  one of the advantages of an OS like Linux is that we can
improve the core code.

--rTCTeMwohXf/yKXV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUU2UwAAoJECTWi3JdVIfQFH0H/1FXhxlLWI8pqm2smRVjdult
BU0XHEiL53GtgfFsbKrCZoYq6KIZwLt+1PfkicbNLiBaqpAVfcwiTp9FAIj2yNwF
1SkvKr8L3Ek0F/12CCuz8wFdV2GO3jqcLfsL8LZKObf1YQgTKwW3Zjs0G/Cqvbz0
HbcPPpBeerpX1W9herPt8jNUry1eXL0kL0xrPvXfQ8W+8QLkfuPH1W5epr6yvuU2
KlSW+oPWVsZZMcRKHVNC8epFJnnnZrMcpe1uX+SP1zPllXS+212rcq1bRrvkn3A4
wp/CA0WU54GCCqiIR8CrEdfKZJfkgZQnhXGLasIaEBBKnF7dhF/u9O4+pHEACSY=
=j6J+
-----END PGP SIGNATURE-----

--rTCTeMwohXf/yKXV--
