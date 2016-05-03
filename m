From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC PATCH 12/12] ARM: dts: exynos: Enable UART3 on Exynos5410
Date: Tue,  3 May 2016 19:52:29 +0200
Message-ID: <1462297949-13824-13-git-send-email-krzk@kernel.org>
References: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48667 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934291AbcECRxw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 May 2016 13:53:52 -0400
In-Reply-To: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

Just like other Exynos5 family SoCs, this one has four UARTs. Configure
clocks for UART3 and enable it.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index c8f2e4881667..0edcd7022293 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -215,7 +215,8 @@
 };
 
 &serial_3 {
-	status = "disabled";
+	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
+	clock-names = "uart", "clk_uart_baud0";
 };
 
 &sromc {
-- 
2.5.0
