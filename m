From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH RFC] h1940: use gpiolib for latch access
Date: Thu, 19 Aug 2010 16:56:27 +0300
Message-ID: <201008191656.36727.anarsoul@gmail.com>
References: <1280076072-1049-1-git-send-email-anarsoul@gmail.com> <4C5986AB.40103@simtec.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3301310.A0aSvxZybZ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:46682 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751542Ab0HSN6T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Aug 2010 09:58:19 -0400
Received: by eyg5 with SMTP id 5so1263986eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Aug 2010 06:58:18 -0700 (PDT)
In-Reply-To: <4C5986AB.40103@simtec.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@simtec.co.uk>
Cc: Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

--nextPart3301310.A0aSvxZybZ
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
4 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 18:26:35 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Ben Dooks =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> >  	/* Configures BT serial port GPIOs */
> >  	s3c_gpio_cfgpin(S3C2410_GPH(0), S3C2410_GPH0_nCTS0);
> >=20
> > -	s3c_gpio_cfgpull(S3C2410_GPH(0), S3C_GPIO_PULL_NONE);
> > +	s3c_gpio_setpull(S3C2410_GPH(0), S3C_GPIO_PULL_NONE);
> >=20
> >  	s3c_gpio_cfgpin(S3C2410_GPH(1), S3C2410_GPIO_OUTPUT);
> >=20
> > -	s3c_gpio_cfgpull(S3C2410_GPH(1), S3C_GPIO_PULL_NONE);
> > +	s3c_gpio_setpull(S3C2410_GPH(1), S3C_GPIO_PULL_NONE);
> >=20
> >  	s3c_gpio_cfgpin(S3C2410_GPH(2), S3C2410_GPH2_TXD0);
> >=20
> > -	s3c_gpio_cfgpull(S3C2410_GPH(2), S3C_GPIO_PULL_NONE);
> > +	s3c_gpio_setpull(S3C2410_GPH(2), S3C_GPIO_PULL_NONE);
> >=20
> >  	s3c_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
> >=20
> > -	s3c_gpio_cfgpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
> > +	s3c_gpio_setpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
>=20
> Is this an error, or have you merged a part of a different patch
> into this one?

Will move into separate patch
=20
> > +#define H1940_PA_LATCH		(S3C2410_CS2)
> > +
> > +#define H1940_LATCH_GPIO(x)		(S3C_GPIO_END + x)
> > +
> > +#define H1940_LATCH_BIT(x)		(1 << (x + 16 - S3C_GPIO_END))
>=20
> you probably want an () around the 'x's in the above defines.

Yep
=20
> computing the bit seperately to the call to h1940_latch_control
> would have made the code easier to read.
>=20
> > +	h1940_latch_control(value ? 0 : (1 << (offset + 16)),
> > +		value ? (1 << (offset + 16)) : 0);

Ok

Regards
Vasily

--nextPart3301310.A0aSvxZybZ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEUEABECAAYFAkxtOBQACgkQRM6pQpltKE47RACYsdd5T/WMVg3RN8oI6haOWrWQ
oACdHMlrMdUYAD3kvdBWTHH1zMOy3yw=
=i3jO
-----END PGP SIGNATURE-----

--nextPart3301310.A0aSvxZybZ--
