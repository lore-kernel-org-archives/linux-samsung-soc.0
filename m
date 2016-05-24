From: Mark Brown <broonie@debian.org>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Tue, 24 May 2016 16:39:49 +0100
Message-ID: <20160524153949.GJ8206@sirena.org.uk>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net>
 <20160523162455.GW8206@sirena.org.uk>
 <20160523170617.GA8997@sesse.net>
 <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4N29bJelYIMOTi0e"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34514 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751435AbcEXPkA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 11:40:00 -0400
Content-Disposition: inline
In-Reply-To: <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: "Steinar H. Gunderson" <sgunderson@bigfoot.com>, linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org


--4N29bJelYIMOTi0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 24, 2016 at 05:06:43PM +0200, Krzysztof Kozlowski wrote:

> What other problems exactly do you have? Late binding of S2MPS11
> regulator driver? That does not look like a problem. If it is built as
> a module then it should be loaded, probably from initramfs because
> these are regulators.

AFAICT the fact that every time the dwc3-exynos driver probes it creates
a new child device which successfully instantiates means that we end up
constantly running deferred probes.  It should only create the child
devices if it managed to get the other resources, that way we don't get
the constant deferred probe retries.

--4N29bJelYIMOTi0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXRHXEAAoJECTWi3JdVIfQq54H/iCmZ1YI6PfobY0sAfV3W2F/
ZjzauVRJLFfic3l4q3TDxY2igAz8IbYErIt3DMDjiN3sWRw7fDCa1Z0EJAY3Bepp
JACGa3OP6Wlw5c4XEUKFhI294ayQWwMjVMQ4ITzY+DI//YQ4MIoJSHXEi0Nkj0Y/
2Z6b8422IS1BpD/N3CbrkAzsXGc4GlX2qgBQiA5km6TnGmy152NsMOZaA39mEtQd
E0Xq0kRueON42cc1Y3TSwR5dyeIVHxQbjqiBOeiLXABhipBAv/R9ughT+Lq2Q7Qh
o1mRGmqCeHG7EVfq/opLDZtggcX/obqnpx3Mz/KP/nSSWbkXKMw+uNahnKTxJI0=
=DATb
-----END PGP SIGNATURE-----

--4N29bJelYIMOTi0e--
