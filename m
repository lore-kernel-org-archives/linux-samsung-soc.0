From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] ASoC: samsung: i2s: Document clocks macros
Date: Thu, 26 Sep 2019 13:02:19 +0200
Message-ID: <20190926110219.6144-1-m.szyprowski@samsung.com>
References: <CGME20190926110226eucas1p24dbb1b39ffa3f607aa28c0c4d9ff6aba@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Maciej Falkowski <m.falkowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Maciej Falkowski <m.falkowski@samsung.com>

Document clocks macros with their description
from 'Documentation/devicetree/bindings/sound/samsung-i2s.txt'

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- Added proper commit message and description
- Moved comments to the right side

Best regards,
Maciej Falkowski
---
 include/dt-bindings/sound/samsung-i2s.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/sound/samsung-i2s.h b/include/dt-bindings/sound/samsung-i2s.h
index 77545f14c379..250de0d6c734 100644
--- a/include/dt-bindings/sound/samsung-i2s.h
+++ b/include/dt-bindings/sound/samsung-i2s.h
@@ -2,8 +2,14 @@
 #ifndef _DT_BINDINGS_SAMSUNG_I2S_H
 #define _DT_BINDINGS_SAMSUNG_I2S_H
 
-#define CLK_I2S_CDCLK		0
-#define CLK_I2S_RCLK_SRC	1
-#define CLK_I2S_RCLK_PSR	2
+#define CLK_I2S_CDCLK		0 /* the CDCLK (CODECLKO) gate clock */
+
+#define CLK_I2S_RCLK_SRC	1 /* the RCLKSRC mux clock (corresponding to
+				   * RCLKSRC bit in IISMOD register)
+				   */
+
+#define CLK_I2S_RCLK_PSR	2 /* the RCLK prescaler divider clock
+				   * (corresponding to the IISPSR register)
+				   */
 
 #endif /* _DT_BINDINGS_SAMSUNG_I2S_H */
-- 
2.17.1
