From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 2/5] regulator: dt-bindings: Add DT include for constants
Date: Wed,  8 Oct 2014 15:44:04 +0200
Message-ID: <1412775847-15213-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1412775847-15213-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412775847-15213-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Device Tree source files can set a regulator operating mode to be
used as an initial default. Instead of using magic numbers, a header
file can be included that provides macro definitions for the opmodes.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 include/dt-bindings/regulator/regulator.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/regulator/regulator.h

diff --git a/include/dt-bindings/regulator/regulator.h b/include/dt-bindings/regulator/regulator.h
new file mode 100644
index 0000000..5051093
--- /dev/null
+++ b/include/dt-bindings/regulator/regulator.h
@@ -0,0 +1,16 @@
+/*
+ * This header provides constants for regulator bindings.
+ */
+
+#ifndef _DT_BINDINGS_REGULATOR_REGULATOR_H
+#define _DT_BINDINGS_REGULATOR_REGULATOR_H
+
+/*
+ * Regulator operating modes.
+ */
+#define REGULATOR_MODE_FAST			0x1
+#define REGULATOR_MODE_NORMAL			0x2
+#define REGULATOR_MODE_IDLE			0x4
+#define REGULATOR_MODE_STANDBY			0x8
+
+#endif
-- 
2.1.0
