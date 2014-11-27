From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v4 2/7] regulator: dt-bindings: Document the ena-gpios property
Date: Thu, 27 Nov 2014 12:20:48 +0100
Message-ID: <1417087253-12306-3-git-send-email-k.kozlowski@samsung.com>
References: <1417087253-12306-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1417087253-12306-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Document new properties for regulators (ena-gpios and
ena-gpio-open-drain) for enabling control over GPIO.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 4e7ed762b3bb..dad57b3badc7 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -30,6 +30,10 @@ Optional properties:
 	- regulator-off-in-suspend: regulator should be off in suspend state.
 	- regulator-suspend-microvolt: regulator should be set to this voltage
 	  in suspend.
+- ena-gpios: GPIO to use for enable control. Actual implementation depends
+  on regulator driver. The bindings documentation for given driver describes
+  which regulator actually supports it.
+- ena-gpio-open-drain: GPIO is open drain type.
 
 Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
-- 
1.9.1
