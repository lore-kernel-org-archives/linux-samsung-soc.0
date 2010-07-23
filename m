From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [patch 1/1] i2c-s3c2410: Enable i2c clock only when doing some transfert
Date: Fri, 23 Jul 2010 12:02:49 +0300
Message-ID: <201007231202.54301.anarsoul@gmail.com>
References: <20100715130636.136905589@rtp-net.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart14554145.fUqrODMvCN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:49663 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752455Ab0GWJEA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jul 2010 05:04:00 -0400
In-Reply-To: <20100715130636.136905589@rtp-net.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>
Cc: ben-linux@fluff.org, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

--nextPart14554145.fUqrODMvCN
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
15 =D0=B8=D1=8E=D0=BB=D1=8F 2010 16:06:14 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Ar=
naud Patard =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> This patch modify the s3c2410 i2c driver behaviour to enable the
> i2c clock only when needed. I'm not sure if this has a big impact
> on power usage but at least it's fixing a bug with the uda1380
> codec which needs to be hard reset'ed if the i2c clock is enabled
> before it's powered on (at least on h1940).
>=20
> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>

=46ixes same bug with uda1380 on rx1950 aswell.

Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

--nextPart14554145.fUqrODMvCN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAkxJWr4ACgkQRM6pQpltKE6bAwCgoDjhCexp48nSXg8Gpmr+jchT
9GAAoNwU+WChJH/UdLf1UlWfaW2agCDH
=tsPS
-----END PGP SIGNATURE-----

--nextPart14554145.fUqrODMvCN--
