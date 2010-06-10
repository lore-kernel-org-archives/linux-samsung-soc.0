From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Fix on wrong function name for S5PV210 sdhci0
Date: Thu, 10 Jun 2010 18:18:36 +0900
Message-ID: <1276161516-17480-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:55045 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753139Ab0FJJXU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jun 2010 05:23:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Lee Hyuk <hyuk1.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Lee Hyuk <hyuk1.lee@samsung.com>

This patch fixes on wrong function name in include/plat/sdhci.h for Samsung.
The 's5pc100_default_sdhci0()' function should be chnaged to
's5pv210_default_sdhci0()'. Because 's5pv210_default_sdhci0()' must be pair.

Signed-off-by: Hyuk Lee <hyuk1.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/include/plat/sdhci.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
index 13f9fb2..98ebd50 100644
--- a/arch/arm/plat-samsung/include/plat/sdhci.h
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h
@@ -239,7 +239,7 @@ static inline void s5pv210_default_sdhci0(void)
 	s3c_hsmmc0_def_platdata.cfg_card = s5pv210_setup_sdhci_cfg_card;
 }
 #else
-static inline void s5pc100_default_sdhci0(void) { }
+static inline void s5pv210_default_sdhci0(void) { }
 #endif /* CONFIG_S3C_DEV_HSMMC */
 
 #ifdef CONFIG_S3C_DEV_HSMMC1
-- 
1.6.2.5
