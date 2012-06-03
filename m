From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] gpio: samsung: fix typo in name of exynos5 gpio chip list
Date: Sun, 03 Jun 2012 14:47:40 +0530
Message-ID: <1338715060-20420-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10161 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752406Ab2FCJCf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jun 2012 05:02:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, grant.likely@secretlab.ca

Commit 30b842889eea ("Merge tag 'soc2' of git://git.kernel.org/pub/scm/
linux/kernel/git/arm/arm-soc) introduced a typo in the name of the list
of gpio chips for Exynos5 gpio controller. Fix this typo.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/gpio/gpio-samsung.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 7bb0044..b6453d0 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -2833,7 +2833,7 @@ static __init void exynos5_gpiolib_init(void)
 	}
 
 	/* need to set base address for gpc4 */
-	exonys5_gpios_1[11].base = gpio_base1 + 0x2E0;
+	exynos5_gpios_1[11].base = gpio_base1 + 0x2E0;
 
 	/* need to set base address for gpx */
 	chip = &exynos5_gpios_1[21];
-- 
1.6.6.rc2
