From: Hyungwon Hwang <hyungwon.hwang7@gmail.com>
Subject: [PATCH v3] ARM: dts: fix the clock-frequency of rinato board's panel
Date: Mon, 15 Jun 2015 13:03:17 +0900
Message-ID: <1434340997-25146-1-git-send-email-hyungwon.hwang7@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:35572 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751AbbFOEDd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 00:03:33 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.kozlowski@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, human.hwang@samsung.com
Cc: stable@vger.kernel.org

From: Hyungwon Hwang <human.hwang@samsung.com>

After the commit abc0b1447d4974963548777a5ba4a4457c82c426
("drm: Perform basic sanity checks on probed modes"), proper
clock-frequency becomes mandatory for validating the mode of panel.
The display does not work if there is no mode validated. Also, this
clock-frequency must be set appropriately for getting required frame
rate.

Fixes: abc0b1447d49 ("drm: Perform basic sanity checks on probed modes")
Cc: <stable@vger.kernel.org>
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
1.8.1.2
