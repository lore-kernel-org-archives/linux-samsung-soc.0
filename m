From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v7 00/11] Add generic set_rate clk_ops for PLL35xx and
 PLL36xx for samsung SoCs
Date: Thu, 20 Jun 2013 12:00:07 +0200
Message-ID: <3788098.20c4sNn9AM@amdc1227>
References: <1370943076-13461-1-git-send-email-yadi.brar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:50889 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754182Ab3FTKAS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 06:00:18 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOO006EQRQ6HYA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 11:00:16 +0100 (BST)
In-reply-to: <1370943076-13461-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, dianders@chromium.org, vikas.sajjan@linaro.org, abrestic@chromium.org

Hi Yadwinder, Vikas,

On Tuesday 11 of June 2013 15:01:05 Yadwinder Singh Brar wrote:
> This patch series does the following:
> 
>  1) Unifies the clk strutures  and registration function used for PLL35xx
> & PLL36xx, to factor out possible common code.
> 
>  2) Defines a common rate_table which will contain recommended p, m, s
> and k values for supported rates that needs to be changed for changing
> corresponding PLL's rate
> 
>  3) Adds set_rate() and round_rate() clk_ops for PLL35xx and PLL36xx
> 
> changes since v6:
> 	- Splited the patch adding samsung_clk_register_pll() into definition
> 	addition, SoC specific migration and cleanup patches.
> 	- Addressed some NIT comments.

This version looks good to me. Thanks for your work on improving this 
series again!

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz

> changes since v5:
> 	- Corrected to use rate table as specified in UM for exynos5250 epll.
> 	- Took care of exynos5420 as well, as new exynos5420 clk driver came in
> 	while rebasing on latest Kgene's for-next.
> 
> 	Since we spilted 1st patch into 2 different patches,
> 	can we expect "reviewed-by" again for the same?
> 
> changes since v4:
> 	- Defined common samsung samsung_clk_register_pll() to register a list
> 	of PLL and used a struct samsung_pll_clock for passing intialisation
> 	data instead of passing as arguments. Now passing LOCK as well as CON0
> 	offset as intialisation data.
> 	- Calculated length of rate table while registering PLL instead of
> 	getting it as intialisation data.
> 
> changes since v3:
> 	- Used __clk_lookup() instead of adding alias for mout_vpllsrc
> 	- Added check for changing only M value in samsung_pll36xx_set_rate()
> 	- Modified samsung_pll35xx_mp_change() & samsung_pll35xx_set_rate()
> 	to improve readabilty.
> 	- Made the input rate_table as __init_data which is to be provided 
while
> registering PLL and made a copy of that table while registering, so that
> if multiple tables are their, they can be freed after getting the P, M,
> S, K setting values from required one.
> 
> changes since v2:
> 	- Added new patch to reorder the MUX registration for mout_vpllsrc MUX
> 	before the PLL registrations. And to add the alias for the mout_vpllsrc
> MUX. - Added a check to confirm parent rate while registrating the PLL
> rate tables.
> 
> changes since v1:
> 	- removed sorting and bsearch
> 	- modified the definition of struct "samsung_pll_rate_table"
> 	- added generic round_rate()
> 	- rectified the ops assignment for "rate table passed as NULL
> 
> Is rebased on branch kgene's "for-next"
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/
> ?h=for-next
> 
> Vikas Sajjan (3):
>   clk: samsung: Add set_rate() clk_ops for PLL36xx
>   clk: samsung: Reorder MUX registration for mout_vpllsrc
>   clk: samsung: Add EPLL and VPLL freq table for exynos5250 SoC
> 
> Yadwinder Singh Brar (8):
>   clk: samsung: Introduce a common samsung_clk_pll struct
>   clk: samsung: Define a common samsung_clk_register_pll()
>   clk: samsung: Migrate exynos5250 to use common
>     samsung_clk_register_pll()
>   clk: samsung: Migrate exynos4 to use common
>     samsung_clk_register_pll()
>   clk: samsung: Migrate exynos5420 to use common
>     samsung_clk_register_pll()
>   clk: samsung: Remove unused pll registeration code for pll35xx and
>     pll36xx
>   clk: samsung: Add support to register rate_table for samsung plls
>   clk: samsung: Add set_rate() clk_ops for PLL35xx
> 
>  drivers/clk/samsung/clk-exynos4.c    |   40 +++--
>  drivers/clk/samsung/clk-exynos5250.c |  101 +++++++++--
>  drivers/clk/samsung/clk-exynos5420.c |   86 ++++++---
>  drivers/clk/samsung/clk-pll.c        |  339
> ++++++++++++++++++++++++++-------- drivers/clk/samsung/clk-pll.h       
> |   38 ++++-
>  drivers/clk/samsung/clk.h            |   53 ++++++
>  6 files changed, 519 insertions(+), 138 deletions(-)
