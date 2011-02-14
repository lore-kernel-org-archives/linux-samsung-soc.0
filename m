From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 10/11] ASoC: Change dependency of ARCH_EXYNOS4
Date: Mon, 14 Feb 2011 17:23:06 +0900
Message-ID: <1297671787-10571-11-git-send-email-kgene.kim@samsung.com>
References: <1297671787-10571-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:43120 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752485Ab1BNJtf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Feb 2011 04:49:35 -0500
In-Reply-To: <1297671787-10571-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Jassi Brar <jassi.brar@samsung.com>, Liam Girdwood <lrg@slimlogic.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>

This patch changes dependency of ARCH_EXYNOS4 from ARCH_S5PV310
according to the change of ARCH name, EXYNOS4.

Cc: Jassi Brar <jassi.brar@samsung.com>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 sound/soc/samsung/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index a6a6b5f..d6713d5 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -1,6 +1,6 @@
 config SND_SOC_SAMSUNG
 	tristate "ASoC support for Samsung"
-	depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_S5P64X0 || ARCH_S5P6442 || ARCH_S5PV310
+	depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_S5P64X0 || ARCH_S5P6442 || ARCH_EXYNOS4
 	select S3C64XX_DMA if ARCH_S3C64XX
 	select S3C2410_DMA if ARCH_S3C2410
 	help
-- 
1.7.1
