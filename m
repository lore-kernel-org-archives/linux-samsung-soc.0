From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] arm64: dts: exynos: set LDO7 regulator as always on
Date: Tue, 24 Jan 2017 13:45:28 +0100
Message-ID: <1485261928-10769-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170124124537eucas1p23ef10c2cf3b15ce70682b0cf71ae14a3@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:64622 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750766AbdAXMqC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 07:46:02 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKA009POBG2QQ30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Jan 2017 12:45:38 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, sw0312.kim@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>

LDO7 regulator beside DSI and HDMI provides power for core blocks in Exynos
5433 SoC. Disabling it causes serious current leak - about 200mA.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 5f1e172..b22bec8 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -432,6 +432,10 @@
 				regulator-name = "VDD18_MIPI2L_1.8V_AP";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo8_reg: LDO8 {
-- 
2.7.4
