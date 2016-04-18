From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: s2mps11: Remove unused set_voltage_time_sel
Date: Mon, 18 Apr 2016 10:57:13 +0100
Message-ID: <20160418095713.GO3217@sirena.org.uk>
References: <1460965378-5256-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ncX6roZrNNHXnAbh"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50854 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751490AbcDRJ5W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2016 05:57:22 -0400
Content-Disposition: inline
In-Reply-To: <1460965378-5256-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


--ncX6roZrNNHXnAbh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 18, 2016 at 09:42:58AM +0200, Krzysztof Kozlowski wrote:

> On S2MPS11 and S2MPS14 devices the default implementation of
> set_voltage_time_sel() for LDO regulators was not doing anything useful
> because users did not provide ramp delay in Device Tree so the
> set_voltage_time_sel() exited with status 0. This could be seen in
> dmesg, e.g. on Odroid XU4:

That's not the bug, the bug is that the driver is providing the
operation without providing a non-zero value for it.  The device tree
configuration is to override what the driver is doing.

--ncX6roZrNNHXnAbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXFK95AAoJECTWi3JdVIfQOAgH/iIkB/Vtdu15D1rkJbtQjckb
hztsQlX6uIFsXyFM/cTPevCIr5GtC+eJPtbIHsA+4dJBXR+wl/ZT4mQOgjzezzgr
Ak4bw4AzXl9ZpRKndCRnbUAjqQ3s+4OIyv4mra/nAGnqDu+GJA8vYTeHb5Eso3ie
nDFg+WM8RLL6kpGctPko2dLuqpeWxbndLq6aw9sLTl7i+m77J5WcNQt3EZaEz9iI
Hkcvmn7Leu/mNt6APU+6kv+0PRPWZkZfEbi0IXNmBWdN+Y1cwD2BfrjIcOsi6LEc
FZcHqxWdwK3GmIznD/xDxY+y22Cc4rbBVNgY862dj8Q+TxazZ+9bluyACXsCHN4=
=ae3d
-----END PGP SIGNATURE-----

--ncX6roZrNNHXnAbh--
