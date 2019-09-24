From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ASoC: samsung: i2s: Add clocks' macros descriptions
Date: Tue, 24 Sep 2019 13:48:38 +0200
Message-ID: <20190924114838.25482-1-m.szyprowski@samsung.com>
References: <CGME20190924114843eucas1p2ea9c36289d3912e022ad7c9070fc00ee@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Maciej Falkowski <m.falkowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Maciej Falkowski <m.falkowski@samsung.com>

To increase macro readability added descriptions
to clocks macros.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 include/dt-bindings/sound/samsung-i2s.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/sound/samsung-i2s.h b/include/dt-bindings/sound/samsung-i2s.h
index 77545f14c379..fd752475c762 100644
--- a/include/dt-bindings/sound/samsung-i2s.h
+++ b/include/dt-bindings/sound/samsung-i2s.h
@@ -2,8 +2,13 @@
 #ifndef _DT_BINDINGS_SAMSUNG_I2S_H
 #define _DT_BINDINGS_SAMSUNG_I2S_H
 
-#define CLK_I2S_CDCLK		0
-#define CLK_I2S_RCLK_SRC	1
-#define CLK_I2S_RCLK_PSR	2
+/* the CDCLK (CODECLKO) gate clock */
+#define CLK_I2S_CDCLK 0
+
+/* the RCLKSRC mux clock (corresponding to RCLKSRC bit in IISMOD register) */
+#define CLK_I2S_RCLK_SRC 1
+
+/* the RCLK prescaler divider clock (corresponding to the IISPSR register) */
+#define CLK_I2S_RCLK_PSR 2
 
 #endif /* _DT_BINDINGS_SAMSUNG_I2S_H */
-- 
2.17.1
