From: y@samsung.com
Subject: [PATCHv2 5/5] ARM: dts: Fix wrong compatible string of Exynos3250 RTC
 dt node
Date: Tue, 12 Aug 2014 11:01:11 +0900
Message-ID: <1407808871-6046-6-git-send-email-y@samsung.com>
References: <y@samsung.com> <1407808871-6046-1-git-send-email-y@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1407808871-6046-1-git-send-email-y@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Chanwoo Choi <cw00.choi@samsung.com>

This patch fix wrong compatible string of Exynos3250 RTC (Real-Time Clock) dt
node. The RTC of Exynos3250 must need additional source clock (XrtcXTI).

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index cd6a69a..1be5ef8 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -192,7 +192,7 @@
 		};
 
 		rtc: rtc@10070000 {
-			compatible = "samsung,s3c6410-rtc";
+			compatible = "samsung,exynos3250-rtc";
 			reg = <0x10070000 0x100>;
 			interrupts = <0 73 0>, <0 74 0>;
 			status = "disabled";
-- 
1.8.0
