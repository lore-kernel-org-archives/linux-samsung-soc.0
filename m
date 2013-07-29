From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 6/7] ARM: dts: Add DP controller DT node to exynos5420 SoC
Date: Mon, 29 Jul 2013 19:19:30 +0530
Message-ID: <1375105771-8106-7-git-send-email-vikas.sajjan@linaro.org>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:58701 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755107Ab3G2NuM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 09:50:12 -0400
Received: by mail-pb0-f44.google.com with SMTP id wy7so4683134pbc.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 06:50:11 -0700 (PDT)
In-Reply-To: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds DP controller DT node to exynos5420 SoC

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 1f659f4..948307c 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -181,6 +181,12 @@
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
+	dp-controller {
+		clocks = <&clock 412>;
+		clock-names = "dp";
+		status = "okay";
+	};
+
 	fimd {
 		samsung,power-domain = <&disp_pd>;
 		clocks = <&clock 147>, <&clock 421>;
-- 
1.7.9.5
