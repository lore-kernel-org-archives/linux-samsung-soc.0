From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 1/3] h1940: use gpiolib for latch access
Date: Tue, 24 Aug 2010 17:04:00 +0300
Message-ID: <201008241704.07384.anarsoul@gmail.com>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com> <1282230003-2020-2-git-send-email-anarsoul@gmail.com> <201008241549.51513.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1717541.z4KcmYva04";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:54289 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754927Ab0HXOEQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Aug 2010 10:04:16 -0400
Received: by eyg5 with SMTP id 5so3349252eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Aug 2010 07:04:15 -0700 (PDT)
In-Reply-To: <201008241549.51513.marek.vasut@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org

--nextPart1717541.z4KcmYva04
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
24 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 16:49:51 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Marek Vasut =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:

> > +	ret =3D gpio_request(H1940_LATCH_BLUETOOTH_POWER, dev_name(&pdev-
>dev));
>=20
> This should contain the name of the GPIO, not dev_name I assume.

Ok

> > +	if (ret) {
> > +		gpio_free(S3C2410_GPH(1));
>=20
> What's this constant (the 1) here ? Maybe some sane #define wont hurt or
> comment around it.

GPH(1) specifies gpio bit, that's not magic constant.

> > +#ifndef __ASSEMBLY__
> > +#define H1940_LATCH		((void __force __iomem *)0xF8000000)
> > +#else
> > +#define H1940_LATCH		0xF8000000
> > +#endif
>=20
> Is the __ASSEMBLY__ really needed ? You can establish mapping when the
> kernel boots (looks like you're doing that already) but then use
> __raw_readX __raw_writeX to access that space instead of this stuff above.

Uh, I just moved this code from another file, not sure if __ASSEMBLY__ is=20
necessary, I'll remove it if it is not.
=20
Thanks for review :)

Regards
Vasily

--nextPart1717541.z4KcmYva04
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkxz0VcACgkQRM6pQpltKE6AhgCfZZfe9auuMOQPHniFWOXODGNt
5dMAmgKsIDBWmuHY/bY3BS5YfYSQAcpc
=KzrT
-----END PGP SIGNATURE-----

--nextPart1717541.z4KcmYva04--
