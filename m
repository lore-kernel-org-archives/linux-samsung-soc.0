From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: SAMSUNG: Silence empty switch warning in fimc-core.h
Date: Wed,  6 Feb 2013 11:49:27 +0530
Message-ID: <1360131567-583-2-git-send-email-sachin.kamat@linaro.org>
References: <1360131567-583-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f42.google.com ([209.85.210.42]:55805 "EHLO
	mail-da0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab3BFG25 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 01:28:57 -0500
Received: by mail-da0-f42.google.com with SMTP id z17so472145dal.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Feb 2013 22:28:56 -0800 (PST)
In-Reply-To: <1360131567-583-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Add 'default' case to silence the below warning:
arch/arm/plat-samsung/include/plat/fimc-core.h:25:9:
warning: switch with no cases

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/include/plat/fimc-core.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/fimc-core.h b/arch/arm/plat-samsung/include/plat/fimc-core.h
index 945a99d..1d6cb2b 100644
--- a/arch/arm/plat-samsung/include/plat/fimc-core.h
+++ b/arch/arm/plat-samsung/include/plat/fimc-core.h
@@ -43,6 +43,8 @@ static inline void s3c_fimc_setname(int id, char *name)
 		s5p_device_fimc3.name = name;
 		break;
 #endif
+	default:
+		break;
 	}
 }
 
-- 
1.7.4.1
