From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 3/3] SDHCI: Enable multiblock transfers in sdhci-s3c
Date: Tue, 04 May 2010 11:43:30 +0200
Message-ID: <4BDFEC42.5020900@gmail.com>
References: <cover.1272966142.git.mcuelenaere@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f222.google.com ([209.85.219.222]:38373 "EHLO
	mail-ew0-f222.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755156Ab0EDJnd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 May 2010 05:43:33 -0400
In-Reply-To: <cover.1272966142.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, pierre@ossman.eu, linux-mmc@vger.kernel.org, akpm@linux-foundation.org, sdhci-devel@lists.ossman.eu
Cc: ben-linux@fluff.org, thomas.ab@samsung.com

Wifi over SDIO doesn't work correctly without multiblock, so enable
this. This patch depends on the following patches:

[PATCH] s3c6410: Enable ADMA feature in 6410 sdhci controller.
[PATCH] s3c6410: Add new quirk in sdhci driver and update ADMA descriptor build.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 drivers/mmc/host/sdhci-s3c.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 2136794..2c1a618 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -330,9 +330,6 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 	 * support as well. */
 	host->quirks |= SDHCI_QUIRK_BROKEN_DMA;
 
-	/* PIO currently has problems with multi-block IO */
-	host->quirks |= SDHCI_QUIRK_NO_MULTIBLOCK;
-
 #endif /* CONFIG_MMC_SDHCI_S3C_DMA */
 
 	/* It seems we do not get an DATA transfer complete on non-busy
-- 
1.7.1
