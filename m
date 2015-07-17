From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/2] MAINTAINERS: add Device Tree binding doc for max77686 regulator
Date: Fri, 17 Jul 2015 10:17:57 +0200
Message-ID: <1437121078-26409-2-git-send-email-javier@osg.samsung.com>
References: <1437121078-26409-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437121078-26409-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Device Tree binding documentation for the Maxim max77686 regulators
has been moved from the Multi-Function Device DT binding section to its
own Documentation/devicetree/bindings/regulator/max77686.txt file.

Use a wilcard so both the mfd and regulator DT bindings are resolved.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2af741410533..d802d19a4ecc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6583,7 +6583,7 @@ F:	drivers/extcon/extcon-max77693.c
 F:	drivers/rtc/rtc-max77686.c
 F:	drivers/clk/clk-max77686.c
 F:	Documentation/devicetree/bindings/mfd/max14577.txt
-F:	Documentation/devicetree/bindings/mfd/max77686.txt
+F:	Documentation/devicetree/bindings/*/max77686.txt
 F:	Documentation/devicetree/bindings/mfd/max77693.txt
 F:	Documentation/devicetree/bindings/clock/maxim,max77686.txt
 F:	include/linux/mfd/max14577*.h
-- 
2.4.3
