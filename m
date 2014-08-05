From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 5/5] ARM: dts: Fix wrong compatible string of Exynos3250 RTC dt
 node
Date: Tue, 05 Aug 2014 21:27:46 +0900
Message-ID: <1407241666-17835-6-git-send-email-cw00.choi@samsung.com>
References: <1407241666-17835-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1407241666-17835-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch fix wrong compatible string of Exynos3250 RTC (Real-Time Clock) dt
node. The RTC of Exynos3250 must need additional source clock (XrtcXTI).

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index abd6eb3..a04540e 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -162,7 +162,7 @@
 		};
 
 		rtc: rtc@10070000 {
-			compatible = "samsung,s3c6410-rtc";
+			compatible = "samsung,exynos3250-rtc";
 			reg = <0x10070000 0x100>;
 			interrupts = <0 73 0>, <0 74 0>;
 			status = "disabled";
-- 
1.8.0
