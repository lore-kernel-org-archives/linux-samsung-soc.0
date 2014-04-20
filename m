From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/7] ARM: dtsi: add access to simple hdmiphy to exynos5250 hdmi
 node
Date: Sun, 20 Apr 2014 16:54:00 +0530
Message-ID: <1397993044-14564-4-git-send-email-rahul.sharma@samsung.com>
References: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38228 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755215AbaDTLY4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 07:24:56 -0400
In-reply-to: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Add reference to simple phy to hdmi node for exynos5420

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 file changed, 2 insertions(+)
 mode change 100755 => 100644 arch/arm/boot/dts/exynos5250.dtsi

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
old mode 100755
new mode 100644
index bbf2d64..ddd687e
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -690,6 +690,8 @@
 			 <&clock CLK_MOUT_HDMI>;
 		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
 				"sclk_hdmiphy", "mout_hdmi";
+		phys = <&simple_phys 0>;
+		phy-names = "hdmiphy";
 	};
 
 	mixer {
-- 
1.7.9.5
