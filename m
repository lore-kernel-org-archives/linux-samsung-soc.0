From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 7/9] ARM: dts: exynos5420: add clocks for hdmi subsystem
Date: Thu, 25 Jul 2013 13:04:35 +0530
Message-ID: <1374737677-3215-8-git-send-email-rahul.sharma@samsung.com>
References: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27330 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753096Ab3GYHMJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 03:12:09 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQH00EYWDC8SKS0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Jul 2013 16:12:08 +0900 (KST)
In-reply-to: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add clocks for hdmi and mixer for exynos5420 SoC.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 93caef7..5fa4093 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -180,9 +180,15 @@
 
 	hdmi@14530000 {
 		compatible = "samsung,exynos4212-hdmi";
+		clocks = <&clock 413>, <&clock 143>, <&clock 144>,
+			<&clock 158>, <&clock 1024>;
+		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
+			"sclk_hdmiphy", "mout_hdmi";
 	};
 
 	mixer@14450000 {
 		compatible = "samsung,exynos5420-mixer";
+		clocks = <&clock 431>, <&clock 143>;
+		clock-names = "mixer", "sclk_hdmi";
 	};
 };
-- 
1.7.10.4
