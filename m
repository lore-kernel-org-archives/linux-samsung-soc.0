From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] drm/exynos: Support DP CLKCON register in FIMD driver
Date: Wed, 25 Jun 2014 09:49:55 +0900
Message-ID: <003d01cf900f$61cd56f0$256804d0$%han@samsung.com>
References: <1403608164-23728-1-git-send-email-ajaykumar.rs@samsung.com>
 <53A9769A.5030907@samsung.com>
 <CAEC9eQNWrejZmXtYNoc3w6SF05kOXh2QPjDM0A73pssE=kEeTQ@mail.gmail.com>
 <53A987E6.8090609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15087 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752088AbaFYAt6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 20:49:58 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7P0050G8Z8KE20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jun 2014 09:49:56 +0900 (KST)
In-reply-to: <53A987E6.8090609@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ajay kumar' <ajaynumb@gmail.com>, 'Andrzej Hajda' <a.hajda@samsung.com>
Cc: 'Ajay Kumar' <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 'InKi Dae' <inki.dae@samsung.com>, 'Sean Paul' <seanpaul@google.com>, 'sunil joshi' <joshi@samsung.com>, 'Prashanth G' <prashanth.g@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, June 24, 2014 11:15 PM, Andrzej Hajda wrote:
> On 06/24/2014 03:14 PM, Ajay kumar wrote:
> > On Tue, Jun 24, 2014 at 9:01 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> >> Hi Ajay,
> >>
> >> On 06/24/2014 01:09 PM, Ajay Kumar wrote:
> >>> Add the missing setting for DP CLKCON register.
> >>>
> >>> This register is present on Exynos5 based FIMD controllers,
> >>> and needs to be used if we are using DP.
> >>>
> >>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >>> ---
> >>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |    5 +++++
> >>>  include/video/samsung_fimd.h             |    4 ++++
> >>>  2 files changed, 9 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> >>> index 33161ad..5d3045d 100644
> >>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> >>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> >>> @@ -72,6 +72,7 @@ struct fimd_driver_data {
> >>>       unsigned int has_shadowcon:1;
> >>>       unsigned int has_clksel:1;
> >>>       unsigned int has_limited_fmt:1;
> >>> +     unsigned int has_dp_clkcon:1;
> >>>  };
> >>>
> >>>  static struct fimd_driver_data s3c64xx_fimd_driver_data = {
> >>> @@ -88,6 +89,7 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
> >>>  static struct fimd_driver_data exynos5_fimd_driver_data = {
> >>>       .timing_base = 0x20000,
> >>>       .has_shadowcon = 1,
> >>> +     .has_dp_clkcon = 1,
> >>>  };
> >>>
> >>>  struct fimd_win_data {
> >>> @@ -331,6 +333,9 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
> >>>       if (clkdiv > 1)
> >>>               val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
> >>>
> >>> +     if (ctx->driver_data->has_dp_clkcon)
> >>> +             writel(DP_CLK_ENABLE, ctx->regs + DP_CLKCON);
> >>> +
> >> This code always enables the clock on exynos5. As I understand it should
> >> be enabled only if DP is used.
> > Right!
> > But, when I searched for the display interface,
> > only exynos4 based boards use MIPI/DPI, and all exynos5 based boards use DP.
> > So, I thought adding this in driver_data for exynos5 should be fine.

No, it should be selectable. Even some exynos5 based boards use MIPI LCD.

> 
> Arndale and Arndale-Octa have MIPI/DSI interface with MIPI/LVDS bridge.
> 
> >
> > Inki/Andrej - Shall I add it as an optional DT property?
> 
> No, property is redundant. The simplest solution could be to use
> CONFIG_DRM_EXYNOS_DP
> macro but it is quite ugly.

Right, CONFIG_DRM_EXYNOS_DP is the simplest. But, the macro doesn't
look good.

> I guess extending little bit exynos_drm framework to allow detection of
> DP in fimd would be better.

I agree on Andrzej's opinion.

Best regards,
Jingoo Han

> 
> Regards
> Andrzej
> 
> >
> > Ajay
> >>
> >>>       writel(val, ctx->regs + VIDCON0);
> >>>  }
> >>>
> >>> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> >>> index b039320..d8f4b0b 100644
> >>> --- a/include/video/samsung_fimd.h
> >>> +++ b/include/video/samsung_fimd.h
> >>> @@ -435,6 +435,10 @@
> >>>  #define BLENDCON_NEW_8BIT_ALPHA_VALUE                (1 << 0)
> >>>  #define BLENDCON_NEW_4BIT_ALPHA_VALUE                (0 << 0)
> >>>
> >>> +/* Video clock enable for DP */
> >>> +#define DP_CLKCON                            0x27C
> >>> +#define DP_CLK_ENABLE                                0x2
> >>> +
> >>>  /* Notes on per-window bpp settings
> >>>   *
> >>>   * Value     Win0     Win1     Win2     Win3     Win 4
> >>>
