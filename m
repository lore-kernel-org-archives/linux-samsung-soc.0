From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] Asoc: Samsung: Add I2S S/W RST in startup function
Date: Sat, 26 Jan 2013 15:25:33 +0800
Message-ID: <20130126072531.GM10580@opensource.wolfsonmicro.com>
References: <1359030931-27354-1-git-send-email-rcsekar@samsung.com>
 <1359030931-27354-2-git-send-email-rcsekar@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AGBBLMjITsWHeOTZ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:49253 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751337Ab3AZHZp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Jan 2013 02:25:45 -0500
Content-Disposition: inline
In-Reply-To: <1359030931-27354-2-git-send-email-rcsekar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "R. Chandrasekar" <rcsekar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, jassisinghbrar@gmail.com, Padmavathi Venna <padma.v@samsung.com>


--AGBBLMjITsWHeOTZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 06:05:31PM +0530, R. Chandrasekar wrote:
> From: Padmavathi Venna <padma.v@samsung.com>
>=20
> I2S module need to be reset after S2R. Keeping the S/W rst
> control part in resume didn't help in playing audio after resume.
> So this patch adds S/W RST control part in startup function which
> gets triggered for every new audio stream playback.

Applied, thanks.  Please use subject lines matching the subsystem.

--AGBBLMjITsWHeOTZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRA4TlAAoJELSic+t+oim9giEP/11t1InU71S8WBp9gqU5KD2y
Mhjb2jV5pQJBoBGqbDkYna94Q1CGObKkVKrpmR3oX9mq91RfXhVWX/LrMB/ct2PO
zGPQXa70RcG12ATpAZwlIUJForCI0VsEoDeU4eLVS6lcl41UkPsi5+TkSufCuY6Y
Mc4xAQi3CVHJ/YN4xacy/GbPVJ4AKk2ea9PGfDWI4c/yTtZifULy0WHddTjr6ehU
/UvdVre+koZtRD4oxrVHnPKpA4D2uteH/oTU2jGpCmMBSLiTxZWAKuKBm2vGkbsi
KjsJUtILptnXXqMmUAtRCmxJb5h1FER9/fnFXE48VDL61Tr8UO+MZBlPZprQ6fzZ
mx0UaO/C7tXpUEwCUVur0ymFZHMyXwVNfUNgSMFHWknug3IyOpeXYyEXEwi1cPfD
juGKqMp2r0UYXnn89tLaakONMFZsxmc84yBVrAF0fynQloh4f4V2YhpRFcCP0eFP
A0Gj6DoXcxlUPVuv0QMElBZqqIpgtFghhZ03FKlz0uf8pWluBvbY7JqaJMMlWo16
C0803WAN0v24vWPyTea6zzHk/6JgjzvxTWvvZ0piYpPhqL8aHmvDSgLnHP1c1kA9
uwV5Kbt4ylWKbhu092wacCKukaM7y3sbuTzfKdliH6FY5kLuW8EE0HJek2NvgSmw
ksDmVnAx3/d8CErTgz6N
=jorE
-----END PGP SIGNATURE-----

--AGBBLMjITsWHeOTZ--
