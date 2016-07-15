From: Nicolas Dufresne <nicolas.dufresne@gmail.com>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Fri, 15 Jul 2016 09:50:18 -0400
Message-ID: <1468590618.4209.5.camel@gmail.com>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de>
	 <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com>
Reply-To: nicolas@ndufresne.ca
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-5wBKjGYg/2pTaOFosrX6"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:34136 "EHLO
	mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcGONuW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2016 09:50:22 -0400
Received: by mail-qk0-f169.google.com with SMTP id o67so101677871qke.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Jul 2016 06:50:22 -0700 (PDT)
In-Reply-To: <578896DB.7060708@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>


--=-5wBKjGYg/2pTaOFosrX6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 juillet 2016 =C3=A0 09:55 +0200, Krzysztof Kozlowski a
=C3=A9crit=C2=A0:
>=20
> First of all - use just command "reboot" to restart. It should work.
> If
> it doesn't, please let us now.

It does not work with reboot either, though no OOPS, just hang. Is the
trace at sysrq reboot really a OOPS? I believed it was just a dump of
the 3 other CPU at the moment the request was made.

>=20
> I was able to reproduce your issue - OOPS in emergency restart - also
> in
> my configuration (U3 + eMMC + network boot).
>=20
> It is weird... I'll take a look at it.

Btw, my configuration is U2 + SD boot. Any ways I can gather provide
better informations ?

Nicolas
--=-5wBKjGYg/2pTaOFosrX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAleI6hoACgkQcVMCLawGqBzQmgCeOQWwpNlGdOonnCm1cl0a5Giu
jEAAn0q0l4DKdbQntuu0y/ySWpcMx0OS
=dayp
-----END PGP SIGNATURE-----

--=-5wBKjGYg/2pTaOFosrX6--
