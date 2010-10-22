From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Add the missed s3c_gpio_getpull() API
Date: Fri, 22 Oct 2010 17:05:32 +0900
Message-ID: <004901cb71bf$e8be50f0$ba3af2d0$%kim@samsung.com>
References: <1287648286-7202-1-git-send-email-kgene.kim@samsung.com>
 <4CC07CC2.50206@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54655 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752952Ab0JVIFa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Oct 2010 04:05:30 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAO007Y7MGPQKD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Oct 2010 17:05:13 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAO00H3UMGOUF@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Oct 2010 17:05:13 +0900 (KST)
In-reply-to: <4CC07CC2.50206@mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Daein Moon' <moon9124@samsung.com>, ben-linux@fluff.org

Sergei Shtylyov wrote:
> 
> Hello.
> 
Hi,

> On 21-10-2010 12:04, Kukjin Kim wrote:
> 
> > From: Daein Moon<moon9124@samsung.com>
> 
> > This patch adds the s3c_gpio_getpull() API that has been missed in the
> > plat-samsung/gpio-config.c and actullay there is its extern declaration
> > in plat/gpio-cfg.h.
> 
> > Signed-off-by: Daein Moon<moon9124@samsung.com>
> > Cc: Ben Dooks<ben-linux@fluff.org>
> > Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> > ---
> > NOTE:
> > - already issued about this
> 
> >   arch/arm/plat-samsung/gpio-config.c                |   19
> +++++++++++++++++++
> >   .../plat-samsung/include/plat/gpio-cfg-helpers.h   |    6 ++++++
> >   2 files changed, 25 insertions(+), 0 deletions(-)
> 
> > diff --git a/arch/arm/plat-samsung/gpio-config.c b/arch/arm/plat-
> samsung/gpio-config.c
> > index 8a37211..b732b77 100644
> > --- a/arch/arm/plat-samsung/gpio-config.c
> > +++ b/arch/arm/plat-samsung/gpio-config.c
> [...]
> > diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
> b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
> > index 3e21c75..c417f85 100644
> > --- a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
> > +++ b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
> > @@ -42,6 +42,12 @@ static inline int s3c_gpio_do_setpull(struct
> s3c_gpio_chip *chip,
> >   	return (chip->config->set_pull)(chip, off, pull);
> >   }
> >
> > +static inline unsigned s3c_gpio_do_getpull(struct s3c_gpio_chip *chip,
> > +					   unsigned int off)
> > +{
> > +	return (chip->config->get_pull)(chip, off);
> 
>     Parens are not necessary here.
> 
Thanks for your pointing out :-)
Will fix it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
