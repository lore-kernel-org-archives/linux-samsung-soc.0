From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/3] ARM: dts: exynos: Remove duplicated inclusion of syscon restart nodes on Exynos5410
Date: Tue, 16 Jan 2018 22:31:27 +0100
Message-ID: <20180116213129.16209-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750796AbeAPVn7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 16:43:59 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

The exynos-syscon-restart.dtsi is already included by exynos5.dtsi
(through exynos54xx.dtsi).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 1886aa00b2db..1e6b57d013c4 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -11,7 +11,6 @@
  */
 
 #include "exynos54xx.dtsi"
-#include "exynos-syscon-restart.dtsi"
 #include <dt-bindings/clock/exynos5410.h>
 #include <dt-bindings/clock/exynos-audss-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.11.0
