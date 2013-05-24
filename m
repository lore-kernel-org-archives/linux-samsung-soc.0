From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 0/5] Add generic set_rate clk_ops for PLL35XX and PLL36XX for samsung SoCs
Date: Fri, 24 May 2013 10:22:52 +0530
Message-ID: <1369371177-5413-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:62470 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750947Ab3EXExH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 00:53:07 -0400
Received: by mail-pd0-f181.google.com with SMTP id bv13so1849623pdb.40
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 May 2013 21:53:06 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: yadi.brar01@gmail.com, linux-samsung-soc@vger.kernel.org
Cc: dianders@chromium.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, patches@linaro.org, linaro-kernel@lists.linaro.org

This patch series does the following: 

 1) Factors out possible common code, unifies the clk strutures used
    for PLL35XX & PLL36XX and usues clk->base instead of clk->con0

 2) Defines a common rate_table which will contain recommended p, m, s and k
    values for supported rates that needs to be changed for changing
    corresponding PLL's rate

 3) Adds set_rate() and round_rate() clk_ops for PLL35XX and PLL36XXX

Is rebased on branch kgene's "for-next"
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next

And tested these patch on chromebook for EPLL settings for Audio on our chrome tree.

Vikas Sajjan (2):
  clk: samsung: Add set_rate() clk_ops for PLL36XX
  clk: samsung: Add EPLL and VPLL freq table for exynos5250 SoC

Yadwinder Singh Brar (3):
  clk: samsung: Use clk->base instead of directly using clk->con0 for
    PLL3XXX
  clk: samsung: Add support to register rate_table for PLL3XXX
  clk: samsung: Add set_rate() clk_ops for PLL35XX

 drivers/clk/samsung/clk-exynos4.c    |   10 +-
 drivers/clk/samsung/clk-exynos5250.c |   29 +++-
 drivers/clk/samsung/clk-pll.c        |  243 ++++++++++++++++++++++++++++++----
 drivers/clk/samsung/clk-pll.h        |   27 +++-
 4 files changed, 272 insertions(+), 37 deletions(-)

-- 
1.7.9.5
