From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 06/27] ARM: S5P64X0: 2nd Change to using
 s3c_gpio_cfgpin_range()
Date: Sat, 02 Oct 2010 20:16:48 +0900
Message-ID: <014b01cb6223$510dafe0$f3290fa0$%kim@samsung.com>
References: <1285934724-5007-1-git-send-email-kgene.kim@samsung.com>
 <1285934724-5007-7-git-send-email-kgene.kim@samsung.com>
 <AANLkTimBW5udfRN=0=ZHoAwkn+2ewyUX-0B5jLfrsT+i@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36841 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754734Ab0JBLQe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Oct 2010 07:16:34 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9N006FLTZKAE90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 02 Oct 2010 20:16:32 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9N0097ATZKHY@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 02 Oct 2010 20:16:32 +0900 (KST)
In-reply-to: <AANLkTimBW5udfRN=0=ZHoAwkn+2ewyUX-0B5jLfrsT+i@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
>=20
> Hi,
>=20
Hi :-)

> On Fri, Oct 1, 2010 at 9:05 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > This patch changes the code setting ranges of GPIO pins in mach-s5p=
64x0
using
> > s3c_gpio_cfgpin() to use the recently introduced
s3c_gpio_cfgpin_range().
> > NOTE: This is for missed things from the previous patch.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/mach-s5p64x0/dev-spi.c =A0 =A0| =A0 24 ++++++++++++----=
--------
> > =A0arch/arm/mach-s5p64x0/setup-i2c0.c | =A0 =A06 ++----
> > =A0arch/arm/mach-s5p64x0/setup-i2c1.c | =A0 =A06 ++----
> > =A03 files changed, 16 insertions(+), 20 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5p64x0/dev-spi.c
b/arch/arm/mach-s5p64x0/dev-spi.c
> > index 5b69ec4..be64fee 100644
> > --- a/arch/arm/mach-s5p64x0/dev-spi.c
> > +++ b/arch/arm/mach-s5p64x0/dev-spi.c
> > @@ -39,20 +39,18 @@ static char *s5p64x0_spi_src_clks[] =3D {
> > =A0*/
> > =A0static int s5p6440_spi_cfg_gpio(struct platform_device *pdev)
> > =A0{
> > + =A0 =A0 =A0 unsigned int base;
> > +
> > =A0 =A0 =A0 =A0switch (pdev->id) {
> > =A0 =A0 =A0 =A0case 0:
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPC(0), S3C_G=
PIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPC(1), S3C_G=
PIO_SFN(2));
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPC(2), S3C_G=
PIO_SFN(2));
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6440_GPC(0);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPC(0), S3C=
_GPIO_PULL_UP);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPC(1), S3C=
_GPIO_PULL_UP);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPC(2), S3C=
_GPIO_PULL_UP);
>=20
> Also make a wrapper, s3c_gpio_cfgrange_pullup, then you can also
> remove above codes.
> There's lots of codes use PULL_UP as default pin setup.
>=20
Thanks for your suggestion.
Ok..will consider it.

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
