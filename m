From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 5/6] spi: spi-s3c64xx: Use module_platform_driver()
Date: Mon, 9 Sep 2013 15:47:18 +0100
Message-ID: <20130909144718.GC29403@sirena.org.uk>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-6-git-send-email-l.czerwinski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="irrheVdOic6+Kbak"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:44670 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752195Ab3IIOrV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:47:21 -0400
Content-Disposition: inline
In-Reply-To: <1378735766-12330-6-git-send-email-l.czerwinski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Czerwinski <l.czerwinski@samsung.com>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org


--irrheVdOic6+Kbak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2013 at 04:09:25PM +0200, Lukasz Czerwinski wrote:
> subsys_init_call() initializes driver too early.
> It's preventing to move DMA channel allocation at the begining
> (driver probe).

Applied, thanks.

--irrheVdOic6+Kbak
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSLd9zAAoJELSic+t+oim9X0YP/2PhGpmmnBi1UCa3AkwLNOp5
h40lH0smDEKspJ4FikE6RpiyAvqsTsmmQMZkJ3ORtSQ9TRDvfRk3ZfLh+FRQ7rG/
7B08+hyrLd5fI/22Vhh+HhVLFAv86avJEyVYE21LSrWzRFiHQaOaN9r2wRTQDr3R
1q8FehX+XVfjAvhoXp+qrf1ZC5H4nikYLZ1WKu8fmgYJENXGValR59xKxhb0qtFI
zTST3FZfiN5pLa+h1ZWkc2M9xSXMmIHyQEfwyhoC2ks9gMgiSnRFCUNW6I+9+z8u
tjI5qEy2eZE2k7E4Uh5pR2eNB8cTSKEiZAcSx5ZTOlHT7heGOXZe5s5+uOixJSpZ
f3AxBZCa/7JrEIJOe4W1qVFfVC2GxJhtpjvPjVF0Zmk5NXxztq2IZat6DHniCLwO
jRkAzk4NGMIJgQOKD7ajYkyiI3Q70m1HiLrYbjuBJqN+FB2A1X1hJ3KASFXgUd/j
ekWaJUBA6RfqKCmLCEOruCh12lIRbZWrxyL0XmKJ0B20DejlrGIY68qxK57PS5V7
MpNMO9H0r5dPoNDPjIwfdWlK3IzcgSz+2I51eBvWht50cICcwsQr9cE/ipsde6eE
dol7boUH8kQvZCtNos+elxV8AmGbYMOIeLZy5DVKwkUNgVhvt0KC3w54qyqXcos+
H3E475qKRnoaVlRzJn3H
=cKRA
-----END PGP SIGNATURE-----

--irrheVdOic6+Kbak--
