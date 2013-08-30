From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 7/7] ARM: dts: update hdmiphy dt node for exynos5420
Date: Fri, 30 Aug 2013 12:29:34 +0530
Message-ID: <1377845974-28373-8-git-send-email-rahul.sharma@samsung.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62578 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755151Ab3H3GiA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Aug 2013 02:38:00 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSB00002ZR3W2T0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Aug 2013 15:37:59 +0900 (KST)
In-reply-to: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

hdmiphy dt node needs a child node called 'phy-power-control'
which represents the PMU register for power controlling the
hdmiphy.

hdmi driver dt node provides phy property which points to
the hdmiphy dt node.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index ed687ac..5262781 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -215,6 +215,18 @@
 		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
 			"sclk_hdmiphy", "mout_hdmi";
 		status = "disabled";
+		phy = <&hdmiphy>;
+	};
+
+	hdmiphy: hdmiphy@145D0000 {
+		compatible = "samsung,exynos5420-hdmiphy";
+		reg = <0x145D0000 0x20>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		phy-power-control {
+			reg = <0x10040700 0x04>;
+		};
 	};
 
 	mixer@14450000 {
-- 
1.7.10.4
