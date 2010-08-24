From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 3/3] h1940: implement mmc_power function
Date: Tue, 24 Aug 2010 17:00:26 +0300
Message-ID: <201008241700.31513.anarsoul@gmail.com>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com> <1282230003-2020-4-git-send-email-anarsoul@gmail.com> <201008241552.42856.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart49338063.jIVDgSOpbq";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:65440 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751375Ab0HXOAk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Aug 2010 10:00:40 -0400
Received: by eyg5 with SMTP id 5so3345763eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Aug 2010 07:00:38 -0700 (PDT)
In-Reply-To: <201008241552.42856.marek.vasut@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org

--nextPart49338063.jIVDgSOpbq
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
24 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 16:52:42 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Marek Vasut =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Dne =C4=8Ct 19. srpna 2010 17:00:03 Vasily Khoruzhick napsal(a):
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >=20
> >  arch/arm/mach-s3c2410/include/mach/h1940-latch.h |    2 +-
> >  arch/arm/mach-s3c2410/mach-h1940.c               |   23
> >=20
> > +++++++++++++++++++-- 2 files changed, 21 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> > b/arch/arm/mach-s3c2410/include/mach/h1940-latch.h index 73586f2..ef7d8=
cf
> > 100644
> > --- a/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> > +++ b/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> > @@ -35,7 +35,7 @@
> >=20
> >  #define H1940_LATCH_AUDIO_POWER		H1940_LATCH_GPIO(9)
> >  #define H1940_LATCH_SM803_ENABLE	H1940_LATCH_GPIO(10)
> >  #define H1940_LATCH_LCD_P4		H1940_LATCH_GPIO(11)
> >=20
> > -#define H1940_LATCH_CPUQ5		H1940_LATCH_GPIO(12)
> > +#define H1940_LATCH_SD_POWER		H1940_LATCH_GPIO(12)
> >=20
> >  #define H1940_LATCH_BLUETOOTH_POWER	H1940_LATCH_GPIO(13)
> >  #define H1940_LATCH_LED_GREEN		H1940_LATCH_GPIO(14)
> >  #define H1940_LATCH_LED_FLASH		H1940_LATCH_GPIO(15)
> >=20
> > diff --git a/arch/arm/mach-s3c2410/mach-h1940.c
> > b/arch/arm/mach-s3c2410/mach-h1940.c index 9717790..c1ccc8e 100644
> > --- a/arch/arm/mach-s3c2410/mach-h1940.c
> > +++ b/arch/arm/mach-s3c2410/mach-h1940.c
> > @@ -116,8 +116,7 @@ static unsigned int latch_state =3D
> > H1940_LATCH_BIT(H1940_LATCH_LCD_P4) |
> > H1940_LATCH_BIT(H1940_LATCH_LCD_P1)			|
> >=20
> >  	H1940_LATCH_BIT(H1940_LATCH_LCD_P2)			|
> >  	H1940_LATCH_BIT(H1940_LATCH_LCD_P3)			|
> >=20
> > -	H1940_LATCH_BIT(H1940_LATCH_MAX1698_nSHUTDOWN)   |
> > -	H1940_LATCH_BIT(H1940_LATCH_CPUQ5);
> > +	H1940_LATCH_BIT(H1940_LATCH_MAX1698_nSHUTDOWN);
> >=20
> >  static void h1940_latch_control(unsigned int clear, unsigned int set)
> >  {
> >=20
> > @@ -259,10 +258,25 @@ static struct platform_device
> > h1940_device_bluetooth =3D { .id               =3D -1,
> >=20
> >  };
> >=20
> > +static void h1940_set_mmc_power(unsigned char power_mode, unsigned sho=
rt
> > vdd) +{
> > +	switch (power_mode) {
> > +	case MMC_POWER_OFF:
> > +		gpio_set_value(H1940_LATCH_SD_POWER, 0);
> > +		break;
> > +	case MMC_POWER_UP:
> > +	case MMC_POWER_ON:
> > +		gpio_set_value(H1940_LATCH_SD_POWER, 1);
> > +		break;
> > +	default:
> > +		break;
> > +	};
> > +}
> > +
> >=20
> >  static struct s3c24xx_mci_pdata h1940_mmc_cfg __initdata =3D {
> > =20
> >  	.gpio_detect   =3D S3C2410_GPF(5),
> >  	.gpio_wprotect =3D S3C2410_GPH(8),
> >=20
> > -	.set_power     =3D NULL,
> > +	.set_power     =3D h1940_set_mmc_power,
> >=20
> >  	.ocr_avail     =3D MMC_VDD_32_33,
> > =20
> >  };
>=20
> Can't you implement gpio_power into the s3c24xx mmc driver ? Then you can
> fix mach-n30 too.

Well, I'm happy with callback. However, maybe it worth to replace set_power=
=20
callback with regulator.

> > @@ -402,6 +416,9 @@ static void __init h1940_init(void)
> >=20
> >  	gpio_request(H1940_LATCH_USB_DP, "USB pullup");
> >  	gpio_direction_output(H1940_LATCH_USB_DP, 0);
> >=20
> > +	gpio_request(H1940_LATCH_SD_POWER, "SD power");
> > +	gpio_direction_output(H1940_LATCH_SD_POWER, 0);
>=20
> Please handle possible return values here !

Ok, I suppose WARN_ON will be enought?

--nextPart49338063.jIVDgSOpbq
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkxz0H8ACgkQRM6pQpltKE6TnQCghwWpejxwO2jH9YaE/G6vQOSx
uooAn1yU/Kdy7RcL0D5TpMB99usmHB6d
=YOJ5
-----END PGP SIGNATURE-----

--nextPart49338063.jIVDgSOpbq--
