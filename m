From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 0/5] Add generic set_rate clk_ops for PLL35xx and PLL36xx for samsung SoCs
Date: Wed, 29 May 2013 19:07:52 +0530
Message-ID: <1369834677-20312-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:64246 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966078Ab3E2NiS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 May 2013 09:38:18 -0400
Received: by mail-pb0-f43.google.com with SMTP id ma3so9208230pbc.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 May 2013 06:38:17 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, yadi.brar01@gmail.com, dianders@chromium.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, thomas.abraham@linaro.org, patches@linaro.org, linaro-kernel@lists.linaro.org

This patch series does the following: 

 1) Factors out possible common code, unifies the clk strutures used
    for PLL35xx & PLL36xx and usues clk->base instead of clk->con0

 2) Defines a common rate_table which will contain recommended p, m, s and k
    values for supported rates that needs to be changed for changing
    corresponding PLL's rate

 3) Adds set_rate() and round_rate() clk_ops for PLL35xx and PLL36xx

changes since v1:
	- removed sorting and bsearch
	- modified the definition of struct "samsung_pll_rate_table"
	- added generic round_rate()
	- rectified the ops assignment for "rate table passed as NULL"
	  during PLL registration

Is rebased on branch kgene's "for-next"
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next

And tested these patch on chromebook for EPLL settings for Audio on our chrome tree.

Vikas Sajjan (2):
  clk: samsung: Add set_rate() clk_ops for PLL36xx
  clk: samsung: Add EPLL and VPLL freq table for exynos5250 SoC

Yadwinder Singh Brar (3):
  clk: samsung: Use clk->base instead of directly using clk->con0 for
    PLL3xxx
  clk: samsung: Add support to register rate_table for PLL3xxx
  clk: samsung: Add set_rate() clk_ops for PLL35xx

 drivers/clk/samsung/clk-exynos4.c    |   10 +-
 drivers/clk/samsung/clk-exynos5250.c |   30 +++--
 drivers/clk/samsung/clk-pll.c        |  226 ++++++++++++++++++++++++++++++----
 drivers/clk/samsung/clk-pll.h        |   33 ++++-
 4 files changed, 260 insertions(+), 39 deletions(-)

-- 
1.7.9.5
