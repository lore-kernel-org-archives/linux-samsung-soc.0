From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 11/27] ARM: dts: exynos3250: Add GIC dt node for Exynos3250
Date: Thu, 10 Apr 2014 19:06:01 +0900
Message-ID: <1397124377-16969-3-git-send-email-cw00.choi@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53304 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965676AbaDJKGv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 06:06:51 -0400
In-reply-to: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

From: Tomasz Figa <t.figa@samsung.com>

This patch adds device tree node for GIC interrupt controller
on Exynos3250.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 3c8cee6..fe8960e 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -31,4 +31,15 @@
 		compatible = "samsung,exynos3-sysreg", "syscon";
 		reg = <0x10010000 0x400>;
 	};
+
+	gic: interrupt-controller@10481000 {
+		compatible = "arm,cortex-a7-gic";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x10481000 0x1000>,
+		      <0x10482000 0x1000>,
+		      <0x10484000 0x2000>,
+		      <0x10486000 0x2000>;
+		      interrupts = <1 9 0xf04>;
+	};
 };
-- 
1.8.0
