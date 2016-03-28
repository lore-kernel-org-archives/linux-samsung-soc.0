From: Adel Belhouane <bugs.a.b@free.fr>
Subject: [PATCH 1/1] ARM: dts: exynos: Add timer node for exynos5420
Date: Mon, 28 Mar 2016 16:08:09 +0200
Message-ID: <9c3c2a79cbaabd460131270e8a422bfa787b923a.1459167385.git.bugs.a.b@free.fr>
References: <cover.1459167385.git.bugs.a.b@free.fr>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp4-g21.free.fr ([212.27.42.4]:21906 "EHLO smtp4-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752386AbcC1OI0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2016 10:08:26 -0400
In-Reply-To: <cover.1459167385.git.bugs.a.b@free.fr>
In-Reply-To: <cover.1459167385.git.bugs.a.b@free.fr>
References: <cover.1459167385.git.bugs.a.b@free.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Adel Belhouane <bugs.a.b@free.fr>

This patch adds timer node for exynos542x/5800.
Generic Timer Architecture is needed by KVM.

Signed-off-by: Adel Belhouane <bugs.a.b@free.fr>
---
 arch/arm/boot/dts/exynos5420.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 48a0a55314f5..4663006d15ab 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1140,6 +1140,16 @@
 		power-domains = <&disp_pd>;
 		#iommu-cells = <0>;
 	};
+
+	timer {
+		compatible = "arm,cortex-a15-timer",
+			     "arm,armv7-timer";
+		interrupts = <1 13 0xf08>,
+			     <1 14 0xf08>,
+			     <1 11 0xf08>,
+			     <1 10 0xf08>;
+		clock-frequency = <24000000>;
+	};
 };
 
 &dp {
-- 
2.1.4
