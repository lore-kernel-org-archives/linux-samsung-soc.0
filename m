From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 9/9] ARM: dts: Add samsung,asv-bin property for
 odroidxu3-lite
Date: Tue, 13 Aug 2019 17:08:27 +0200
Message-ID: <20190813150827.31972-10-s.nawrocki@samsung.com>
References: <20190813150827.31972-1-s.nawrocki@samsung.com>
        <CGME20190813150900eucas1p12fbf753613c727d8cb6992b6f77aca80@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813150827.31972-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5422 SoC used on Odroid XU3 Lite boards belongs to
a special ASV bin but this information cannot be read from the
CHIPID block registers. Add samsung,asv-bin property for XU3
Lite to ensure the ASV bin is properly determined.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v2:
 - none

Changes since v1 (RFC):
 - new patch
---
 arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts b/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
index c19b5a51ca44..a31ca2ef750f 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
@@ -26,6 +26,10 @@
 	status = "disabled";
 };
 
+&chipid {
+	samsung,asv-bin = <2>;
+};
+
 &pwm {
 	/*
 	 * PWM 0 -- fan
-- 
2.17.1
