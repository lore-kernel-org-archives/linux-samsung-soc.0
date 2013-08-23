From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 5/7] ARM: dts: add clocks for exynos5420 hdmi subsystem
Date: Fri, 23 Aug 2013 15:54:19 +0530
Message-ID: <1377253461-20851-6-git-send-email-rahul.sharma@samsung.com>
References: <1377253461-20851-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30538 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754903Ab3HWKCb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Aug 2013 06:02:31 -0400
In-reply-to: <1377253461-20851-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add clocks for hdmi and mixer for exynos5420 SoC.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 7c6214d..1405074 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -279,6 +279,10 @@
 		compatible = "samsung,exynos4212-hdmi";
 		reg = <0x14530000 0x70000>;
 		interrupts = <0 95 0>;
+		clocks = <&clock 413>, <&clock 143>, <&clock 144>,
+			<&clock 158>, <&clock 1024>;
+		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
+			"sclk_hdmiphy", "mout_hdmi";
 		status = "disabled";
 	};
 
@@ -286,6 +290,8 @@
 		compatible = "samsung,exynos5420-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
+		clocks = <&clock 431>, <&clock 143>;
+		clock-names = "mixer", "sclk_hdmi";
 		status = "disabled";
 	};
 };
-- 
1.7.10.4
