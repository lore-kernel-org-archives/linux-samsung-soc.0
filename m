From: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Fri, 15 Jul 2016 11:56:53 -0400
Message-ID: <1468598213.3819.2.camel@ndufresne.ca>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de>
 <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com>
 <5788CA67.5090200@samsung.com> <5788E1EB.4030003@math.uni-bielefeld.de>
 <5788E31D.6010606@samsung.com> <5788E3CB.5080103@math.uni-bielefeld.de>
 <5788E457.6060202@samsung.com> <5788F449.6060202@math.uni-bielefeld.de>
Reply-To: nicolas@ndufresne.ca
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-/jvZ1Th/k+TDzBEQGidO"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45154 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751000AbcGOP47 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2016 11:56:59 -0400
In-Reply-To: <5788F449.6060202@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>


--=-/jvZ1Th/k+TDzBEQGidO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 juillet 2016 =C3=A0 16:33 +0200, Tobias Jakobi a =C3=A9crit=
=C2=A0:
> I can confirm that this indeed doesn't work.
>=20
> chidori ~ # echo 1 > /proc/sys/kernel/sysrq
> chidori ~ # echo s > /proc/sysrq-trigger
> chidori ~ # echo u > /proc/sysrq-trigger
> chidori ~ # echo b > /proc/sysrq-trigger
> <board hangs, only red power LED on>
>=20
> I guess Nicolas is seeing a different or another problem here though.

Well for me both method hangs. On an extra note, reset inside Uboot
works, but reboot in Linux hang. I tried adding a trace
in=C2=A0syscon_restart_handle(), but the trace is never displayed. I'm
wondering if that handler is ever called, or if it's just that the
serial console was shut down already.

Any idea what else should I trace ?

Nicolas
--=-/jvZ1Th/k+TDzBEQGidO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAleJB8UACgkQcVMCLawGqByX/gCgx4UVJopynwfoEXzIl0RVPWAF
r+4AnRXcpkrJQfxLKCb0u5hM9X5wHjon
=2TWu
-----END PGP SIGNATURE-----

--=-/jvZ1Th/k+TDzBEQGidO--
