From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v5 2/5] regulator: Add function to map modes to struct regulator_desc
Date: Fri,  7 Nov 2014 14:00:02 +0100
Message-ID: <1415365205-27630-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1415365205-27630-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415365205-27630-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The "regulator-initial-mode" and "regulator-mode" DT properties allows
to configure the regulator operating modes at startup or when a system
enters into a susend state.

But these properties use as valid values the operating modes supported
by each device while the core deals with the standard operating modes.
So a mapping function is needed to translate from the hardware specific
modes to the standard ones.

This mapping is a non-varying configuration for each regulator, so add
a function pointer to struct regulator_desc that will allow drivers to
define their callback to do the modes translation.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes in v5:
 - Add a better explanation of what mode is passed as an argument and what
   mode is returned. Suggested by Krzysztof Kozlowski.
 - Explain that this callback is needed to be able to parse the regulator
   initial and suspend state modes. Suggested by Krzysztof Kozlowski.

 include/linux/regulator/driver.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 28da08e..7966650 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -243,6 +243,12 @@ enum regulator_type {
  *
  * @enable_time: Time taken for initial enable of regulator (in uS).
  * @off_on_delay: guard time (in uS), before re-enabling a regulator
+ *
+ * @map_modes: Callback invoked to translate from hardware to standard modes.
+ *             The function returns the standard REGULATOR_MODE that maps to
+ *             the hardware specific mode passed as an argument.
+ *             If the callback is not defined, the "regulator-initial-mode"
+ *             and suspend states "regulator-mode" properties won't be parsed.
  */
 struct regulator_desc {
 	const char *name;
@@ -285,6 +291,8 @@ struct regulator_desc {
 	unsigned int enable_time;
 
 	unsigned int off_on_delay;
+
+	unsigned int (*map_modes)(unsigned int mode);
 };
 
 /**
-- 
2.1.0
