From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/2] ARM: dts: add pmu syscon handle to exynos5420 hdmi
Date: Tue, 20 May 2014 19:08:49 +0530
Message-ID: <1400593129-21170-3-git-send-email-rahul.sharma@samsung.com>
References: <1400593129-21170-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46335 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448AbaETNk7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 09:40:59 -0400
In-reply-to: <1400593129-21170-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add PMU syscon handle to HDMI dt node for controlling
PHY Enable/Disable bit.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8e7e35c..20dc308 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -687,6 +687,7 @@
 		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
 			"sclk_hdmiphy", "mout_hdmi";
 		phy = <&hdmiphy>;
+		samsung,syscon-phandle = <&pmu_system_controller>;
 		status = "disabled";
 	};
 
-- 
1.7.9.5
