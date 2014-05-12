From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 2/5] ARM: dts: change to correct compatible string for
 exynos5420 hdmi
Date: Mon, 12 May 2014 15:54:05 +0530
Message-ID: <1399890248-27409-3-git-send-email-rahul.sharma@samsung.com>
References: <1399890248-27409-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34507 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755822AbaELKYz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 06:24:55 -0400
In-reply-to: <1399890248-27409-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Replace compatible string for HDMI node in Exynos5420. Since
latest restructring in Drm hdmi driver, it is agreed to use
a seperate compatible string for Exynos5420 HDMI IP siince it
uses APB mapped Phy.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index a802f74..016992c 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -640,7 +640,7 @@
 	};
 
 	hdmi: hdmi@14530000 {
-		compatible = "samsung,exynos4212-hdmi";
+		compatible = "samsung,exynos5420-hdmi";
 		reg = <0x14530000 0x70000>;
 		interrupts = <0 95 0>;
 		clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
-- 
1.7.9.5
