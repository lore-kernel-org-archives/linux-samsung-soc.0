From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 10/36] ARM: s5pv210: use private pm save/restore
Date: Thu, 10 Oct 2019 22:29:54 +0200
Message-ID: <20191010203043.1241612-10-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191010203043.1241612-1-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The pm save/restore code is fairly small, so in order to
separate the s3c and s5p platforms, adding an s5p specific
copy instead of sharing it is actually easier.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s5pv210/Makefile     |  7 -----
 arch/arm/mach-s5pv210/pm.c         | 45 ++++++++++++++++++++++++++++--
 arch/arm/mach-s5pv210/regs-clock.h |  2 +-
 arch/arm/mach-s5pv210/s5pv210.c    |  2 --
 arch/arm/plat-samsung/Makefile     |  4 +--
 5 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
index e7b551e18e5c..aa0a1f091daf 100644
--- a/arch/arm/mach-s5pv210/Makefile
+++ b/arch/arm/mach-s5pv210/Makefile
@@ -3,12 +3,5 @@
 # Copyright (c) 2010 Samsung Electronics Co., Ltd.
 # 		http://www.samsung.com/
 
-ccflags-$(CONFIG_ARCH_MULTIPLATFORM) += -I$(srctree)/arch/arm/plat-samsung/include
-
-# Core
-
 obj-$(CONFIG_PM_SLEEP)		+= pm.o sleep.o
-
-# machine support
-
 obj-y				+= s5pv210.o
diff --git a/arch/arm/mach-s5pv210/pm.c b/arch/arm/mach-s5pv210/pm.c
index efdb5a27c060..d59c094cdea8 100644
--- a/arch/arm/mach-s5pv210/pm.c
+++ b/arch/arm/mach-s5pv210/pm.c
@@ -13,15 +13,56 @@
 #include <linux/suspend.h>
 #include <linux/syscore_ops.h>
 #include <linux/io.h>
+#include <linux/soc/samsung/s3c-pm.h>
 
 #include <asm/cacheflush.h>
 #include <asm/suspend.h>
 
-#include <plat/pm-common.h>
-
 #include "common.h"
 #include "regs-clock.h"
 
+/* helper functions to save and restore register state */
+struct sleep_save {
+	void __iomem	*reg;
+	unsigned long	val;
+};
+
+#define SAVE_ITEM(x) \
+	{ .reg = (x) }
+
+/**
+ * s3c_pm_do_save() - save a set of registers for restoration on resume.
+ * @ptr: Pointer to an array of registers.
+ * @count: Size of the ptr array.
+ *
+ * Run through the list of registers given, saving their contents in the
+ * array for later restoration when we wakeup.
+ */
+static void s3c_pm_do_save(struct sleep_save *ptr, int count)
+{
+	for (; count > 0; count--, ptr++) {
+		ptr->val = readl_relaxed(ptr->reg);
+		S3C_PMDBG("saved %p value %08lx\n", ptr->reg, ptr->val);
+	}
+}
+
+/**
+ * s3c_pm_do_restore() - restore register values from the save list.
+ * @ptr: Pointer to an array of registers.
+ * @count: Size of the ptr array.
+ *
+ * Restore the register values saved from s3c_pm_do_save().
+ *
+ * WARNING: Do not put any debug in here that may effect memory or use
+ * peripherals, as things may be changing!
+*/
+
+static void s3c_pm_do_restore_core(const struct sleep_save *ptr, int count)
+{
+	for (; count > 0; count--, ptr++)
+		writel_relaxed(ptr->val, ptr->reg);
+}
+
 static struct sleep_save s5pv210_core_save[] = {
 	/* Clock ETC */
 	SAVE_ITEM(S5P_MDNIE_SEL),
diff --git a/arch/arm/mach-s5pv210/regs-clock.h b/arch/arm/mach-s5pv210/regs-clock.h
index 2a35c831a9b0..8c7530614e37 100644
--- a/arch/arm/mach-s5pv210/regs-clock.h
+++ b/arch/arm/mach-s5pv210/regs-clock.h
@@ -9,7 +9,7 @@
 #ifndef __ASM_ARCH_REGS_CLOCK_H
 #define __ASM_ARCH_REGS_CLOCK_H __FILE__
 
-#include <plat/map-base.h>
+#define S3C_VA_SYS		((void __iomem __force *)0xF6100000)
 
 #define S5P_CLKREG(x)		(S3C_VA_SYS + (x))
 
diff --git a/arch/arm/mach-s5pv210/s5pv210.c b/arch/arm/mach-s5pv210/s5pv210.c
index 868f9c20419d..a21ed3bb992a 100644
--- a/arch/arm/mach-s5pv210/s5pv210.c
+++ b/arch/arm/mach-s5pv210/s5pv210.c
@@ -13,8 +13,6 @@
 #include <asm/mach/map.h>
 #include <asm/system_misc.h>
 
-#include <plat/map-base.h>
-
 #include "common.h"
 #include "regs-clock.h"
 
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index d88b9b84f3a9..025ce22876c1 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -24,9 +24,7 @@ obj-$(CONFIG_GPIO_SAMSUNG)     += gpio-samsung.o
 
 # PM support
 
-obj-$(CONFIG_PM_SLEEP)		+= pm-common.o
-obj-$(CONFIG_EXYNOS_CPU_SUSPEND) += pm-common.o
-obj-$(CONFIG_SAMSUNG_PM)	+= pm.o
+obj-$(CONFIG_SAMSUNG_PM)	+= pm.o pm-common.o
 obj-$(CONFIG_SAMSUNG_PM_GPIO)	+= pm-gpio.o
 
 obj-$(CONFIG_SAMSUNG_WAKEMASK)	+= wakeup-mask.o
-- 
2.20.0
