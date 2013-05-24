From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RESEND PATCH 0/5] Add generic set_rate clk_ops for PLL35XX and
 PLL36XX for samsung SoCs
Date: Fri, 24 May 2013 11:27:15 +0200
Message-ID: <16501955.nOvJQZzRlQ@amdc1227>
References: <1369374919-6214-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12786 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752842Ab3EXJ1W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 05:27:22 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MNA00BOXQ6RIV40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 24 May 2013 10:27:21 +0100 (BST)
In-reply-to: <1369374919-6214-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org

Hi,

On Friday 24 of May 2013 11:25:14 Vikas Sajjan wrote:
> This patch series does the following:
> 
>  1) Factors out possible common code, unifies the clk strutures used
>     for PLL35XX & PLL36XX and usues clk->base instead of clk->con0
> 
>  2) Defines a common rate_table which will contain recommended p, m, s and k
> values for supported rates that needs to be changed for changing
> corresponding PLL's rate
> 
>  3) Adds set_rate() and round_rate() clk_ops for PLL35XX and PLL36XXX
> 
> Is rebased on branch kgene's "for-next"
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=
> for-next
> 
> And tested these patch on chromebook for EPLL settings for Audio on our
> chrome tree.
> 
> Vikas Sajjan (2):
>   clk: samsung: Add set_rate() clk_ops for PLL36XX
>   clk: samsung: Add EPLL and VPLL freq table for exynos5250 SoC
> 
> Yadwinder Singh Brar (3):
>   clk: samsung: Use clk->base instead of directly using clk->con0 for
>     PLL3XXX
>   clk: samsung: Add support to register rate_table for PLL3XXX
>   clk: samsung: Add set_rate() clk_ops for PLL35XX
> 
>  drivers/clk/samsung/clk-exynos4.c    |   10 +-
>  drivers/clk/samsung/clk-exynos5250.c |   29 +++-
>  drivers/clk/samsung/clk-pll.c        |  243
> ++++++++++++++++++++++++++++++---- drivers/clk/samsung/clk-pll.h        |  
> 27 +++-
>  4 files changed, 272 insertions(+), 37 deletions(-)

Could you please send the series properly, with all patches arriving to all 
necessary mailing lists and with all important people on CC?

This and your previous attempts fail to meet this requirement, making it 
impossible to properly review and comment the patches.

Also please add linux-arm-kernel@lists.infradead.org , as it is the primary 
list for sending clock-related patches (see the MAINTAINERS file).

Best regards,
-- 
Tomasz Figa
Linux Kernel Developer
Samsung R&D Institute Poland
Samsung Electronics
