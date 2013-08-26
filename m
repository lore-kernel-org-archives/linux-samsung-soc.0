From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v5 1/6] ARM: dts: add mixer clocks to mixer node for Exynos5250
Date: Mon, 26 Aug 2013 15:08:16 +0530
Message-ID: <1377509901-9467-2-git-send-email-rahul.sharma@samsung.com>
References: <1377509901-9467-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64286 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751391Ab3HZJQf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 05:16:35 -0400
In-reply-to: <1377509901-9467-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Sean Paul <seanpaul@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

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
