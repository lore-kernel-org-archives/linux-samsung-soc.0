From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH v2 1/2] ARM: SAMSUNG: Add pm_caps into platform data
Date: Wed, 16 Nov 2011 10:20:48 +0000
Message-ID: <1321438848-3607-1-git-send-email-sangwook.lee@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:49210 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755394Ab1KPKWz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Nov 2011 05:22:55 -0500
Received: by bke11 with SMTP id 11so349393bke.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2011 02:22:54 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org, Sangwook Lee <sangwook.lee@linaro.org>, Sangwook Lee <sangwook.lee@samsung.com>

Add pm_caps into platform_data. This is power management, usually
for SDIO device such as SDIO WLAN.

Signed-off-by: Sangwook Lee <sangwook.lee@samsung.com>
---
 arch/arm/plat-samsung/include/plat/sdhci.h |    2 ++
 arch/arm/plat-samsung/platformdata.c       |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
index dcff7dd..fcd02d4 100644
--- a/arch/arm/plat-samsung/include/plat/sdhci.h
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h
@@ -40,6 +40,7 @@ enum clk_types {
  * struct s3c_sdhci_platdata() - Platform device data for Samsung SDHCI
  * @max_width: The maximum number of data bits supported.
  * @host_caps: Standard MMC host capabilities bit field.
+ * @pm_caps: SDIO host PM capabilities bit field.
  * @cd_type: Type of Card Detection method (see cd_types enum above)
  * @clk_type: Type of clock divider method (see clk_types enum above)
  * @ext_cd_init: Initialize external card detect subsystem. Called on
@@ -63,6 +64,7 @@ enum clk_types {
 struct s3c_sdhci_platdata {
 	unsigned int	max_width;
 	unsigned int	host_caps;
+	unsigned int    pm_caps;
 	enum cd_types	cd_type;
 	enum clk_types	clk_type;
 
diff --git a/arch/arm/plat-samsung/platformdata.c b/arch/arm/plat-samsung/platformdata.c
index ceb9fa3..0f70718 100644
--- a/arch/arm/plat-samsung/platformdata.c
+++ b/arch/arm/plat-samsung/platformdata.c
@@ -53,6 +53,8 @@ void s3c_sdhci_set_platdata(struct s3c_sdhci_platdata *pd,
 		set->cfg_gpio = pd->cfg_gpio;
 	if (pd->host_caps)
 		set->host_caps |= pd->host_caps;
+	if (pd->pm_caps)
+		set->pm_caps |= pd->pm_caps;
 	if (pd->clk_type)
 		set->clk_type = pd->clk_type;
 }
-- 
1.7.4.1
