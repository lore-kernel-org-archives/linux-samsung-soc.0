From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/2] Clock update for EXYNOS4210-CPUFREQ driver
Date: Thu,  6 Jun 2013 16:52:26 +0530
Message-ID: <1370517749-29892-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

cpufreq driver for EXYNOS4 based SoCs are not platform drivers, hence
we cannot currently pass the clock names through a device tree node.
Instead, we need to make them available through global alias.

The patches are based on next-20130606.

Tushar Behera (2):
  clk: samsung: Add MUX_FA macro to pass flag and alias
  clk: exynos4210: Add alias for cpufreq related clocks

 drivers/clk/samsung/clk-exynos4.c |   10 +++++-----
 drivers/clk/samsung/clk.h         |    3 +++
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
1.7.9.5
