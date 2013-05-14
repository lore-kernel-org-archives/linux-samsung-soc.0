From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 2/3] ARM: dts: Add clock provider information for DP controller in Exynos5250 SoC
Date: Tue, 14 May 2013 19:42:45 +0530
Message-ID: <1368540766-9818-3-git-send-email-vikas.sajjan@linaro.org>
References: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:39028 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754772Ab3ENONG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 10:13:06 -0400
Received: by mail-pd0-f172.google.com with SMTP id 6so463985pdd.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 May 2013 07:13:06 -0700 (PDT)
In-Reply-To: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jg1.han@samsung.com, s.trumtrar@pengutronix.de, tomasz.figa@gmail.com, olof@lixom.net, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds clock provider information for DP controller required by CCF.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
Acked-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 98dfc3e..a55255b 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -606,6 +606,8 @@
 		reg = <0x145b0000 0x1000>;
 		interrupts = <10 3>;
 		interrupt-parent = <&combiner>;
+		clocks = <&clock 342>;
+		clock-names = "dp";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-- 
1.7.9.5
