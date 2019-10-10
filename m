From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 24/36] ARM: s3c: include mach/irqs.h where needed
Date: Thu, 10 Oct 2019 22:30:08 +0200
Message-ID: <20191010203043.1241612-24-arnd@arndb.de>
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
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Preparing for a later conversion to sparse IRQs, this ensures that
the mach/irqs.h header is still visible in files that reference
an IRQ number.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c24xx/bast-ide.c    | 1 +
 arch/arm/mach-s3c24xx/bast-irq.c    | 1 +
 arch/arm/mach-s3c24xx/common.h      | 1 +
 arch/arm/mach-s3c24xx/irq-s3c24xx.c | 1 +
 arch/arm/mach-s3c24xx/pm-s3c2412.c  | 2 ++
 arch/arm/mach-s3c24xx/s3c2443.c     | 1 +
 arch/arm/mach-s3c24xx/simtec-usb.c  | 1 +
 7 files changed, 8 insertions(+)

diff --git a/arch/arm/mach-s3c24xx/bast-ide.c b/arch/arm/mach-s3c24xx/bast-ide.c
index 067944398f46..ee6fbb407640 100644
--- a/arch/arm/mach-s3c24xx/bast-ide.c
+++ b/arch/arm/mach-s3c24xx/bast-ide.c
@@ -20,6 +20,7 @@
 #include <asm/mach/irq.h>
 
 #include <mach/map.h>
+#include <mach/irqs.h>
 
 #include "bast.h"
 
diff --git a/arch/arm/mach-s3c24xx/bast-irq.c b/arch/arm/mach-s3c24xx/bast-irq.c
index 03728058d58d..4cec084ae443 100644
--- a/arch/arm/mach-s3c24xx/bast-irq.c
+++ b/arch/arm/mach-s3c24xx/bast-irq.c
@@ -17,6 +17,7 @@
 
 #include <mach/hardware.h>
 #include <mach/regs-irq.h>
+#include <mach/irqs.h>
 
 #include "bast.h"
 
diff --git a/arch/arm/mach-s3c24xx/common.h b/arch/arm/mach-s3c24xx/common.h
index d087b20e8857..97eb72f1d8bf 100644
--- a/arch/arm/mach-s3c24xx/common.h
+++ b/arch/arm/mach-s3c24xx/common.h
@@ -10,6 +10,7 @@
 #define __ARCH_ARM_MACH_S3C24XX_COMMON_H __FILE__
 
 #include <linux/reboot.h>
+#include <mach/irqs.h>
 
 struct s3c2410_uartcfg;
 
diff --git a/arch/arm/mach-s3c24xx/irq-s3c24xx.c b/arch/arm/mach-s3c24xx/irq-s3c24xx.c
index d2031fecc386..b0e879ee14c1 100644
--- a/arch/arm/mach-s3c24xx/irq-s3c24xx.c
+++ b/arch/arm/mach-s3c24xx/irq-s3c24xx.c
@@ -25,6 +25,7 @@
 #include <asm/exception.h>
 #include <asm/mach/irq.h>
 
+#include <mach/irqs.h>
 #include <mach/regs-irq.h>
 #include <mach/regs-gpio.h>
 
diff --git a/arch/arm/mach-s3c24xx/pm-s3c2412.c b/arch/arm/mach-s3c24xx/pm-s3c2412.c
index 2dfdaab0aa1f..1ad9c61f9253 100644
--- a/arch/arm/mach-s3c24xx/pm-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/pm-s3c2412.c
@@ -20,6 +20,8 @@
 #include <asm/irq.h>
 
 #include <mach/hardware.h>
+#include <mach/irqs.h>
+
 #include <mach/regs-gpio.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/s3c2443.c
index 313e369c3ddd..f404ecac4baf 100644
--- a/arch/arm/mach-s3c24xx/s3c2443.c
+++ b/arch/arm/mach-s3c24xx/s3c2443.c
@@ -25,6 +25,7 @@
 
 #include <mach/hardware.h>
 #include <mach/gpio-samsung.h>
+#include <mach/irqs.h>
 #include <asm/irq.h>
 #include <asm/system_misc.h>
 
diff --git a/arch/arm/mach-s3c24xx/simtec-usb.c b/arch/arm/mach-s3c24xx/simtec-usb.c
index dc1016ffed94..b15e0c49fa11 100644
--- a/arch/arm/mach-s3c24xx/simtec-usb.c
+++ b/arch/arm/mach-s3c24xx/simtec-usb.c
@@ -25,6 +25,7 @@
 
 #include <mach/hardware.h>
 #include <mach/gpio-samsung.h>
+#include <mach/irqs.h>
 #include <asm/irq.h>
 
 #include <linux/platform_data/usb-ohci-s3c2410.h>
-- 
2.20.0
