From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH v2 0/2] Clock update for EXYNOS4210-CPUFREQ driver
Date: Thu, 20 Jun 2013 16:17:16 +0530
Message-ID: <1371725238-25437-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:62088 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965151Ab3FTLCz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 07:02:55 -0400
Received: by mail-pd0-f179.google.com with SMTP id q10so6064138pdj.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 04:02:55 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, patches@linaro.org

cpufreq driver for EXYNOS4 based SoCs are not platform drivers, hence
we cannot currently pass the clock names through a device tree node.
Instead, we need to make them available through global alias.

The patches are based on next-20130618.

Patch 1 has not been modified.
Patch 2 has been updated to include EXYNOS4X12 releated clocks.

Tushar Behera (2):
  clk: samsung: Add MUX_FA macro to pass flag and alias
  clk: exynos4: Fix clock aliases for cpufreq related clocks

 drivers/clk/samsung/clk-exynos4.c |   21 +++++++++++----------
 drivers/clk/samsung/clk.h         |    3 +++
 2 files changed, 14 insertions(+), 10 deletions(-)

-- 
1.7.9.5
