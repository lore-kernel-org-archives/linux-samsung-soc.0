From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v9 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Wed, 01 Feb 2017 16:46:54 +0900
Message-ID: <1485935214-16210-4-git-send-email-hoegeun.kwon@samsung.com>
References: <1485935214-16210-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170201074711epcas1p3fbd82e0c30c54000ac19efd1ae8f74fc@epcas1p3.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1485935214-16210-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org, robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, a.hajda@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Hyungwon Hwang <human.hwang@samsung.com>

This patch add the panel device tree node for S6E3HA2 display
controller to TM2 dts.

Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index dea0a6f..db3fed2 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -52,6 +52,18 @@
 	assigned-clock-rates = <250000000>, <400000000>;
 };
 
+&dsi {
+	panel@0 {
+		compatible = "samsung,s6e3ha2";
+		reg = <0>;
+		vdd3-supply = <&ldo27_reg>;
+		vci-supply = <&ldo28_reg>;
+		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
+		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &hsi2c_9 {
 	status = "okay";
 
-- 
1.9.1
