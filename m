From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 1/2] s3c24xx: DMA: don't use autoreload feature
Date: Fri, 27 Aug 2010 23:03:01 +0300
Message-ID: <201008272303.10803.anarsoul@gmail.com>
References: <1282143866-8068-1-git-send-email-anarsoul@gmail.com> <1282143866-8068-2-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2954327.xbq8ityEG8";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:43510 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752758Ab0H0UD2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Aug 2010 16:03:28 -0400
Received: by eyg5 with SMTP id 5so2385701eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Aug 2010 13:03:27 -0700 (PDT)
In-Reply-To: <1282143866-8068-2-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Kleffel <tk@maintech.de>

--nextPart2954327.xbq8ityEG8
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
18 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 18:04:25 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Vasily Khoruzhick =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=BB:
> Some integrated DMA-capable hardware doesn't like autoreload
> feature of s3c24xx DMA-engine, that's why s3cmci driver
> didn't work with DMA transfers enabled.
>=20
> I rewrote DMA driver not to use autoreload feature and removed
> all pre-loading features. Buffer re-load is fast enought to perform
> it in IRQ handler, and anyway I don't see any reason to waste CPU
> cycles on waiting for buffer load. Driver is much simplier now,
> it was tested with s3cmci and s3c24xx-i2s drivers on s3c2442 and
> s3c2410 SoCs and works just nice.
=20
Patch has problem with suspend/resume (chan->dcon is clobbered by
dma_sel->select())

Will resend fixed version soon.

Regards
Vasily

--nextPart2954327.xbq8ityEG8
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkx4Gf4ACgkQRM6pQpltKE6gLQCgzpORAN/ZshJgEN5gxwD0g4yC
7KsAnRf4kNZSpZQFo/bdykEwJwkdjprv
=5Z7s
-----END PGP SIGNATURE-----

--nextPart2954327.xbq8ityEG8--
