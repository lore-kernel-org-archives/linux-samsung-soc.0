From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/6] clk: exynos: Some fixes and cleanup
Date: Thu, 11 Jul 2013 14:32:08 +0530
Message-ID: <1373533334-5169-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:62900 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932140Ab3GKJSH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 05:18:07 -0400
Received: by mail-pd0-f180.google.com with SMTP id 10so7219408pdi.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2013 02:18:07 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Resending some of patches (1, 3 and 5) as per discussion in thread [1].
Other patches in the series are new.

[1] http://comments.gmane.org/gmane.linux.kernel.samsung-soc/19933

Sachin Kamat (6):
  clk: exynos4: Staticize local symbols
  clk: exynos4: Remove unused function
  clk: exynos5250: Staticize local symbols
  clk: exynos5420: Staticize local symbols
  clk: exynos5440: Staticize local symbols
  clk: exynos-audss: Staticize exynos_audss_clk_init

 drivers/clk/samsung/clk-exynos-audss.c |    2 +-
 drivers/clk/samsung/clk-exynos4.c      |   42 ++++++++++++--------------------
 drivers/clk/samsung/clk-exynos5250.c   |   14 +++++------
 drivers/clk/samsung/clk-exynos5420.c   |   14 +++++------
 drivers/clk/samsung/clk-exynos5440.c   |   14 +++++------
 5 files changed, 37 insertions(+), 49 deletions(-)

-- 
1.7.9.5
