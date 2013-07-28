From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 5/8] ARM: s3c64xx: dma: Use
 clk_prepare_enable/clk_disable_unprepare
Date: Sun, 28 Jul 2013 13:32:30 +0100
Message-ID: <20130728123230.GR9858@sirena.org.uk>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
 <1374536965-3545-6-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bC1hh4sCiMGaghBl"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:56996 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753446Ab3G1Mcs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Jul 2013 08:32:48 -0400
Content-Disposition: inline
In-Reply-To: <1374536965-3545-6-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>


--bC1hh4sCiMGaghBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2013 at 01:49:22AM +0200, Tomasz Figa wrote:
> This patch modifies s3c64xx DMA driver to prepare and unprepare clocks
> in addition to enableind and disabling, since it is required by common
> clock framework.

Tested-by: Mark Brown <broonie@linaro.org>

--bC1hh4sCiMGaghBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR9Q9aAAoJELSic+t+oim9h8oQAJvS5Le+R81LCfNIGT0D92ZR
cQaHm6wJX2LmrMy+icC/ExoFRjH+QaNupYBsjY7BpPB4BuHfOyvotn0Bj6fBtFHb
XJtpxjYsC/b3jztJkeorUIU34rxy2eoQ5mW2oqFAcvAoSRx6HwC9q3ttKTirSEWK
EbUbfTdk/B55Kk4kxLDHAibLkiQ0VDHcvk6PNJ2LGdhU4GUwlIsxsu6ipWsIU5HO
GyJ50GDTVHdaqJccy46FvoqtWKvdA1AzBGRMR6TpqCJcOI9Ll0zNcaFOXBngzdLS
kIR1ibzk8eY3DxTaBuEVHkaukKE7saJ8CX1PpGuuG0+H5Ybs742dUMyNkMOYwEu1
jcCgZa5sYJZ+RBnDd3sqUZ7kf7QNZ5GfOiGZnT34hLIOVsJPxB7U50qJ/jtN0Fvj
WXJjMuOtFBRggY9WSj6QqsJSY/XUqufgqdIqNaPx3ABcIyIu0PJz/cF9mlr6hYHu
h9pr48q9KEZxRx3i9CniIeScfMsmTcfunziREufVQlA79LF0JvPXKN/fj2PQbc6O
5s4kMSGcipIz7Hna75KSEkg+U1Gf3UXJO5AJnqX4k3Sf12fplobGU+aYvkv88l8f
+61joZCcy/k+Tsyv5JDOs3JN7a8iKANSXnL4ZbtXbY8gnfkR2VixIphNXd3vupl/
NhPr4NtqXx7rt0fBidGR
=ANld
-----END PGP SIGNATURE-----

--bC1hh4sCiMGaghBl--
