From: Mark Brown <broonie@kernel.org>
Subject: Re: XCLKOUT in exynos5250 clock driver
Date: Fri, 26 Jul 2013 12:39:34 +0100
Message-ID: <20130726113934.GD9858@sirena.org.uk>
References: <20130725145158.GI9858@sirena.org.uk>
 <51F247B6.9010902@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JOyJTfkrbmCrhSmw"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58152 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752425Ab3GZLj7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 07:39:59 -0400
Content-Disposition: inline
In-Reply-To: <51F247B6.9010902@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--JOyJTfkrbmCrhSmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 26, 2013 at 03:26:06PM +0530, Tushar Behera wrote:

> Information as per Exynos5250 user manual:
> "XCLKOUT is an output pin for debugging clocks. Exynos5250 has a CLKOUT
> logic which can select one of the clocks (within its clock domains) and
> output that through XCLKOUT pin."

Yeah, I know what XCLKOUT is but to implement this in the driver and DT
I'd need to know about the register or registers that are used to
configure the mux.

> Not sure if XCLKOUT on Arndale schematics means the same.

I'd be astonished if it meant anything else, it's fairly clearly
labelled as that on the schematics and this is a *very* common pattern
in system designs using Samsung SoCs.

--JOyJTfkrbmCrhSmw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR8l/zAAoJELSic+t+oim9jKEP/34thAkQMjqa8tTFigGvCxd5
CCx0GcgHRYNyGsdRLQVmLFROQCMtP3OiRFdXjkTcViaPJ+mOZUlGHAGnKBWvqEUw
9Fsyy4ws1RT3om45AD21Wiu397zYQU2d0itEpMW+o3zJX0SGjqAWuE4DmQ7cvpc6
vFWGR6F9RRoVq6gCSPBlHEz8Ly77jbNuqLx5cnGmpxr4SYFYKxOKKLVmBOEGpcq7
OWgXcsj0jcc2P/dK1vW1bb8MoN4jxdfCOLkU2uiioCS0MYqtdbxo6WqPXks/0Qex
Ln4wd9wnTjtJ7j8kjwchAj4g8YJgR10ER853rIznB0qXlKWh5SqhgXQ3mf0C6MAO
0cEJcTysySVk8sBAgN0CYwOsbqSlNU3OJs+exqZeF2kv5WI5TxBi9IYL9lZKR5x0
MbKWZpb71waiqHvIIcZDeho7Mbnq/Y8MqEp2nFpfQ0QJ5XBJRKOC3c9z6xMsmPwt
kuW7HTO0JQUcIv7i0c93FP9xEtvivcj/r7kbn4ZX33QfcPcEfU8c5qTuk+X5dzJI
I96okN0pCxV1NbPpPsj+dyhTl+TDn28Tz5gBhLgo4YQDbPQtojHeDqFR8OhTTvTL
Oy/Lw/BiqKyl2gtGoCTGtlEXltkm2FdsTZnvSDqliq7QsnfocLNkstAm4QvMdglI
PRDA+rg5FJOmddWb/mkd
=1KwT
-----END PGP SIGNATURE-----

--JOyJTfkrbmCrhSmw--
