From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drivers: mmc: sdhci-s3c: fix broken compilation for non-Exynos
 SoCs
Date: Fri, 09 Mar 2012 14:44:27 +0100
Message-ID: <1331300667-22566-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

exynos4_sdhci_drv_data structure is not available on non-Exynos builds,
that's why EXYNOS4_SDHCI_DRV_DATA macro has been introduced. This patch
fixes commit 67819656 'mmc: sdhci-s3c: Add device tree support' to use
that macro. This fixes broken build for pre-Exynos SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/mmc/host/sdhci-s3c.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index ea0767e..984601e 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -859,7 +859,7 @@ MODULE_DEVICE_TABLE(platform, sdhci_s3c_driver_ids);
 static const struct of_device_id sdhci_s3c_dt_match[] = {
 	{ .compatible = "samsung,s3c6410-sdhci", },
 	{ .compatible = "samsung,exynos4210-sdhci",
-		.data = &exynos4_sdhci_drv_data },
+		.data = EXYNOS4_SDHCI_DRV_DATA },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sdhci_s3c_dt_match);
-- 
1.7.1.569.g6f426

