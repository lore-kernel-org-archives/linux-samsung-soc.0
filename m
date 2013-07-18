From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 0/6] clk: exynos: Some fixes and cleanup
Date: Thu, 18 Jul 2013 15:31:16 +0530
Message-ID: <1374141682-29432-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:40901 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754291Ab3GRKRY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Jul 2013 06:17:24 -0400
Received: by mail-pb0-f43.google.com with SMTP id md12so2981176pbc.30
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Jul 2013 03:17:24 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Resending some of patches (1, 3 and 5) as per discussion in thread [1].
Other patches in the series are new.

[1] http://comments.gmane.org/gmane.linux.kernel.samsung-soc/19933

Changes since v1:
* Removed an unnecessary change in Patch 1 as pointed out by Kukjin Kim.
* Added Kukjin's ack to patches 3~6.

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
