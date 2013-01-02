From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/4] ARM: EXYNOS: Add MFC codec support to Origen DT
Date: Wed,  2 Jan 2013 14:16:09 +0530
Message-ID: <1357116369-20784-4-git-send-email-sachin.kamat@linaro.org>
References: <1357116369-20784-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:34884 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061Ab3ABIyQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 03:54:16 -0500
Received: by mail-pa0-f44.google.com with SMTP id hz11so7854066pad.31
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jan 2013 00:54:16 -0800 (PST)
In-Reply-To: <1357116369-20784-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

This patch adds MFC codec support to Origen DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index f271001..cd0d1e2 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -121,4 +121,9 @@
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	codec@13400000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+	};
 };
-- 
1.7.4.1
