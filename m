From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 09/14] regulator: s2mpa01: zero-initialize regulator
 match table array
Date: Mon, 3 Nov 2014 15:56:23 +0000
Message-ID: <20141103155623.GW3815@sirena.org.uk>
References: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
 <1415025649-8119-10-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V2AZ19bMCakBLong"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35650 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752023AbaKCP5l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Nov 2014 10:57:41 -0500
Content-Disposition: inline
In-Reply-To: <1415025649-8119-10-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org


--V2AZ19bMCakBLong
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 03, 2014 at 03:40:44PM +0100, Javier Martinez Canillas wrote:
> The struct of_regulator_match rmatch[] is declared as a non-static local
> variable so the structure members are not auto-initialized.

Applied, thanks.

--V2AZ19bMCakBLong
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUV6WmAAoJECTWi3JdVIfQemMH/iHG4WkC7Vi3CPPaW6O9FCj7
nKO1ac+qPyjEdyc+V/RuGdUt6UgvojJk9nXljRgbepLj6scRAItGqpElagG0T0YL
ql2utJt8VKO4vAWRFnzPKa7DQQJBsjTAvTghk5fHi4iuRQw5V2N/gkgt0kgqHggB
p1kojdA4+u31HDHRvrKlvtO7vhII5uR+30M/6adWVURX0VN6IphJooPdOwS1FWCa
bz+BtqAse6nAfeW0fWO/W3/VRaBZ6WXdJzzthfEgoXGE/6zwmnjPh5Z5AGcaKPHC
Y/IlolIQmyqvr1efhdxpmOb2ZI+gBhHfl0t9GPTzoGg6CnKfxyh8GMvCN6eMhJM=
=SH1K
-----END PGP SIGNATURE-----

--V2AZ19bMCakBLong--
