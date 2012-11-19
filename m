From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/5] ARM: dts: exynos4210-trats: Add node for touchscreen
 voltage regulator
Date: Mon, 19 Nov 2012 15:45:28 +0100
Message-ID: <1353336329-20818-5-git-send-email-t.figa@samsung.com>
References: <1353336329-20818-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20693 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994Ab2KSOpz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 09:45:55 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDQ005UNOZT0PG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:45:54 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDQ009O9OZWSZ80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:45:54 +0900 (KST)
In-reply-to: <1353336329-20818-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch adds device tree node for a fixed voltage regulator used for
touchscreen on Samsung Trats board.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 1d502bd..86ff800 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -98,6 +98,15 @@
 		};
 	};
 
+	tsp_reg: voltage-regulator {
+	        compatible = "regulator-fixed";
+		regulator-name = "TSP_FIXED_VOLTAGES";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpl0 3 0>;
+		enable-active-high;
+	};
+
 	i2c@13890000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-slave-addr = <0x10>;
-- 
1.8.0
