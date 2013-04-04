From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/4] ARM: dts: add PMU support in exynos5440
Date: Thu,  4 Apr 2013 19:46:46 +0900
Message-ID: <1365072407-4320-4-git-send-email-kgene.kim@samsung.com>
References: <1365072407-4320-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:37372 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757256Ab3DDKrM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 06:47:12 -0400
Received: by mail-pb0-f44.google.com with SMTP id wz12so1374069pbc.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2013 03:47:12 -0700 (PDT)
In-Reply-To: <1365072407-4320-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Subash Patel <subash.rp@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Subash Patel <subash.rp@samsung.com>

PMU in exynos5440 generates one interrupt per core and needs to
be passed from DT to GIC to register it.

Signed-off-by: Subash Patel <subash.rp@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 715ea15..5a339f0 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -55,6 +55,14 @@
 		};
 	};
 
+	arm-pmu {
+		compatible = "arm,cortex-a15-pmu", "arm,cortex-a9-pmu";
+		interrupts = <0 52 4>,
+			     <0 53 4>,
+			     <0 54 4>,
+			     <0 55 4>;
+	};
+
 	timer {
 		compatible = "arm,cortex-a15-timer",
 			     "arm,armv7-timer";
-- 
1.7.4.4
