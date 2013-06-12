From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 1/6] clk: samsung: Use clk->base instead of directly
 using clk->con0 for PLL3xxx
Date: Wed, 12 Jun 2013 13:33:50 -0700
Message-ID: <CAD=FV=VTLkH9oDqr263Kyv=wCEbuQ40VL7mtC73SCMt20NPwgQ@mail.gmail.com>
References: <1370272196-4346-1-git-send-email-yadi.brar@samsung.com>
	<1370272196-4346-2-git-send-email-yadi.brar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:60636 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756972Ab3FLUdw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 16:33:52 -0400
Received: by mail-lb0-f174.google.com with SMTP id x10so7051773lbi.33
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 13:33:50 -0700 (PDT)
In-Reply-To: <1370272196-4346-2-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, Patch Tracking <patches@linaro.org>, Andrew Bresticker <abrestic@chromium.org>

Yadwinder,

On Mon, Jun 3, 2013 at 8:09 AM, Yadwinder Singh Brar
<yadi.brar@samsung.com> wrote:
> This patch unifies clk strutures used for PLL35xx & PLL36xx and uses clk->base
> instead of directly using clk->con0, so that possible common code can be
> factored out.
> It also introdues common pll_[readl/writel] macros for the users of common
> samsung_clk_pll struct.
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Tested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c    |   10 ++++--
>  drivers/clk/samsung/clk-exynos5250.c |   14 ++++----
>  drivers/clk/samsung/clk-pll.c        |   54 ++++++++++++++++++---------------
>  drivers/clk/samsung/clk-pll.h        |    4 +-
>  4 files changed, 44 insertions(+), 38 deletions(-)

So.  We just found that this type of solution doesn't work on
exynos5420, since the LOCK and CON registers aren't always 0x100 away
from each other.  Perhaps you can adjust to use a solution like Andrew
proposed in <https://gerrit.chromium.org/gerrit/#/c/58411/>?  That way
we can avoid some churn of changing this code twice.

The number of parameters to the register PLL function is starting to
get unwieldy.  At some point we'll probably want to pass in a
structure.  I wonder if now would be the time?  Certainly it would be
easier to handle changes to the code without touching all of the
exynos variants...

Thanks!

-Doug
