From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v5.1 RESEND] dt-bindings: hwrng: Add Samsung Exynos 5250+
 True RNG bindings
Date: Fri, 11 Jan 2019 14:21:39 +0100
Message-ID: <20190111132139.12333-1-l.stelmach@samsung.com>
References: <CGME20190111132222eucas1p1d80caf8ba30422bc5fe1a1fac4cf48e8@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKt-ujsB-t9A=4dEAjqrvcquUG+qF3tFg1YCqmup_5wcw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>, Joe Perches <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Otto Sabart <ottosabart@seberm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add binding documentation for the True Random Number Generator
found on Samsung Exynos 5250+ SoCs.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 .../bindings/rng/samsung,exynos5250-trng.txt    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt

diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
new file mode 100644
index 000000000000..5a613a4ec780
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
@@ -0,0 +1,17 @@
+Exynos True Random Number Generator
+
+Required properties:
+
+- compatible  : Should be "samsung,exynos5250-trng".
+- reg         : Specifies base physical address and size of the registers map.
+- clocks      : Phandle to clock-controller plus clock-specifier pair.
+- clock-names : "secss" as a clock name.
+
+Example:
+
+	rng@10830600 {
+		compatible = "samsung,exynos5250-trng";
+		reg = <0x10830600 0x100>;
+		clocks = <&clock CLK_SSS>;
+		clock-names = "secss";
+	};
-- 
2.20.1
