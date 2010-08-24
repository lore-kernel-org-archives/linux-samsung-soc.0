From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 3/3] h1940: implement mmc_power function
Date: Tue, 24 Aug 2010 17:56:06 +0300
Message-ID: <201008241756.11529.anarsoul@gmail.com>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com> <201008241721.11669.anarsoul@gmail.com> <201008241641.57621.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart67513561.ZAvecTi0R9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:62372 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470Ab0HXO4U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Aug 2010 10:56:20 -0400
Received: by ewy23 with SMTP id 23so3403096ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Aug 2010 07:56:19 -0700 (PDT)
In-Reply-To: <201008241641.57621.marek.vasut@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org

--nextPart67513561.ZAvecTi0R9
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
24 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 17:41:57 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Marek Vasut =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Dne =C3=9At 24. srpna 2010 16:21:01 Vasily Khoruzhick napsal(a):
> > =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 24 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 17:01:12 =D0=B0=D0=
=B2=D1=82=D0=BE=D1=80 Marek Vasut =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=BB:
> > > pr_err() and don't probe the device for which you couldn't request
> > > GPIO.
> >=20
> > Well, handling those errors in machine init functions doesn't make sens=
e.
> > PDA is not usable without basic hardware.
>=20
> You can use PDA without LCD for example (there are such people, trust me).
> So, this comment really isn't too valid. You can also use PDA without MMC
> support, you still have onboard flash, etc. etc.

But error handling here just increases code size, and gpio_request in init=
=20
function should always succeed. It means something's going really wrong=20
(kernel bug or misconfiguration) if gpio_request fails. Btw, Ben suggested =
to=20
use WARN_ON in machine init, look through init functions of qt2410, n30,=20
rx1950, vr1000, etc.

Regards
Vasily

--nextPart67513561.ZAvecTi0R9
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkxz3YsACgkQRM6pQpltKE67IwCdErNj7zfc2KahZ8oZKBlHYJhT
k18Anj+Kz26MZYIeZoswUj1p471Y5kjU
=JwK7
-----END PGP SIGNATURE-----

--nextPart67513561.ZAvecTi0R9--
