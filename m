From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] MAINTAINERS: Add DTS files to patterns for Samsung platform
Date: Thu, 12 Sep 2013 11:57:29 +0100
Message-ID: <1378983449-6205-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:49847 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752965Ab3ILK5k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 06:57:40 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Help ensure that updates to the Samsung device trees get sent to the
Samsung maintainers for review by adding file patterns to MAINTAINERS.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6d0dabe..8a0c044 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1154,6 +1154,8 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 W:	http://www.fluff.org/ben/linux/
 S:	Maintained
+F:	arch/arm/boot/s3c*
+F:	arch/arm/boot/exynos*
 F:	arch/arm/plat-samsung/
 F:	arch/arm/mach-s3c24*/
 F:	arch/arm/mach-s3c64xx/
-- 
1.8.4.rc3
