From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] mfd: Remove MFD_CROS_EC_SPI depends on OF
Date: Wed, 22 Jul 2015 08:17:11 +0100
Message-ID: <20150722071711.GS3061@x1>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
 <1435191645-6022-4-git-send-email-javier.martinez@collabora.co.uk>
 <20150625083830.GU15013@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:35407 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755862AbbGVHRQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jul 2015 03:17:16 -0400
Received: by wibxm9 with SMTP id xm9so149655109wib.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2015 00:17:14 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150625083830.GU15013@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>

On Thu, 25 Jun 2015, Lee Jones wrote:

> On Thu, 25 Jun 2015, Javier Martinez Canillas wrote:
>=20
> > The ChromeOS EC SPI transport driver has a dependency on OF because=
 it
> > uses some OF helpers from the <linux/of.h> header. But there isn't =
a
> > need for an explicit dependency since the header has stub functions=
 if
> > CONFIG_OF is not defined.
> >=20
> > Also, MFD_CROS_EC_SPI already depends on MFD_CROS_EC which in turn =
has
> > a dependency on OF so in practice can't be selected without CONFIG_=
OF.
> >=20
> > Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.=
co.uk>
> >=20
> > ---
> >=20
> >  drivers/mfd/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Applied for v4.3, thanks.

Now applied for v4.2, thanks.

> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 653815950aa2..3f68dd251ce8 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -115,7 +115,7 @@ config MFD_CROS_EC_I2C
> > =20
> >  config MFD_CROS_EC_SPI
> >  	tristate "ChromeOS Embedded Controller (SPI)"
> > -	depends on MFD_CROS_EC && CROS_EC_PROTO && SPI && OF
> > +	depends on MFD_CROS_EC && CROS_EC_PROTO && SPI
> > =20
> >  	---help---
> >  	  If you say Y here, you get support for talking to the ChromeOS =
EC
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
