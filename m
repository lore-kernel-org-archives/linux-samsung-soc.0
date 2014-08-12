From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/6] ARM: dts: Create fragment for tps65090 PMU
Date: Tue, 12 Aug 2014 18:44:23 +0200
Message-ID: <1407861868-20097-2-git-send-email-javier.martinez@collabora.co.uk>
References: <1407861868-20097-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1407861868-20097-1-git-send-email-javier.martinez@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The tps65090 is a Power Management Unit (PMU) used in several
boards so the same information is described on different DTS.
It is better to create a .dtsi fragment that can be included.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/tps65090.dtsi | 57 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 arch/arm/boot/dts/tps65090.dtsi

diff --git a/arch/arm/boot/dts/tps65090.dtsi b/arch/arm/boot/dts/tps65090.dtsi
new file mode 100644
index 0000000..a2ff534
--- /dev/null
+++ b/arch/arm/boot/dts/tps65090.dtsi
@@ -0,0 +1,57 @@
+/*
+ * Copyright (C) 2014 Google, Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/*
+ * Integrated Power Management Chip
+ * http://www.ti.com/lit/ds/symlink/tps65090.pdf
+ */
+&tps {
+	compatible = "ti,tps65090";
+
+	regulators {
+		tps65090_dcdc1: dcdc1 {
+		};
+
+		tps65090_dcdc2: dcdc2 {
+		};
+
+		tps65090_dcdc3: dcdc3 {
+		};
+
+		tps65090_fet1: fet1 {
+		};
+
+		tps65090_fet2: fet2 {
+		};
+
+		tps65090_fet3: fet3 {
+		};
+
+		tps65090_fet4: fet4 {
+		};
+
+		tps65090_fet5: fet5 {
+		};
+
+		tps65090_fet6: fet6 {
+		};
+
+		tps65090_fet7: fet7 {
+		};
+
+		tps65090_ldo1: ldo1 {
+		};
+
+		tps65090_ldo2: ldo2 {
+		};
+	};
+
+	tps65090_charger: charger {
+		compatible = "ti,tps65090-charger";
+	};
+};
-- 
2.0.0.rc2
