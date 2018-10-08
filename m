From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 6/7] arm64: dts: exynos: Mark arch_timer device as
 not-fw-configured on TM2(e)
Date: Mon, 08 Oct 2018 14:50:08 +0200
Message-ID: <20181008125009.3721-7-m.szyprowski@samsung.com>
References: <20181008125009.3721-1-m.szyprowski@samsung.com>
        <CGME20181008125050eucas1p1caae30a4e791190e6c731816e36832ab@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181008125009.3721-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

TM2(e) boards use old firmware, which some PCSI requirements and doesn't
properly configure arch virtual timers, so add property indicating this
state. This enables respective workarounds in the timer driver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 2606c2ab6456..ded0fb6c5936 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -1265,6 +1265,7 @@
 };
 
 &timer {
+	arm,cpu-registers-not-fw-configured;
 	clock-frequency = <24000000>;
 };
 
-- 
2.17.1
