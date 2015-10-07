From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/6] ARM: s3c24xx: rx1950: Use PWM lookup table
Date: Wed, 7 Oct 2015 17:31:51 +0200
Message-ID: <20151007153151.GB1975@ulmo>
References: <1444049237-29878-1-git-send-email-thierry.reding@gmail.com>
 <1444049237-29878-3-git-send-email-thierry.reding@gmail.com>
 <561476FA.4090209@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:38894 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753551AbbJGPbz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Oct 2015 11:31:55 -0400
Received: by wiclk2 with SMTP id lk2so34412570wic.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2015 08:31:53 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <561476FA.4090209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2015 at 10:35:54AM +0900, Krzysztof Kozlowski wrote:
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
> >  arch/arm/mach-s3c24xx/mach-rx1950.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24x=
x/mach-rx1950.c
> > index 1d35ff375a01..774c982a7b7e 100644
> > --- a/arch/arm/mach-s3c24xx/mach-rx1950.c
> > +++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
> > @@ -375,6 +375,11 @@ static struct s3c2410fb_mach_info rx1950_lcd_cfg =
=3D {
> > =20
> >  };
> > =20
> > +static struct pwm_lookup rx1950_pwm_lookup[] =3D {
> > +	PWM_LOOKUP("samsung-pwm", 0, "pwm-backlight.0", NULL, 48000,
>=20
> Why the dev_id is "pwm-backlight.0"? Created platform device name is
> "pwm-backlight".

"pwm-backlight" is only the base name. The platform bus code will use
the platform_device.id field and append it to the name as .<id> unless
it is -1 in which case it will be skipped. So in the rx1950_backlight
device the .id field isn't initialized at all, so it will be zeroed
out and hence the device name will become "pwm-backlight.0".

Thierry

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWFTrlAAoJEN0jrNd/PrOhXpoP+gJfgabEJIFsGlRpHqhnBpNa
KCwVfG/RYbj3dFIFwvisld3g+GfzO+P2qn4vKgJPPSG2OfmuvAsABO35KpUN3thG
KySjPlqyPuoQmFP0Ftw4729vWhcjCag9J9nIQKRyIXufOGKVrR40lccvZwC0l0+d
a33elS4Qpw4dcDq7JHTqK7Yr2m7PPA3IKgmdIJjVVOjmXkKCIxTe95wk60dBc2E1
n7hD25uBpl6Jqc/WTlByG1xi6mclJIdW6IgEOQPxc8CLTwkY9WxfmCCKcT2bg7Bd
WT3JYM9R1dPm0LCF2Gx/W6Mr9h0u3EKyJY2WmexrvZl8AEawSGlpvcxpHS58zwDs
ugc0jtdsOvVOMcXfspkScJOWghq6JqKIJ5S6u0sxtQmtakeBaBAJGXbN/dVSQAbc
GSBsQWIgcPcFKuOvah9xk+FoO1KEp7qKuhAz4TK7V5SZPX0lW4USFdEzPKt9sbUU
ynClqK+jJ4VXt5za+1lMQKHY+C5xVNM5muLFgOZfofOuZvUMlVdqn9yaheW/PnWM
+4DmBzTONlmt1/q5BfBcB1KHtQgE0fngBmW5CxZBwp+N/UeYzqQDKMY24TO1beYS
9qHzyHkVlbCIgdovi3N3ICWo7XmoyfJBabpqawu+NnNpeXK3y2zKiOBIlMqTEhyW
IwTye8II8fVXD4SmwjBT
=u/62
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
