From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 1/3] ARM: dts: exynos4: Add node for PWM device
Date: Mon, 15 Apr 2013 16:42:00 +0200
Message-ID: <1366036922-4103-2-git-send-email-t.figa@samsung.com>
References: <1366036922-4103-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13891 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751282Ab3DOOnZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 10:43:25 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLA003XZWWBSC01@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Apr 2013 23:43:24 +0900 (KST)
In-reply-to: <1366036922-4103-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, thomas.abraham@linaro.org, arnd@arndb.de, Tomasz Figa <t.figa@samsung.com>

This patch adds device tree node for PWM block present on Exynos 4 SoCs.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index d73eaa1..d7058c1 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -333,6 +333,14 @@
 		status = "disabled";
 	};
 
+	pwm@139D0000 {
+		compatible = "samsung,exynos4210-pwm";
+		reg = <0x139D0000 0x1000>;
+		interrupts = <0 37 0>, <0 38 0>, <0 39 0>, <0 40 0>, <0 41 0>;
+		#pwm-cells = <2>;
+		status = "disabled";
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.8.1.5
