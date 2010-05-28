From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 05/15] ARM: S5P6442: Change to using
	s3c_gpio_cfgpin_range()
Date: Fri, 28 May 2010 07:35:46 +0100
Message-ID: <20100528063546.GV4720@trinity.fluff.org>
References: <1275026212-27510-1-git-send-email-ben-linux@fluff.org> <1275026212-27510-6-git-send-email-ben-linux@fluff.org> <AANLkTilPCk0NqJ7od6ZBorqPrlG0xCjdPaim1Q3WwZMH@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:59890 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751313Ab0E1Gfv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 May 2010 02:35:51 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTilPCk0NqJ7od6ZBorqPrlG0xCjdPaim1Q3WwZMH@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Fri, May 28, 2010 at 03:24:02PM +0900, Kyungmin Park wrote:
> Hi,
>=20
> Looks good but I'm afraid it's more difficult to find pin
> configuration from typo.

I'm not sure if that's really so much of a problem.
=20
> On Fri, May 28, 2010 at 2:56 PM, Ben Dooks <ben-linux@fluff.org> wrot=
e:
> > Change the code setting ranges of GPIO pins using s3c_gpio_cfgpin()=
 to
> > use the recently introduced s3c_gpio_cfgpin_range().
> >
> > Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> > ---
> > =A0arch/arm/mach-s5p6442/dev-audio.c | =A0 30 ++++++++++-----------=
---------
> > =A0arch/arm/mach-s5p6442/dev-spi.c =A0 | =A0 =A04 +---
> > =A02 files changed, 11 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5p6442/dev-audio.c b/arch/arm/mach-s5p6=
442/dev-audio.c
> > index cb801e1..0e57caf 100644
> > --- a/arch/arm/mach-s5p6442/dev-audio.c
> > +++ b/arch/arm/mach-s5p6442/dev-audio.c
> > @@ -21,22 +21,16 @@
> >
> > =A0static int s5p6442_cfg_i2s(struct platform_device *pdev)
> > =A0{
> > + =A0 =A0 =A0 unsigned int base;
> > +
> > =A0 =A0 =A0 =A0/* configure GPIO for i2s port */
> > =A0 =A0 =A0 =A0switch (pdev->id) {
> > =A0 =A0 =A0 =A0case 1:
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(0), S3C_=
GPIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(1), S3C_=
GPIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(2), S3C_=
GPIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(3), S3C_=
GPIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(4), S3C_=
GPIO_SFN(2));
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6442_GPC1(0);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> >
> > =A0 =A0 =A0 =A0case -1:
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(0), S3C_=
GPIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(1), S3C_=
GPIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(2), S3C_=
GPIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(3), S3C_=
GPIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(4), S3C_=
GPIO_SFN(2));
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6442_GPC0(0);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> >
> > =A0 =A0 =A0 =A0default:
> > @@ -44,6 +38,7 @@ static int s5p6442_cfg_i2s(struct platform_device=
 *pdev)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> > =A0 =A0 =A0 =A0}
> >
> > + =A0 =A0 =A0 s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(2));
> > =A0 =A0 =A0 =A0return 0;
> > =A0}
> >
> > @@ -111,21 +106,15 @@ struct platform_device s5p6442_device_iis1 =3D=
 {
> >
> > =A0static int s5p6442_pcm_cfg_gpio(struct platform_device *pdev)
> > =A0{
> > + =A0 =A0 =A0 unsigned int base;
> > +
> > =A0 =A0 =A0 =A0switch (pdev->id) {
> > =A0 =A0 =A0 =A0case 0:
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(0), S3C_=
GPIO_SFN(3));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(1), S3C_=
GPIO_SFN(3));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(2), S3C_=
GPIO_SFN(3));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(3), S3C_=
GPIO_SFN(3));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(4), S3C_=
GPIO_SFN(3));
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6442_GPC0(0);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> >
> > =A0 =A0 =A0 =A0case 1:
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(0), S3C_=
GPIO_SFN(3));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(1), S3C_=
GPIO_SFN(3));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(2), S3C_=
GPIO_SFN(3));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(3), S3C_=
GPIO_SFN(3));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(4), S3C_=
GPIO_SFN(3));
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6442_GPC1(0);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> >
> > =A0 =A0 =A0 =A0default:
> > @@ -133,6 +122,7 @@ static int s5p6442_pcm_cfg_gpio(struct platform=
_device *pdev)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> > =A0 =A0 =A0 =A0}
> >
> > + =A0 =A0 =A0 s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));
> > =A0 =A0 =A0 =A0return 0;
> > =A0}
> >
> > diff --git a/arch/arm/mach-s5p6442/dev-spi.c b/arch/arm/mach-s5p644=
2/dev-spi.c
> > index 3019952..1c5c170 100644
> > --- a/arch/arm/mach-s5p6442/dev-spi.c
> > +++ b/arch/arm/mach-s5p6442/dev-spi.c
> > @@ -37,9 +37,7 @@ static int s5p6442_spi_cfg_gpio(struct platform_d=
evice *pdev)
> > =A0{
> > =A0 =A0 =A0 =A0switch (pdev->id) {
> > =A0 =A0 =A0 =A0case 0:
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPB(0), S3C_G=
PIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPB(2), S3C_G=
PIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPB(3), S3C_G=
PIO_SFN(2));
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin_range(S5P6442_GPB(0),=
 4, S3C_GPIO_SFN(2));
>=20
> Where's the GPB(1)???

you're right, this is an invalid change. will back it out.
=20
> Thank you,
> Kyungmin Park
>=20
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6442_GPB(0), S3C=
_GPIO_PULL_UP);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6442_GPB(2), S3C=
_GPIO_PULL_UP);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6442_GPB(3), S3C=
_GPIO_PULL_UP);
> > --
> > 1.6.3.3
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
> >

--=20
--=20
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
