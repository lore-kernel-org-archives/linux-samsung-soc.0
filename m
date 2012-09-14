From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH V2] ARM: EXYNOS5: Add bus clock and set parent clock for FIMD
Date: Fri, 14 Sep 2012 11:12:55 +0530
Message-ID: <CAL1wa8fjKRisTrfKaPF22EPSoamJZJKd5oN7fKA397e77TNQvg@mail.gmail.com>
References: <1347450536-21843-1-git-send-email-l.krishna@samsung.com> <001101cd9231$3927b9d0$ab772d70$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:40768 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751971Ab2INFnP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 01:43:15 -0400
Received: by pbbrr13 with SMTP id rr13so5094484pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Sep 2012 22:43:15 -0700 (PDT)
In-Reply-To: <001101cd9231$3927b9d0$ab772d70$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com

On Fri, Sep 14, 2012 at 9:57 AM, Jingoo Han <jg1.han@samsung.com> wrote:
>
> On Wednesday, September 12, 2012 8:49 PM Leela Krishna Amudala wrote
> >
> > This patch adds the bus clock for FIMD and changes the device name for
> > lcd clock
> > also sets mout_mpll_user as parent clock to fimd
> >
> > Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> > ---
> >  arch/arm/mach-exynos/clock-exynos5.c       |   34
> > +++++++++++++++++++--------
> >  arch/arm/plat-samsung/include/plat/clock.h |    2 +
> >  2 files changed, 26 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/clock-exynos5.c
> > b/arch/arm/mach-exynos/clock-exynos5.c
> > index 774533c..205d19f 100644
> > --- a/arch/arm/mach-exynos/clock-exynos5.c
> > +++ b/arch/arm/mach-exynos/clock-exynos5.c
> > @@ -891,6 +891,13 @@ static struct clk exynos5_clk_mdma1 = {
>
> [.....]
>
> >
> > +struct clksrc_clk exynos5_clk_sclk_fimd = {
>
> Replace 'exynos5_clk_sclk_fimd' with 'exynos5_clk_sclk_fimd1'.
> This is because 'exynos5_clk_sclk_fimd0' can be added for other
> Exynos5 SoCs later.
>

Okay, will change it and post the next version.

> Best regards,
> Jingoo Han
>
> > +     .clk    = {
> > +             .name           = "sclk_fimd",
> > +             .devname        = "exynos5-fb.1",
> > +             .enable         = exynos5_clksrc_mask_disp1_0_ctrl,
> > +             .ctrlbit        = (1 << 0),
> > +     },
> > +     .sources = &exynos5_clkset_group,
> > +     .reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift = 0, .size = 4
> > },
> > +     .reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift = 0, .size = 4
> > },
> > +};
> > +
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
