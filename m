From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 1/3] rx1950: add battery device
Date: Wed, 8 Sep 2010 02:10:05 +0300
Message-ID: <201009080210.12621.anarsoul@gmail.com>
References: <1283869946-28296-1-git-send-email-anarsoul@gmail.com> <1283869946-28296-2-git-send-email-anarsoul@gmail.com> <4C86C56B.7090204@fluff.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5788478.ceURuh9c9T";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:38711 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871Ab0IGXLB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 19:11:01 -0400
Received: by ewy23 with SMTP id 23so2678075ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2010 16:11:00 -0700 (PDT)
In-Reply-To: <4C86C56B.7090204@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

--nextPart5788478.ceURuh9c9T
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
8 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2010 02:06:19 =D0=B0=D0=
=B2=D1=82=D0=BE=D1=80 Ben Dooks =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On 07/09/10 15:32, Vasily Khoruzhick wrote:
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >=20
> >  arch/arm/mach-s3c2440/Kconfig       |    3 +
> >  arch/arm/mach-s3c2440/mach-rx1950.c |  160
> >  +++++++++++++++++++++++++++++++++++ 2 files changed, 163 insertions(+),
> >  0 deletions(-)
> >=20
> > diff --git a/arch/arm/mach-s3c2440/Kconfig
> > b/arch/arm/mach-s3c2440/Kconfig index cd8e7de..9b6b026 100644
> > --- a/arch/arm/mach-s3c2440/Kconfig
> > +++ b/arch/arm/mach-s3c2440/Kconfig
> > @@ -198,6 +198,9 @@ config MACH_RX1950
> >=20
> >  	select S3C_DEV_NAND
> >  	select S3C2410_IOTIMING if S3C2440_CPUFREQ
> >  	select S3C2440_XTAL_16934400
> >=20
> > +	select S3C_ADC
> > +	select PDA_POWER
> > +	select BATTERY_S3C_ADC
>=20
> not keen on forcing these on unless they are required for the
> system to work.

Ok

> > +	{3629, 178, 10},
> > +	{3612, 162, 5},
> > +	{3605, 162, 0},
> > +
>=20
> at least add a space after { and before }
> it would be nice to have named initialisers.

Ok, I'll add named initialisers

Regards
Vasily

--nextPart5788478.ceURuh9c9T
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkyGxlQACgkQRM6pQpltKE6txACdEgelserZ6c3wo8nZlPEFl/Ha
DesAniKVI8BI/Qn3R4/rx7hYASxuYwaV
=e4xv
-----END PGP SIGNATURE-----

--nextPart5788478.ceURuh9c9T--
