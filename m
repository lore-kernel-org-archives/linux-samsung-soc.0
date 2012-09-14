From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH 0/3] mmc: sdhci-s3c: fixes and enhancements
Date: Fri, 14 Sep 2012 14:38:48 +0530
Message-ID: <1347613731-29428-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: cjb@laptop.org, ben@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, girish.shivananjappa@linaro.org, patches@linaro.org, Chander Kashyap <chander.kashyap@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset does as follows:
Patch 1: Enable only required bus clock in case of multiple clock sources.
Patch 2: Add pm_runtime_dont_use_autosuspend() in sdhci_s3c_remove();
Patch 3: Disable clocks in runtime suspend and enable at runtime resume.

Chander Kashyap (3):
  mmc: sdhci-s3c: Enable only required bus clock
  mmc: sdhci-s3c: Fix crash on module insertion for second time
  mmc: sdhci-s3c: Add clk_(enable/disable) in runtime suspend/resume

 drivers/mmc/host/sdhci-s3c.c |   38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

-- 
1.7.9.5

