From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 2/3] ARM: exynos5420: dt: add clock entries to watchdog node
Date: Wed, 24 Jul 2013 15:08:18 +0530
Message-ID: <1374658699-3961-3-git-send-email-l.krishna@samsung.com>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36807 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751727Ab3GXJQK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 05:16:10 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF00HXTODYOM40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 18:15:37 +0900 (KST)
In-reply-to: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org

This patch adds clock entries to watchdog node for exynos5420
as per the common clock framework of exynos5420

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8c54c4b..e1d2d20 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -145,4 +145,10 @@
 		clocks = <&clock 260>, <&clock 131>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
+
+	watchdog {
+		clocks = <&clock 316>;
+		clock-names = "watchdog";
+		status = "okay";
+	};
 };
-- 
1.7.10.4
