From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: skip the clock initialization for exynos5440
Date: Tue, 08 Jan 2013 09:35:29 -0800
Message-ID: <097801cdedc6$8eb22700$ac167500$@samsung.com>
References: <1356996838-21796-1-git-send-email-kgene.kim@samsung.com>
 <CAOesGMjaaGtGh8SOJVUWU+nJ2kJ9ZfhA=ieutmZRuNYu=2W2gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37419 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756778Ab3AHRfu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jan 2013 12:35:50 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGB00D2KI7N0EV0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 02:35:48 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGB00696I7MAN90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 02:35:48 +0900 (KST)
In-reply-to: <CAOesGMjaaGtGh8SOJVUWU+nJ2kJ9ZfhA=ieutmZRuNYu=2W2gw@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> Hi,
> 
> On Mon, Dec 31, 2012 at 3:33 PM, Kukjin Kim <kgene.kim@samsung.com>
> wrote:
> > Since exynos5440 can support only common clk stuff, so this
> > patch skips legacy exynos5 clock initialization.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/mach-exynos/common.c |    7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-
> exynos/common.c
> > index d6d0dc6..1a89824 100644
> > --- a/arch/arm/mach-exynos/common.c
> > +++ b/arch/arm/mach-exynos/common.c
> > @@ -424,11 +424,18 @@ static void __init exynos5_init_clocks(int xtal)
> >  {
> >         printk(KERN_DEBUG "%s: initializing clocks\n", __func__);
> >
> > +       /* EXYNOS5440 can support only common clock framework */
> > +
> > +       if (soc_is_exynos5440())
> > +               return;
> > +
> > +#ifdef CONFIG_SOC_EXYNOS5250
> 
> Why are you adding an ifdef here, when the return above will take care
> of returning early for 5440?
> 
Without this, compilation error should be happened when we builds only for
exynos5440 without selection exynos5250, because you know, current
exynos5440 stuff cannot support legacy exynos5 clock. Of course, the ifdef
will be going away when we support common clock on all of exynos stuff, but
it's v3.9 not v3.8 so I think, we need this for now.
Note, exynos5440 is working fine on current mainline + v3.8-samsung-fixes-2
without any configuration clock stuff in kernel because hardware initial
value is ok.

- Kukjin
