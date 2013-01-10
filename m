From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC PATCH 4/7] ARM: s3c64xx: Fix build error with CONFIG_S3C_DEV_FB disabled
Date: Thu, 10 Jan 2013 01:32:23 +0100
Message-ID: <1401472.7Bu2KnNRJB@flatron>
References: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com> <1357774909-29938-5-git-send-email-tomasz.figa@gmail.com> <00a201cdeec7$99f5d560$cde18020$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:51918 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932224Ab3AJAcX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 19:32:23 -0500
Received: by mail-ea0-f172.google.com with SMTP id f13so487977eaa.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jan 2013 16:32:22 -0800 (PST)
In-Reply-To: <00a201cdeec7$99f5d560$cde18020$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk

Hi Kukjin,

On Wednesday 09 of January 2013 16:15:23 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > If there is no board selecting CONFIG_S3C_DEV_FB enabled, build will
> > fail
> on
> 
> > arch/arm/mach-s3c64xx/pm.c, where s3c_device_fb is referenced.
> > 
> > This patch adds ifdef guard around the code making it compile only
> > when
> > CONFIG_S3C_DEV_FB is enabled.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > ---
> > 
> >  arch/arm/mach-s3c64xx/pm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
> > index f6b13a2..3686785 100644
> > --- a/arch/arm/mach-s3c64xx/pm.c
> > +++ b/arch/arm/mach-s3c64xx/pm.c
> > @@ -338,10 +338,10 @@ int __init s3c64xx_pm_init(void)
> > 
> >  	for (i = 0; i < ARRAY_SIZE(s3c64xx_pm_domains); i++)
> >  	
> >  		pm_genpd_init(&s3c64xx_pm_domains[i]->pd, NULL, false);
> > 
> > -
> > +#ifdef CONFIG_S3C_DEV_FB
> > 
> >  	if (dev_get_platdata(&s3c_device_fb.dev))
> >  	
> >  		pm_genpd_add_device(&s3c64xx_pm_f.pd,
> > 
> > &s3c_device_fb.dev);
> > -
> > +#endif
> > 
> >  	return 0;
> >  
> >  }
> > 
> > --
> > 1.8.1
> 
> This should be separated patch from this series as a fix.

Right.
 
> Let me pick this up into -fixes.

No problem.

Best regards,
Tomasz Figa
