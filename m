From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [RESEND PATCH 0/5] Add generic set_rate clk_ops for PLL35XX and PLL36XX for samsung SoCs
Date: Fri, 24 May 2013 11:25:14 +0530
Message-ID: <1369374919-6214-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:40306 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752581Ab3EXFz2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 01:55:28 -0400
Received: by mail-pa0-f45.google.com with SMTP id lj1so3897507pab.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 May 2013 22:55:28 -0700 (PDT)
Received: from localhost.localdomain ([115.113.119.130])
        by mx.google.com with ESMTPSA id kr16sm15955475pab.23.2013.05.23.22.55.25
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Thu, 23 May 2013 22:55:27 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

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
