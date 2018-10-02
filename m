From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH] dt-bindings: hwrng: Add Samsung Exynos 5250+ True RNG
 bindings
Date: Tue, 02 Oct 2018 09:56:33 +0200
Message-ID: <20181002075633.25658-1-l.stelmach@samsung.com>
References: <CAL_JsqLoZfU+DMxHJg7ZqD06dgcsxiDbYYW99x8H4C0sOwdiiw@mail.gmail.com>
        <CGME20181002075700epcas2p1e1650ae02c1d6b1bfb946b146d4ce223@epcas2p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAL_JsqLoZfU+DMxHJg7ZqD06dgcsxiDbYYW99x8H4C0sOwdiiw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Joe Perches <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add binding documentation for the True Random Number Generator
found on Samsung Exynos 5250+ SoCs.

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
2.19.0
