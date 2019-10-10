From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 29/36] ARM: s3c: cpufreq: split out registers
Date: Thu, 10 Oct 2019 22:30:13 +0200
Message-ID: <20191010203043.1241612-29-arnd@arndb.de>
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
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Each of the cpufreq drivers uses a fixed set of register
bits, copy those definitions into the drivers to avoid
including mach/regs-clock.h.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/cpufreq/s3c2410-cpufreq.c | 11 +++++++++--
 drivers/cpufreq/s3c2412-cpufreq.c | 20 +++++++++++++++++++-
 drivers/cpufreq/s3c2440-cpufreq.c | 24 ++++++++++++++++++++++--
 drivers/cpufreq/s3c24xx-cpufreq.c |  4 +++-
 4 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/s3c2410-cpufreq.c b/drivers/cpufreq/s3c2410-cpufreq.c
index 0c4f2ccd7e22..5c6cb590b63f 100644
--- a/drivers/cpufreq/s3c2410-cpufreq.c
+++ b/drivers/cpufreq/s3c2410-cpufreq.c
@@ -20,11 +20,18 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/regs-clock.h>
-
 #include <plat/cpu.h>
 #include <plat/cpu-freq-core.h>
 
+#include <mach/map.h>
+
+#define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
+
+#define S3C2410_CLKDIVN	    S3C2410_CLKREG(0x14)
+
+#define S3C2410_CLKDIVN_PDIVN	     (1<<0)
+#define S3C2410_CLKDIVN_HDIVN	     (1<<1)
+
 /* Note, 2410A has an extra mode for 1:4:4 ratio, bit 2 of CLKDIV */
 
 static void s3c2410_cpufreq_setdivs(struct s3c_cpufreq_config *cfg)
diff --git a/drivers/cpufreq/s3c2412-cpufreq.c b/drivers/cpufreq/s3c2412-cpufreq.c
index 53385a9ab957..d922d0d47c80 100644
--- a/drivers/cpufreq/s3c2412-cpufreq.c
+++ b/drivers/cpufreq/s3c2412-cpufreq.c
@@ -23,12 +23,30 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/regs-clock.h>
 #include <mach/s3c2412.h>
 
 #include <plat/cpu.h>
 #include <plat/cpu-freq-core.h>
 
+#include <mach/map.h>
+
+#define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
+
+#define S3C2410_CLKDIVN	    S3C2410_CLKREG(0x14)
+
+#define S3C2412_CLKDIVN_PDIVN		(1<<2)
+#define S3C2412_CLKDIVN_HDIVN_MASK	(3<<0)
+#define S3C2412_CLKDIVN_ARMDIVN		(1<<3)
+#define S3C2412_CLKDIVN_DVSEN		(1<<4)
+#define S3C2412_CLKDIVN_HALFHCLK	(1<<5)
+#define S3C2412_CLKDIVN_USB48DIV	(1<<6)
+#define S3C2412_CLKDIVN_UARTDIV_MASK	(15<<8)
+#define S3C2412_CLKDIVN_UARTDIV_SHIFT	(8)
+#define S3C2412_CLKDIVN_I2SDIV_MASK	(15<<12)
+#define S3C2412_CLKDIVN_I2SDIV_SHIFT	(12)
+#define S3C2412_CLKDIVN_CAMDIV_MASK	(15<<16)
+#define S3C2412_CLKDIVN_CAMDIV_SHIFT	(16)
+
 /* our clock resources. */
 static struct clk *xtal;
 static struct clk *fclk;
diff --git a/drivers/cpufreq/s3c2440-cpufreq.c b/drivers/cpufreq/s3c2440-cpufreq.c
index 3f772ba8896e..5fe7a891fa13 100644
--- a/drivers/cpufreq/s3c2440-cpufreq.c
+++ b/drivers/cpufreq/s3c2440-cpufreq.c
@@ -24,11 +24,31 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/regs-clock.h>
-
 #include <plat/cpu.h>
 #include <plat/cpu-freq-core.h>
 
+#include <mach/map.h>
+
+#define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
+#define S3C2410_CLKDIVN	    S3C2410_CLKREG(0x14)
+#define S3C2440_CAMDIVN	    S3C2410_CLKREG(0x18)
+
+#define S3C2440_CLKDIVN_PDIVN	     (1<<0)
+#define S3C2440_CLKDIVN_HDIVN_MASK   (3<<1)
+#define S3C2440_CLKDIVN_HDIVN_1      (0<<1)
+#define S3C2440_CLKDIVN_HDIVN_2      (1<<1)
+#define S3C2440_CLKDIVN_HDIVN_4_8    (2<<1)
+#define S3C2440_CLKDIVN_HDIVN_3_6    (3<<1)
+#define S3C2440_CLKDIVN_UCLK         (1<<3)
+
+#define S3C2440_CAMDIVN_CAMCLK_MASK  (0xf<<0)
+#define S3C2440_CAMDIVN_CAMCLK_SEL   (1<<4)
+#define S3C2440_CAMDIVN_HCLK3_HALF   (1<<8)
+#define S3C2440_CAMDIVN_HCLK4_HALF   (1<<9)
+#define S3C2440_CAMDIVN_DVSEN        (1<<12)
+
+#define S3C2442_CAMDIVN_CAMCLK_DIV3  (1<<5)
+
 static struct clk *xtal;
 static struct clk *fclk;
 static struct clk *hclk;
diff --git a/drivers/cpufreq/s3c24xx-cpufreq.c b/drivers/cpufreq/s3c24xx-cpufreq.c
index ed0e713b1b57..c786e1197d3c 100644
--- a/drivers/cpufreq/s3c24xx-cpufreq.c
+++ b/drivers/cpufreq/s3c24xx-cpufreq.c
@@ -28,9 +28,11 @@
 #include <plat/cpu.h>
 #include <plat/cpu-freq-core.h>
 
-#include <mach/regs-clock.h>
+#include <mach/map.h>
 
 /* note, cpufreq support deals in kHz, no Hz */
+#define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
+#define S3C2410_MPLLCON     S3C2410_CLKREG(0x04)
 
 static struct cpufreq_driver s3c24xx_driver;
 static struct s3c_cpufreq_config cpu_cur;
-- 
2.20.0
