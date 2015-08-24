From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 7/7] Documentation: dt-bindings: add exynos-srom binding
 information
Date: Mon, 24 Aug 2015 13:32:28 +0530
Message-ID: <1440403348-8974-8-git-send-email-pankaj.dubey@samsung.com>
References: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: k.kozlowski@samsung.com, kgene@kernel.org, heiko@sntech.de, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds exynos-srom binding information for SROM Controller
driver on Exynos SoCs.

CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Ian Campbell <ijc+devicetree@hellion.org.uk>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 .../devicetree/bindings/arm/samsung/exynos-srom.txt          | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
new file mode 100644
index 0000000..33886d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
@@ -0,0 +1,12 @@
+SAMSUNG Exynos SoCs SROM Controller driver.
+
+Required properties:
+- compatible : Should contain "samsung,exynos-srom".
+
+- reg: offset and length of the register set
+
+Example:
+	sromc@12570000 {
+		compatible = "samsung,exynos-srom";
+		reg = <0x12570000 0x10>;
+	};
-- 
2.4.5
