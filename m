From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/5] ARM: dts: Enable watchdog node on Origen boards
Date: Fri, 23 May 2014 11:38:55 +0530
Message-ID: <1400825338-1272-2-git-send-email-sachin.kamat@linaro.org>
References: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:44225 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752164AbaEWGLL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 02:11:11 -0400
Received: by mail-pb0-f48.google.com with SMTP id rr13so3642357pbb.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 23:11:11 -0700 (PDT)
In-Reply-To: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Enabled watchdog nodes on Origen 4210 and 4412 boards.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    4 ++++
 arch/arm/boot/dts/exynos4412-origen.dts |    4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 95efb1189cf0..f018e2149168 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -48,6 +48,10 @@
 		};
 	};
 
+	watchdog@10060000 {
+		status = "okay";
+	};
+
 	rtc@10070000 {
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 934fe7ecca7e..bd3985b767c4 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -48,6 +48,10 @@
 		};
 	};
 
+	watchdog@10060000 {
+		status = "okay";
+	};
+
 	rtc@10070000 {
 		status = "okay";
 	};
-- 
1.7.9.5
