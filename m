From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH v2] ARM: dts: fix the clock-frequency of rinato board's panel
Date: Fri, 12 Jun 2015 19:06:50 +0900
Message-ID: <1434103610-24182-1-git-send-email-human.hwang@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, inki.dae@samsung.com
Cc: stable@vger.kernel.org, sw0312.kim@samsung.com, jy0922.shim@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

After the commit abc0b1447d4974963548777a5ba4a4457c82c426
("drm: Perform basic sanity checks on probed modes"), proper
clock-frequency becomes mandatory for validating the mode of panel.
The display does not work if there is no mode validated. Also, this
clock-frequency must be set appropriately for getting required frame
rate.

Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 0b99068..75aba40 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -181,7 +181,7 @@

 		display-timings {
 			timing-0 {
-				clock-frequency = <0>;
+				clock-frequency = <4600000>;
 				hactive = <320>;
 				vactive = <320>;
 				hfront-porch = <1>;
--
1.9.1
