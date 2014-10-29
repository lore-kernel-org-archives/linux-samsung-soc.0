From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 7/8] mfd/regulator: dt-bindings: max77686: Document gpio
 property
Date: Wed, 29 Oct 2014 16:06:45 +0100
Message-ID: <1414595206-1437-8-git-send-email-k.kozlowski@samsung.com>
References: <1414595206-1437-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1414595206-1437-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Document usage of gpio property which turns on external/GPIO control
over regulator.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/devicetree/bindings/mfd/max77686.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Documentation/devicetree/bindings/mfd/max77686.txt
index 75fdfaf41831..7a62baa406a2 100644
--- a/Documentation/devicetree/bindings/mfd/max77686.txt
+++ b/Documentation/devicetree/bindings/mfd/max77686.txt
@@ -39,6 +39,9 @@ to get matched with their hardware counterparts as follow:
 	-BUCKn	:	1-4.
   Use standard regulator bindings for it ('regulator-off-in-suspend').
 
+  Optional properties:
+  - gpio : GPIO to use for enable control. Valid only for LDO20, LDO21,
+    LDO22, BUCK8 and BUCK9 regulators.
 
 Example:
 
-- 
1.9.1
