From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 1/4] spi: spidev: Add Google SPI flash compatible
 string
Date: Wed, 20 May 2015 11:13:18 +0100
Message-ID: <20150520101318.GB21577@sirena.org.uk>
References: <1432042454-19234-1-git-send-email-javier.martinez@collabora.co.uk>
 <1432042454-19234-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48400 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002AbbETKNn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 06:13:43 -0400
Content-Disposition: inline
In-Reply-To: <1432042454-19234-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, David Hendricks <dhendrix@google.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2015 at 03:34:11PM +0200, Javier Martinez Canillas wrote:
> Google Chromebooks have a SPI flash that is used to store firmware and
> different system parameters and data (i.e: Google Binary Block flags).

> ---
>  drivers/spi/spidev.c | 1 +
>  1 file changed, 1 insertion(+)

This is adding a binding with no documentation, documentation is
mandatory for all bindings.

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVXF49AAoJECTWi3JdVIfQz3MH/0jm5P8ZzNfFovcpoE9VSvTX
LiwKrBnAQvz2rg9M3YqBVCNh3BCc5dYNhsVpS6v/MfJqEXLnux4B1kturZfUwnn4
xSfk131r9iNmV5WBTlwPsi094F+VU9LuAc+jN2j7ZdhGsvumo0U+99yxoOMjJ6fn
STYBe6QJo2Ie9mgEPLPfcvBB7E5i9jHudvwuqwtG9Q8nT7LayW7hZQT4KVGidcQp
P49Z54ePhKy/XWYkXbqCFg2FCifMTs/rEJSfZt3WWDYJ21+3BoOclPRA4oN25ISC
IYtQaYCT3TYQlM0fib/molnUv0JGwbqTTioyxIsff0EF5Px2JvJOtdTcnNsUb7k=
=GeM4
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
