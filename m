From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 1/6] clk: samsung: Use clk->base instead of directly using clk->con0 for PLL3xxx
Date: Wed, 12 Jun 2013 23:19:42 +0200
Message-ID: <1501124.EVQA8KO0ic@flatron>
References: <1370272196-4346-1-git-send-email-yadi.brar@samsung.com> <1370272196-4346-2-git-send-email-yadi.brar@samsung.com> <CAD=FV=VTLkH9oDqr263Kyv=wCEbuQ40VL7mtC73SCMt20NPwgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f180.google.com ([209.85.215.180]:44460 "EHLO
	mail-ea0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756711Ab3FLVTp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 17:19:45 -0400
Received: by mail-ea0-f180.google.com with SMTP id k10so7381635eaj.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 14:19:44 -0700 (PDT)
In-Reply-To: <CAD=FV=VTLkH9oDqr263Kyv=wCEbuQ40VL7mtC73SCMt20NPwgQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Yadwinder Singh Brar <yadi.brar@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, Patch Tracking <patches@linaro.org>, Andrew Bresticker <abrestic@chromium.org>

Hi,

On Wednesday 12 of June 2013 13:33:50 Doug Anderson wrote:
> Yadwinder,
> 
> On Mon, Jun 3, 2013 at 8:09 AM, Yadwinder Singh Brar
> 
> <yadi.brar@samsung.com> wrote:
> > This patch unifies clk strutures used for PLL35xx & PLL36xx and uses
> > clk->base instead of directly using clk->con0, so that possible
> > common code can be factored out.
> > It also introdues common pll_[readl/writel] macros for the users of
> > common samsung_clk_pll struct.
> > 
> > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> > Reviewed-by: Doug Anderson <dianders@chromium.org>
> > Tested-by: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> > ---
> > 
> >  drivers/clk/samsung/clk-exynos4.c    |   10 ++++--
> >  drivers/clk/samsung/clk-exynos5250.c |   14 ++++----
> >  drivers/clk/samsung/clk-pll.c        |   54
> >  ++++++++++++++++++--------------- drivers/clk/samsung/clk-pll.h     
> >    |    4 +-
> >  4 files changed, 44 insertions(+), 38 deletions(-)
> 
> So.  We just found that this type of solution doesn't work on
> exynos5420, since the LOCK and CON registers aren't always 0x100 away
> from each other.

Oops, this is what I've been afraid of, ever since we assumed this first 
time in our internal patches.

> Perhaps you can adjust to use a solution like Andrew
> proposed in <https://gerrit.chromium.org/gerrit/#/c/58411/>?  That way
> we can avoid some churn of changing this code twice.
> 
> The number of parameters to the register PLL function is starting to
> get unwieldy.  At some point we'll probably want to pass in a
> structure.  I wonder if now would be the time?  Certainly it would be
> easier to handle changes to the code without touching all of the
> exynos variants...

Hmm, if done properly, it could simplify PLL registration in SoC clock 
initialization code a lot.

I'm not sure if this is really the best solution (feel free to suggest 
anything better), but we could put PLLs in an array, like other clocks, 
e.g.

	... exynos4210_pll_clks[] = {
		CLK_PLL45XX(...),
		CLK_PLL45XX(...),
		CLK_PLL46XX(...),
		CLK_PLL46XX(...),
	};

and then just call a helper like

	samsung_clk_register_pll(exynos4210_pll_clks,
			ARRAY_SIZE(exynos4210_pll_clks));

Best regards,
Tomasz

> Thanks!
> 
> -Doug
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
