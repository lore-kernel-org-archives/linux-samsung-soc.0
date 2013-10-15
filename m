From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 1/2] ARM: dts: Exynos5420: add clock entries to gsc power domain
Date: Tue, 15 Oct 2013 16:50:53 +0530
Message-ID: <1381836054-6590-2-git-send-email-l.krishna@samsung.com>
References: <1381836054-6590-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49773 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758187Ab3JOLAR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 07:00:17 -0400
In-reply-to: <1381836054-6590-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree@vger.kernel.org, khw0178.kim@samsung.com, prathyush.k@samsung.com, cpgs@samsung.com

Add clock nodes for oscillator clock, input clocks and parents of input
clocks to gsc power domain so that we can set/restore the input
clocks while powering on and powering off a domain.

Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 09aa06c..7f0296c 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -116,6 +116,9 @@
 	gsc_pd: power-domain@10044000 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044000 0x20>;
+		clocks = <&clock 1>, <&clock 1032>, <&clock 1033>,
+			 <&clock 1034>, <&clock 1035>;
+		clock-names = "oscclk", "pclk0", "clk0", "pclk1", "clk1";
 	};
 
 	isp_pd: power-domain@10044020 {
-- 
1.7.9.5
