From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V5 1/2] video: exynos_dp: Add device tree support to DP driver
Date: Fri, 12 Oct 2012 23:54:48 +0200
Message-ID: <1909932.BXc5ALaqMM@flatron>
References: <1350074859-23226-1-git-send-email-ajaykumar.rs@samsung.com> <50788F25.2040003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:51301 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752570Ab2JLVys convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Oct 2012 17:54:48 -0400
In-Reply-To: <50788F25.2040003@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, jg1.han@samsung.com, devicetree-discuss@lists.ozlabs.org, FlorianSchandinat@gmx.de, thomas.ab@samsung.com

Dnia pi=C4=85tek, 12 pa=C5=BAdziernika 2012 23:44:05 Sylwester Nawrocki=
 pisze:
> On 10/12/2012 10:47 PM, Ajay Kumar wrote:
> > This patch enables device tree based discovery support for DP drive=
r.
> > The driver is modified to handle platform data in both the cases:
> > with DT and non-DT.
> >=20
> > Signed-off-by: Ajay Kumar<ajaykumar.rs@samsung.com>
> > Acked-by: Jingoo Han<jg1.han@samsung.com>
> > ---
> >=20
> >   drivers/video/exynos/exynos_dp_core.c |  161
> >   ++++++++++++++++++++++++++++++---
> >   drivers/video/exynos/exynos_dp_core.h |    2 +
> >   2 files changed, 149 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/video/exynos/exynos_dp_core.c
> > b/drivers/video/exynos/exynos_dp_core.c index d55470e..62932ba 1006=
44
> > --- a/drivers/video/exynos/exynos_dp_core.c
> > +++ b/drivers/video/exynos/exynos_dp_core.c
> > @@ -18,6 +18,7 @@
> >=20
> >   #include<linux/io.h>
> >   #include<linux/interrupt.h>
> >   #include<linux/delay.h>
> >=20
> > +#include<linux/of.h>
> >=20
> >   #include<video/exynos_dp.h>
> >=20
> > @@ -856,6 +857,99 @@ static irqreturn_t exynos_dp_irq_handler(int i=
rq,
> > void *arg)>=20
> >   	return IRQ_HANDLED;
> >  =20
> >   }
> >=20
> > +#ifdef CONFIG_OF
> > +struct exynos_dp_platdata *exynos_dp_dt_parse_pdata(struct device
> > *dev)
> > +{
> > +	struct device_node *dp_node =3D dev->of_node;
> > +	struct exynos_dp_platdata *pd;
> > +	struct video_info *dp_video_config;
> > +
> > +	pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> > +	if (!pd) {
> > +		dev_err(dev, "memory allocation for pdata failed\n");
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +	dp_video_config =3D devm_kzalloc(dev,
> > +				sizeof(*dp_video_config), GFP_KERNEL);
> > +
> > +	if (!dp_video_config) {
> > +		dev_err(dev, "memory allocation for video config failed\n");
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +	pd->video_info =3D dp_video_config;
> > +
> > +	if (of_get_property(dp_node, "hsync-active-high", NULL))
> > +		dp_video_config->h_sync_polarity =3D 1;
> > +
> > +	if (of_get_property(dp_node, "vsync-active-high", NULL))
> > +		dp_video_config->v_sync_polarity =3D 1;
> > +
> > +	if (of_get_property(dp_node, "interlaced", NULL))
> > +		dp_video_config->interlaced =3D 1;
>=20
> of_property_read_bool() could also be used here.

Wouldn't it make the property mandatory?

I would just use of_find_property here, instead of of_get_property.

Best regards,
Tomasz Figa
