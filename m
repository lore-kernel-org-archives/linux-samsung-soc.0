From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 0/6] Add generic set_rate clk_ops for PLL35xx and
 PLL36xx for samsung SoCs
Date: Mon, 3 Jun 2013 14:06:27 -0700
Message-ID: <CAD=FV=X_ZnqFiduxYYkXT9Qyu_ton962S5uDQFQUP_Q5VQULYA@mail.gmail.com>
References: <1370003496-19288-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:44370 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757067Ab3FCVG3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Jun 2013 17:06:29 -0400
Received: by mail-la0-f43.google.com with SMTP id gw10so1488191lab.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Jun 2013 14:06:27 -0700 (PDT)
In-Reply-To: <1370003496-19288-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Vikas,

On Fri, May 31, 2013 at 5:31 AM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> This patch series does the following:
>
>  1) Factors out possible common code, unifies the clk strutures used
>     for PLL35xx & PLL36xx and usues clk->base instead of clk->con0
>
>  2) Defines a common rate_table which will contain recommended p, m, s and k
>     values for supported rates that needs to be changed for changing
>     corresponding PLL's rate
>
>  3) Adds set_rate() and round_rate() clk_ops for PLL35xx and PLL36xx
>
> changes since v2:
>         - Added new patch to reorder the MUX registration for mout_vpllsrc MUX
>         before the PLL registrations. And to add the alias for the mout_vpllsrc MUX.
>         - Added a check to confirm parent rate while registrating the PLL
>         rate tables.
>
> changes since v1:
>         - removed sorting and bsearch
>         - modified the definition of struct "samsung_pll_rate_table"
>         - added generic round_rate()
>         - rectified the ops assignment for "rate table passed as NULL"
>           during PLL registration
>
> Is rebased on branch kgene's "for-next"
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
>
> And tested these patch on chromebook for EPLL settings for Audio on our chrome tree.
>
>
> Vikas Sajjan (3):
>   clk: samsung: Add set_rate() clk_ops for PLL36xx
>   clk: samsung: Add alias for mout_vpllsrc and reorder MUX registration
>     for it
>   clk: samsung: Add EPLL and VPLL freq table for exynos5250 SoC
>
> Yadwinder Singh Brar (3):
>   clk: samsung: Use clk->base instead of directly using clk->con0 for
>     PLL3xxx
>   clk: samsung: Add support to register rate_table for PLL3xxx
>   clk: samsung: Add set_rate() clk_ops for PLL35xx
>
>  drivers/clk/samsung/clk-exynos4.c    |   10 +-
>  drivers/clk/samsung/clk-exynos5250.c |   69 +++++++++--
>  drivers/clk/samsung/clk-pll.c        |  226 ++++++++++++++++++++++++++++++----
>  drivers/clk/samsung/clk-pll.h        |   35 +++++-
>  drivers/clk/samsung/clk.h            |    2 +
>  5 files changed, 300 insertions(+), 42 deletions(-)

I'm hoping that we'll see a v4 of this series after you and Tomasz
figure out what to do about the fin_pll issue.  Ideally you can pick
up the little tweaks I added before landing this series in kernel-next
for ChromeOS (if you are OK with them, that is).

Thanks!

-Doug
