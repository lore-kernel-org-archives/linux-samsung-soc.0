From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 2/5] ARM: dts: exynos4x12: Add PMU dt data to support
 PMU(Perforamnce Monitoring Unit)
Date: Tue, 11 Mar 2014 16:54:51 +0900
Message-ID: <1394524494-30641-3-git-send-email-cw00.choi@samsung.com>
References: <1394524494-30641-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45819 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752183AbaCKHzF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Mar 2014 03:55:05 -0400
In-reply-to: <1394524494-30641-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, Chanwoo Choi <cw00.choi@samsung.com>

ARM CPU has its own performance profiling unit(PMU, Perforamnce Monitoring Unit).
This patch add PMU dt data to support PMU which count cache hit and miss events.

PMU interrput list of Exynos4212
- <2 2> : INTG2[2] - PMUIRQ[0] for CPU0
- <3 2> : INTG3[2] - PMUIRQ[1] for CPU1

PMU interrput list of Exynos4412
- <2 2> : INTG2[2], PMUIRQ[0] for CPU0
- <3 2> : INTG3[2], PMUIRQ[1] for CPU1
- <18 2> : INTG18[2], PMUIRQ[2] : CPU2
- <19 2> : INTG19[2], PMUIRQ[3] : CPU3

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 5a3e551..1ec77f6 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -31,6 +31,12 @@
 		mshc0 = &mshc_0;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupt-parent = <&combiner>;
+		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
+	};
+
 	pd_isp: isp-power-domain@10023CA0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023CA0 0x20>;
-- 
1.8.0
