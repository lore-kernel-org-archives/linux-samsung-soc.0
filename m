From: Mark Brown <broonie@kernel.org>
Subject: Re: [GIT PULL 6/7] Samsung DT for v3.14
Date: Mon, 16 Dec 2013 17:16:45 +0000
Message-ID: <20131216171645.GJ3185@sirena.org.uk>
References: <52AE0F9A.3010407@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ELVYuRnMxQ5nnKRy"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:41302 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754679Ab3LPRQy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Dec 2013 12:16:54 -0500
Content-Disposition: inline
In-Reply-To: <52AE0F9A.3010407@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>


--ELVYuRnMxQ5nnKRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2013 at 05:22:50AM +0900, Kukjin Kim wrote:

> Samsung DT updates for v3.14
> - Add support Octa Cores for exynos5420
>   : populate CPU node entries to 8 Cores
>   : extend mct to support 8 local interrupts
> - Update dwmmc nodes for exynos5250 and exynos5420
>   : change status property of dwmmc nodes for exynos5250
>   : move dwmmc nodes from exynos5 to exynos5250 because
>     it's different between exynos5250 and exynos5420
>   : rename mmc nodes from dwmmc for exynos5 SoCs
>   : add dwmmc nodes for exynos5420
> - Add G-Scaler nodes for exynos5420
> - Add HS-i2c nodes in exynos5420
>   : High Speed I2C 7 channels (4 to 10)
> - Update sysreg binding and node name in exynos4
> - Update min voltage on exynos5250-arndale
> - Move fifo-depth property from boards to exynos5250 SoC
>   : because the fifo-depth property is SoC specific

I've been sending updates to disable the I2C and SPI devices by default
on 5250 for some time now - is there any chance of getting them
included?

--ELVYuRnMxQ5nnKRy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSrzV6AAoJELSic+t+oim9fygQAIK7JSWOMrZFv8Ai3lB8n9ZM
VljCnIipS/mFmdwzyzUJ52EQqbQOj7TkltCyOkD5/ys8Ma2XEDTpkEGOAINRVCST
/LUf+/1LQ8aqI6eDnKBS20aP+JoYTFfi4O+Ld1+HlQvBBv6CVHhR6zxHj32iVb+B
304rIVOzrcwVuvI3YRDQbgMnZpdu0um6Jo+f+OsxZ4kHstfxoMJjlMsZ7zbUAqEH
4Xzosrl1cspBAm6j7d8mPCtf8nPDETBJtCx7Hqv9PeuaPg/lR1RQacOdSk9stXaB
hYmsmQBUJBvCqs6nMxWqE1AqyRmLGBBGh4QqHSm3xjRaT/XWXIuTWHOjVD2ZJMzh
IdiKWKiTQImKOXXvetBURUTY/kUvpd+SP/qcH++wQySFcLdOyID3Kn7rDrJZ5Ska
fqEp1WYijzADZ0VArfKnBLs9jyxtesO8XsA25LMik++KWdY6qFV477hafKx0sBRn
RaBwuB0W7YDL6ReTzCftCKwBWxM/t9ob6BswlvKIV/03Gc/lTQWZ7NUSY7cCX0IC
WpJ47UdQQl+jIW/j2rltmQSe3VIPWhKW5Ra1mxzedOlyoVMIPCfqcLQNlckEcRnG
mREW5m3JQ//1TypjKVwJmxvLUVKZkisHzHOhBiD3Pt0lgP2Ozh/GzQ0kWmmStS+Y
qvI4WzBAkufWoq5NfZgr
=fbC/
-----END PGP SIGNATURE-----

--ELVYuRnMxQ5nnKRy--
