From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH v2 1/4] ARM: dts: Add SROMc to Exynos 5410
Date: Tue, 27 Oct 2015 11:43:52 +0300
Message-ID: <91ae80f172192fa4dbc8bf8ee5a9068661592de6.1445935215.git.p.fedin@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20313 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754424AbbJ0IoE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Oct 2015 04:44:04 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWV00HMDEXDDU60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Oct 2015 08:44:01 +0000 (GMT)
In-reply-to: <cover.1445935215.git.p.fedin@samsung.com>
In-reply-to: <cover.1445935215.git.p.fedin@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

This machine uses own SoC device tree file, add missing part.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
 arch/arm/boot/dts/exynos5410.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 4603356..af85aad 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -101,6 +101,11 @@
 			reg = <0x10000000 0x100>;
 		};
 
+		sromc: sromc@12250000 {
+			compatible = "samsung,exynos-srom";
+			reg = <0x12250000 0x10>;
+		};
+
 		pmu_system_controller: system-controller@10040000 {
 			compatible = "samsung,exynos5410-pmu", "syscon";
 			reg = <0x10040000 0x5000>;
-- 
2.4.4
