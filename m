From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 2/3] s3c6410: Enable ADMA feature in 6410 sdhci controller.
Date: Tue, 04 May 2010 11:43:26 +0200
Message-ID: <4BDFEC3E.4070906@gmail.com>
References: <cover.1272966142.git.mcuelenaere@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <cover.1272966142.git.mcuelenaere@gmail.com>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, pierre@ossman.eu, linux-mmc@vger.kernel.org, akpm@linux-foundation.org, sdhci-devel@lists.ossman.eu
Cc: ben-linux@fluff.org, thomas.ab@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch enables ADMA feature in 6410 SDHCI controller
driver.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Acked-by: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 drivers/mmc/host/sdhci-s3c.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 2136794..ad3a78e 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -317,12 +317,7 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 	host->irq = irq;
 
 	/* Setup quirks for the controller */
-
-	/* Currently with ADMA enabled we are getting some length
-	 * interrupts that are not being dealt with, do disable
-	 * ADMA until this is sorted out. */
-	host->quirks |= SDHCI_QUIRK_BROKEN_ADMA;
-	host->quirks |= SDHCI_QUIRK_32BIT_ADMA_SIZE;
+	host->quirks |= SDHCI_QUIRK_NO_ENDATTR_IN_NOPDESC;
 
 #ifndef CONFIG_MMC_SDHCI_S3C_DMA
 
-- 
1.7.1


