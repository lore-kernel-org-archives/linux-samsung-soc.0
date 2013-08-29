From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 1/6] ARM: dts: add mixer clocks to mixer node for Exynos5250
Date: Thu, 29 Aug 2013 10:58:25 +0530
Message-ID: <1377754110-31084-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45087 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752230Ab3H2FGl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 01:06:41 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSA00DXQ0V2M230@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Aug 2013 14:06:38 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Sean Paul <seanpaul@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

From: Sean Paul <seanpaul@chromium.org>

This patch adds the mixer clocks to the mixer node in the
exynos 5250 dts file.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 1eec646..dcb6c03 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -622,6 +622,8 @@
 		compatible = "samsung,exynos5250-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
+		clocks = <&clock 343>, <&clock 136>;
+		clock-names = "mixer", "sclk_hdmi";
 	};
 
 	dp_phy: video-phy@10040720 {
-- 
1.7.10.4
