From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH RFT 1/2] drivers: bus: check cci device tree node
 status
Date: Wed, 10 Dec 2014 13:29:25 -0500 (EST)
Message-ID: <alpine.LFD.2.11.1412101328520.470@knanqh.ubzr>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com> <CAM4voakjWgnEXoXT1LH2ZFBy=U4vfXFXS1Su8VB7Cd3s3wqmSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f42.google.com ([209.85.216.42]:65017 "EHLO
	mail-qa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932744AbaLJS33 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Dec 2014 13:29:29 -0500
Received: by mail-qa0-f42.google.com with SMTP id j7so2409518qaq.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Dec 2014 10:29:28 -0800 (PST)
In-Reply-To: <CAM4voakjWgnEXoXT1LH2ZFBy=U4vfXFXS1Su8VB7Cd3s3wqmSA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, punit.agrawal@arm.com, Will Deacon <will.deacon@arm.com>, "mark.rutland" <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, =?ISO-8859-2?Q?Krzysztof_Koz=B3owski?= <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Arnd Bergmann <arnd@arndb.de>

On Wed, 10 Dec 2014, Abhilash Kesavan wrote:

> Hi,
> 
> On Fri, Nov 28, 2014 at 8:20 PM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
> > The arm-cci driver completes the probe sequence even if the cci node is
> > marked as disabled. Add a check in the driver to honour the cci status
> > in the device tree.
> >
> > Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> 
> This patch helps disable CCI on the Arndale Octa board thus resolving
> some imprecise aborts seen on that board. Kindly review.

Acked-by: Nicolas Pitre <nico@linaro.org>


> 
> Regards,
> Abhilash
> > ---
> >  drivers/bus/arm-cci.c |    3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
> > index 860da40..0ce5e2d 100644
> > --- a/drivers/bus/arm-cci.c
> > +++ b/drivers/bus/arm-cci.c
> > @@ -1312,6 +1312,9 @@ static int cci_probe(void)
> >         if (!np)
> >                 return -ENODEV;
> >
> > +       if (!of_device_is_available(np))
> > +               return -ENODEV;
> > +
> >         cci_config = of_match_node(arm_cci_matches, np)->data;
> >         if (!cci_config)
> >                 return -ENODEV;
> > --
> > 1.7.9.5
> >
> 
> 
