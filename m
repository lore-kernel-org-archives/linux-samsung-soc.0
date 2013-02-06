From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: SAMSUNG: Silence empty switch warning in sdhci.h
Date: Wed,  6 Feb 2013 11:49:26 +0530
Message-ID: <1360131567-583-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:61520 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab3BFG2x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 01:28:53 -0500
Received: by mail-pa0-f41.google.com with SMTP id fb11so621539pad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Feb 2013 22:28:53 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Add 'default' case to silence the following warning:
arch/arm/plat-samsung/include/plat/sdhci.h:356:9: warning: switch with no cases

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/include/plat/sdhci.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
index 151cc91..9b87f38 100644
--- a/arch/arm/plat-samsung/include/plat/sdhci.h
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h
@@ -374,6 +374,8 @@ static inline void s3c_sdhci_setname(int id, char *name)
 		s3c_device_hsmmc3.name = name;
 		break;
 #endif
+	default:
+		break;
 	}
 }
 
-- 
1.7.4.1
