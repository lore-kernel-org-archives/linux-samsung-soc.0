From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 5/5] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
Date: Wed, 28 Oct 2015 10:53:23 +0900
Message-ID: <20151028015323.GZ28319@sirena.org.uk>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-6-git-send-email-alim.akhtar@samsung.com>
 <56302514.4090407@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KQ2iXOoQ638mtNze"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38316 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132AbbJ1Bxk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Oct 2015 21:53:40 -0400
Content-Disposition: inline
In-Reply-To: <56302514.4090407@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, lee.jones@linaro.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org


--KQ2iXOoQ638mtNze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 28, 2015 at 10:29:56AM +0900, Krzysztof Kozlowski wrote:

> If that's true, then don't add new compatibles, new names etc. Re-use.
> No new code needed, no changes needed. Keep it simple.

Well, it depends - it can be useful to get the information about it
being a different part into DT so that if in future we realise that
there is some difference (perhaps a bug workaround even if the IP is
intended to be the same).  Though in the case of a MFD that information
can be obtained from the MFD for the device.

--KQ2iXOoQ638mtNze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWMCqPAAoJECTWi3JdVIfQ4xYH/j4G3S5X7WjyczTIZ00O2321
T1RDXLoEYYjVS0AvRTNbR15/mFw2Zbm3Tpq14EpoWItBNP3VNmjknWH2N+3dEiFA
nD2xto1RCCzXb/4Vi908Y39rqEN2MRcjO4NtPh0ZEH3RnbKfCj4/X+F8Kv4MWVm3
4pBDefmn0JhyS1VxlVfPV5Ot/jApXZTei2OWI/iwBtATaIwa41z0EdWCUrAzONld
RQMmG8UK1NYbsED3bqiLtVatNED/oAlgaHGslxgA4pUbc52Jk7cS/cO3fK+RmOS/
Ji9IeIOfmWSgHMl0aqKiBBn8tQca5ou6q32rRgYiwLEorsE9Iq1+pKaWAbmtUzY=
=7yDC
-----END PGP SIGNATURE-----

--KQ2iXOoQ638mtNze--
