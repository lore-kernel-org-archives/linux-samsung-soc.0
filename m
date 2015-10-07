From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5/6] ARM: s3c64xx: hmt: Use PWM lookup table
Date: Wed, 7 Oct 2015 17:37:24 +0200
Message-ID: <20151007153724.GC1975@ulmo>
References: <1444049237-29878-1-git-send-email-thierry.reding@gmail.com>
 <1444049237-29878-6-git-send-email-thierry.reding@gmail.com>
 <56147766.6010703@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:33186 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754188AbbJGPh1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Oct 2015 11:37:27 -0400
Received: by wiclk2 with SMTP id lk2so219599721wic.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2015 08:37:26 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <56147766.6010703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2015 at 10:37:42AM +0900, Krzysztof Kozlowski wrote:
> On 05.10.2015 21:47, Thierry Reding wrote:
> > Use a PWM lookup table to provide the PWM to the pwm-backlight device.
> > The driver has a legacy code path that is required only because boards
> > still use the legacy method of requesting PWMs by global ID. Replacing
> > these usages allows that legacy fallback to be removed.
> >=20
> > Cc: Kukjin Kim <kgene@kernel.org>
> > Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
> > ---
> >  arch/arm/mach-s3c64xx/mach-hmt.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c b/arch/arm/mach-s3c64xx/m=
ach-hmt.c
> > index e4b087c58ee6..816b39d1e6d1 100644
> > --- a/arch/arm/mach-s3c64xx/mach-hmt.c
> > +++ b/arch/arm/mach-s3c64xx/mach-hmt.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/gpio.h>
> >  #include <linux/delay.h>
> >  #include <linux/leds.h>
> > +#include <linux/pwm.h>
> >  #include <linux/pwm_backlight.h>
> >  #include <linux/mtd/mtd.h>
> >  #include <linux/mtd/partitions.h>
> > @@ -73,6 +74,11 @@ static struct s3c2410_uartcfg hmt_uartcfgs[] __initd=
ata =3D {
> >  	},
> >  };
> > =20
> > +static struct pwm_lookup hmt_pwm_lookup[] =3D {
> > +	PWM_LOOKUP("samsung-pwm", 1, "pwm-backlight.0", NULL,
>=20
> Same questions as in patch 2 - why suffix ".0" for "pwm-backlight"?

For the same reason that I explained in patch 2. Not sure if the .id =3D 0
was really supposed to be. For most devices it would probably make sense
to initialize it to -1 because they typically only have a single
backlight. But given that userspace might be using the name to control
the backlight via sysfs it's probably not a good idea to go and change
that.

Thierry

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWFTw0AAoJEN0jrNd/PrOhsg0P/1CP867ONw9m/UxthFU4xxw7
mMUNwUCOVzENxEGTAKbkK8tH5UPLgMn9fLCmc7U2vo57AP26B9CWMw+h3cPmc0l5
msR5xTjUywGS+DLiDcCsZ62FcIZmsoRLek6o+boThxkc7lFHEwvjy/Nfo8+DFd62
eh5HwDtn4C0woq10394ljtksapVhXHs9vuBjQoMedu3l4wPB1s6HhG3tBbvcjIAW
A9KE1jpoAvBn9DWSd8IVdGibO5iJ8GhDm7ZsTpKeJ27Z+gqSZBUGeLouAYwRvvcR
1yrhGFmFdFbSz4grnbHFH1PUtr4X90J69xVNJjkw0bSuy43WhRKsIHisBu7+4WGe
1cbMqNYbvHXjT5XpR+oPQXaQZ4a6guxpswejUm6CKCHFVo6DOx+WG/FBZfudzp1M
fqdJyymD9AX8itD0fiWlHhawp0Na4xB83MmubCiUcnITaUtAh9JDTCAjacwh7WqX
F/H3kHxVQ/eu5wUCvrgWVjY+KO7K0JDL+h4rwP6jsx8wKMyp7sbWND4jmnU5j0Fd
z2CnW1hh3kDahKcKuDAuKUEx1TfiWOYupEMXkA032IDurrjStRuj15k9Gwg66spO
ohXBKJQ3LNCxYmGNbKtd+qgxsIALX3tQA+xPSWBiqHC/ymJ2wfb4J4RIiZ+fHp8K
epdFoWZf6cRLM2dECF2i
=JgYz
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--
