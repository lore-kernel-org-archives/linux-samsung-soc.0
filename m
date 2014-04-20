From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/7] ARM: dtsi: add access to simple hdmiphy to exynos5420 hdmi
 node
Date: Sun, 20 Apr 2014 16:54:01 +0530
Message-ID: <1397993044-14564-5-git-send-email-rahul.sharma@samsung.com>
References: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:21860 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755235AbaDTLY6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 07:24:58 -0400
In-reply-to: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

add reference for hdmiphy phy to the client node, which is
hdmi for exynos5420.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    2 ++
 1 file changed, 2 insertions(+)
 mode change 100755 => 100644 arch/arm/boot/dts/exynos5420.dtsi

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
old mode 100755
new mode 100644
index 07a6cdc..398cb20
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -642,6 +642,8 @@
 		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
 			"sclk_hdmiphy", "mout_hdmi";
 		status = "disabled";
+		phys = <&simple_phys 0>;
+		phy-names = "hdmiphy";
 	};
 
 	mixer@14450000 {
-- 
1.7.9.5
