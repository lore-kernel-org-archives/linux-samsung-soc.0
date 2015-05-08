From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [RESEND] [PATCH 1/1] ARM: dts: Add LEDs on odroid XU3 board
Date: Fri, 08 May 2015 11:10:58 +0200
Message-ID: <554C7DA2.5050603@fivetechno.de>
References: <554C66F4.4070005@fivetechno.de> <554C6B28.7000306@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="px9sE2mTn9e2nWtKOjdhq7o4RI9KvA8oh"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:40472 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752289AbbEHJLB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 05:11:01 -0400
In-Reply-To: <554C6B28.7000306@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--px9sE2mTn9e2nWtKOjdhq7o4RI9KvA8oh
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Am 08.05.2015 um 09:52 schrieb Krzysztof Kozlowski:
> On 08.05.2015 16:34, Markus Reichl wrote:
>> This patch adds the RGB-LED on XU3 as 3 gpio-leds.
>=20
>> Tested-by: Anand Moon <linux.amoon@gmail.com>
>=20
> Unfortunately I could not found on LKML email from Anand that he
> tested it. You sent the patch first time on 2nd of April - without
> Anand's tested-by. On 13th of April it appeared with his tag.
>=20
> Guys, even when you work closely please send all tags publicly on LKML
> so everyone could see them.
>=20
> Anand, do you confirm the tested-by?
>=20
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de> --- It is
>> derived from hardkernel's 3.10 tree.
>=20
> Hmmm... Whose original code it was? Shouldn't there be someone else
> Signed-off-by here?

I sent a mail to HK guys to get the respective contact address for
another signed-off tag.

After this and Anand's tag I'll come back with a resend.
>=20
> Best regards,
> Krzysztof
>=20
>=20
Best Regards,
--=20
Markus Reichl


--px9sE2mTn9e2nWtKOjdhq7o4RI9KvA8oh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlVMfaIACgkQ7DLr+WDJfp7A4QCgmJpQW0bupLAiGsiMwNnFLnpj
M7kAn0J6m51GI197JssjCDJI+vG+yMIK
=wXbm
-----END PGP SIGNATURE-----

--px9sE2mTn9e2nWtKOjdhq7o4RI9KvA8oh--
