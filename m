From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 1/2] s3c24xx: DMA: don't use autoreload feature
Date: Wed, 8 Sep 2010 09:27:43 +0300
Message-ID: <201009080927.49861.anarsoul@gmail.com>
References: <1283872143-32492-1-git-send-email-anarsoul@gmail.com> <1283901799-20461-1-git-send-email-anarsoul@gmail.com> <4C86CC9C.9070506@fluff.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1860527.UetX5r5Of4";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:35608 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757238Ab0IHG2d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Sep 2010 02:28:33 -0400
Received: by ewy23 with SMTP id 23so2825371ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2010 23:28:31 -0700 (PDT)
In-Reply-To: <4C86CC9C.9070506@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>, Thomas Kleffel <tk@maintech.de>, linux-samsung-soc@vger.kernel.org

--nextPart1860527.UetX5r5Of4
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
8 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2010 02:37:00 =D0=B0=D0=
=B2=D1=82=D0=BE=D1=80 Ben Dooks =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On 08/09/10 00:23, Vasily Khoruzhick wrote:
> > Some integrated DMA-capable hardware doesn't like autoreload
> > feature of s3c24xx DMA-engine, that's why s3cmci driver
> > didn't work with DMA transfers enabled.
> >=20
> > I rewrote DMA driver not to use autoreload feature and removed
> > all pre-loading features. Buffer re-load is fast enought to perform
> > it in IRQ handler, and anyway I don't see any reason to waste CPU
> > cycles on waiting for buffer load. Driver is much simplier now,
> > it was tested with s3cmci and s3c24xx-i2s drivers on s3c2442 and
> > s3c2410 SoCs and works just nice.
>=20
> I found this really necessary, especially on systems where some
> drivers can keep the cpu irq load high, such as pio hard-discs.
>=20
> Can this be changed to a flag that is set to control the behaviour
> on a per driver basis?

Well, that's not easy and result will be a bit complicated :) Your=20
implementation has 4 states and actively uses autoreload flag, but when=20
there's no autoreload/pre-loading there's only 2 states. Btw, all DMA-capab=
le=20
HW on S3C24xx has FIFO, so missing pre-loading should not give big impact, =
as=20
HW can be fed from FIFO for some time. Can you test if this patch causes so=
me=20
problems on your HW with pio hard-discs?

Regards
Vasily

--nextPart1860527.UetX5r5Of4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkyHLOUACgkQRM6pQpltKE4aLACfRQxUVox9K0TjGN7H7BOXO1Qt
rhAAn2qTazffANTQXgXYgWUzSb027zlU
=SVgR
-----END PGP SIGNATURE-----

--nextPart1860527.UetX5r5Of4--
