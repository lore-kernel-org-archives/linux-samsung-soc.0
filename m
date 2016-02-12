From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] regulator: Rename files for max77686 and max77802 drivers
Date: Fri, 12 Feb 2016 01:14:23 -0300
Message-ID: <1455250463-5955-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:48019 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751372AbcBLEPI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Feb 2016 23:15:08 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

The max77686 and max77802 regulator drivers are for sub-devices of a MFD
driver for some PMIC blocks. But the same object file name (max77686.o)
was used for both the common MFD driver and the max77686 regulator one.

This confuses kbuild if both drivers are built as module causing the MFD
driver to not be copied when installing the modules.

Also, max77{686,802} are a quite generic name for MFD subdevices drivers
so it is better to rename them to max77{686,802}-regulator like it's the
case for most regulator drivers.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 MAINTAINERS                                            | 2 +-
 drivers/regulator/Makefile                             | 4 ++--
 drivers/regulator/{max77686.c => max77686-regulator.c} | 0
 drivers/regulator/{max77802.c => max77802-regulator.c} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/regulator/{max77686.c => max77686-regulator.c} (100%)
 rename drivers/regulator/{max77802.c => max77802-regulator.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97b99f24ea53..863eb59e101b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6904,7 +6904,7 @@ MAXIM MAX77802 MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Javier Martinez Canillas <javier@osg.samsung.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
-F:	drivers/*/*max77802.c
+F:	drivers/*/*max77802*.c
 F:	Documentation/devicetree/bindings/*/*max77802.txt
 F:	include/dt-bindings/*/*max77802.h
 
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 348cfd727350..bd6ae0ccd2e9 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -55,9 +55,9 @@ obj-$(CONFIG_REGULATOR_MAX8952) += max8952.o
 obj-$(CONFIG_REGULATOR_MAX8973) += max8973-regulator.o
 obj-$(CONFIG_REGULATOR_MAX8997) += max8997.o
 obj-$(CONFIG_REGULATOR_MAX8998) += max8998.o
-obj-$(CONFIG_REGULATOR_MAX77686) += max77686.o
+obj-$(CONFIG_REGULATOR_MAX77686) += max77686-regulator.o
 obj-$(CONFIG_REGULATOR_MAX77693) += max77693.o
-obj-$(CONFIG_REGULATOR_MAX77802) += max77802.o
+obj-$(CONFIG_REGULATOR_MAX77802) += max77802-regulator.o
 obj-$(CONFIG_REGULATOR_MC13783) += mc13783-regulator.o
 obj-$(CONFIG_REGULATOR_MC13892) += mc13892-regulator.o
 obj-$(CONFIG_REGULATOR_MC13XXX_CORE) +=  mc13xxx-regulator-core.o
diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686-regulator.c
similarity index 100%
rename from drivers/regulator/max77686.c
rename to drivers/regulator/max77686-regulator.c
diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802-regulator.c
similarity index 100%
rename from drivers/regulator/max77802.c
rename to drivers/regulator/max77802-regulator.c
-- 
2.5.0
