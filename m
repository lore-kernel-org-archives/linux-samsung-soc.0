From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 3/3] h1940: implement mmc_power function
Date: Tue, 24 Aug 2010 18:19:37 +0300
Message-ID: <201008241819.43833.anarsoul@gmail.com>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com> <201008241756.11529.anarsoul@gmail.com> <201008241707.31629.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1305922.Nv0rAGY5II";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:33756 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507Ab0HXPTw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Aug 2010 11:19:52 -0400
Received: by eyg5 with SMTP id 5so3422055eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Aug 2010 08:19:51 -0700 (PDT)
In-Reply-To: <201008241707.31629.marek.vasut@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org

--nextPart1305922.Nv0rAGY5II
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
24 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 18:07:31 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Marek Vasut =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> See my previous response. It'd increase code size, but if you mark that
> code __init, it'll be freed after that function finishes so it doesn't
> matter.
>=20
> If something wrong goes on, you can still debug it without for example MMC
> card (though if you continued probing the MMC driver, it might cause
> additional unwanted noise and make the debugging harder). That's the whole
> point.

Ok, but I also want to hear Ben's opinion on this point.

Regards
Vasily

--nextPart1305922.Nv0rAGY5II
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkxz4w8ACgkQRM6pQpltKE7pkgCcCHrX5tpw1asAzv+DNx+gsBfk
GFgAoNHUgMpemw8QzHUuK239BkO5cdq1
=LArs
-----END PGP SIGNATURE-----

--nextPart1305922.Nv0rAGY5II--
