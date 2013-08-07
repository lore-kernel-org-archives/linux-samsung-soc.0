From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 1/7] ARM: dts: Change i2s compatible string on
 exynos5250
Date: Wed, 7 Aug 2013 11:10:57 +0100
Message-ID: <20130807101057.GY6427@sirena.org.uk>
References: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
 <1375866616-5541-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YPAu9GJT3m1iC0FS"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:38774 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932292Ab3HGKLQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 06:11:16 -0400
Content-Disposition: inline
In-Reply-To: <1375866616-5541-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org


--YPAu9GJT3m1iC0FS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2013 at 02:40:10PM +0530, Padmavathi Venna wrote:
> This patch removes quirks from i2s node and change the i2s
> compatible names.

This needs to go along with the driver change otherwise we break
bisection.

--YPAu9GJT3m1iC0FS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAh0uAAoJELSic+t+oim97V8P/0vqaTnFdJX7XwiG8s32oO5q
RvzyWQxQeT9KX0eRDFXXzhJ2YoZNOx3kgbU2I8LNtufnd3BF/DIENFiSmDyJX87d
44A9YWhmH9KtJcU6TbmhoealsEJa6ierCT5U50WDV9nASZm0Yf9sM2go9jNt7s+o
r2wGwA12aOBAX2Dbmi7JoWZKme8HzBz2L8aMNrDvQ6WKuay/fOjmRLn8DrpoEDH1
+nmJrA0VmrkbVi+FloG+8fOJ1jqxNeCF7pTffcgDeM5+ibfSILVJVaJj/hR2Uexg
7xmOMifG1hmTO+uypkVcbnikpwIZJIHOALsRXZhPt2i+FQAR8tPR7kiRyiyRuUFa
L5gGOiyQ1ev+exNapLxkZmyd3v6ut4AvI/2hS8rzViOY3t7izJ/fh869CdIp7QBp
dkoBnP+R1/dTd9eU+93xeFd6j38UFAhv6S/A3y2E+8URr+XjTt9llBNPfarPzcvo
38VAcM0o4oWqS5G+BHuzO5SBVYDIjEFDHpk1VRX569mvDswT5MW08zfQKJxAQ+T8
DhlV74OrlSxYDGGJuJHJZgBpzFiheAKbleM+VH8Xwuz7xTbJu5m2xIl8ysuO32rj
TIqql+O8iD9KcgC0fAw3xYnYY+TPx4RWb3f1kH2iXbGbtZ69jvOId3Tx0r/wWZFI
AnuAUgrBQGjdYPUQ9DpW
=2DVT
-----END PGP SIGNATURE-----

--YPAu9GJT3m1iC0FS--
