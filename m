From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/2] Clock changes for supporting CPUFreq on Exynos5250
Date: Fri, 17 May 2013 11:25:51 +0530
Message-ID: <1368770153-29041-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

With the use of common clock framework, CPUFreq driver on EXYNOS5250 now
requires a few changes in clocks.

Tested on Exynos5250 based Arndale board.
The patches are based on v3.10-rc1.

Tushar Behera (2):
  clk: exynos5250: Update cpufreq related clocks for EXYNOS5250
  clk: exynos5250: Add sclk_mpll to the parent list of mout_cpu clock

 drivers/clk/samsung/clk-exynos5250.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.9.5
