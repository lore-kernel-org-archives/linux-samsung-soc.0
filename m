From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH RFC] h1940: use gpiolib for latch access
Date: Mon, 26 Jul 2010 08:40:35 +0300
Message-ID: <201007260841.25560.anarsoul@gmail.com>
References: <1280076072-1049-1-git-send-email-anarsoul@gmail.com> <20100725223521.GA14747@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1850512.7WOld7qRzS";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:52256 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805Ab0GZFmb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Jul 2010 01:42:31 -0400
Received: by ewy23 with SMTP id 23so708711ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Jul 2010 22:42:29 -0700 (PDT)
In-Reply-To: <20100725223521.GA14747@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

--nextPart1850512.7WOld7qRzS
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
26 =D0=B8=D1=8E=D0=BB=D1=8F 2010 01:35:21 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Ru=
ssell King - ARM Linux =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Sun, Jul 25, 2010 at 07:41:12PM +0300, Vasily Khoruzhick wrote:
> > diff --git a/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> > b/arch/arm/mach-s3c2410/include/mach/h1940-latch.h index
> > d8a8327..4607d5c 100644
> > --- a/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> > +++ b/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> > @@ -14,51 +14,30 @@
> >=20
> >  #ifndef __ASM_ARCH_H1940_LATCH_H
> >  #define __ASM_ARCH_H1940_LATCH_H
> >=20
> > +#include <mach/gpio.h>
>=20
> Would linux/gpio.h make more sense here?

Nope, mach/gpio.h is for S3C_GPIO_END

Regards
Vasily

--nextPart1850512.7WOld7qRzS
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEUEABECAAYFAkxNIAUACgkQRM6pQpltKE551wCdEleFWC29DQUUlUbSmPsgQrWY
HfsAl3dsakAHNNrhcl5pCeSn8TsWjPo=
=zjTQ
-----END PGP SIGNATURE-----

--nextPart1850512.7WOld7qRzS--
