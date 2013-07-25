From: Mark Brown <broonie@kernel.org>
Subject: XCLKOUT in exynos5250 clock driver
Date: Thu, 25 Jul 2013 15:51:58 +0100
Message-ID: <20130725145158.GI9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fs3dgQsp/rzZxMmQ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35916 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756404Ab3GYOwX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 10:52:23 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--fs3dgQsp/rzZxMmQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I appear to be missing something in the clock driver for the exynos5250.
I'm looking at the Arndale schematic and I see that the audio master
clock is connected to XCLKOUT on the SoC.  However I can't see any
reference to XCLKOUT or anything similar in the clock driver or any of
the DTS files - where is this clock exposed by the clock driver?

Unfortunately I haven't been able to get access to the datasheet for the
part so I can't check this myself.

--fs3dgQsp/rzZxMmQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR8TuLAAoJELSic+t+oim9B0EP/2Xad1DXBbnl2mceH3n9Z4VI
PGq/V5+v/4Zg3mYXGllfEfg0bWdI+epaiWvicCm6NU5rEYx+9bi1hZ7Pq8u377Nq
LP0v5q7aW3dpscIr+5SKDLMxYVrdzHvcyrivK2BTwoLlZ3Tmwa1sYs8X2zDGnDXd
H//PZ6nQgfIPgIoLh4UWbCLtfkceW1xNuPQ+FipwNwCY54or7NBFeCKqCLFu9dbC
ZsbGgtiFRz5YCI48ut1YL1gPCKhzACKqsE3xZX6YqWFo6XZ9n3sxrhafMMLtoB24
QJWXIdWfoQ3jwhVfNEURBexnDmj7XDnJjO5VMKBVGraj7r8DtZywu4WPKQ7DI1eg
6bmoR8NgZXHRCtKI+ug4cQFJdN8cGJcBDuqcK6OwtCxIWFhz/p5wqUqM6ujZ5CIM
wRluhRmRcTlqmMg5hht0ARD3yV5cuOtr4URENQ/UK0DcJQvPrWMFkyuwANlBnHas
bnamEPnorJofZMM8D7kHXa5MbMbH2K0pboxt94+iIrhg5jWjFot/fvRKWyWd66SJ
1TTzKwXhO4qHmHaZqUdv4f2hMl17HDk8X5QvwhUdZLhlAP1KSwjyOytNKJRWMZCa
WghCq/OisVHmincQCz4cyQkcciLMb1cQQx1n2JCIexuxkBy9YgIGjyvUi84tFCm9
/rfHk8IJbPR0RmgAvQc/
=xM9h
-----END PGP SIGNATURE-----

--fs3dgQsp/rzZxMmQ--
