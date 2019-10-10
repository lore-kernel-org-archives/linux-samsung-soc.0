From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 31/36] ARM: s3c: cpufreq: use global s3c2412_cpufreq_setrefresh
Date: Thu, 10 Oct 2019 22:30:15 +0200
Message-ID: <20191010203043.1241612-31-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010203043.1241612-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

There are two identical copies of the s3c2412_cpufreq_setrefresh
function: a static one in the cpufreq driver and a global
version in iotiming-s3c2412.c.

As the function requires the use of a hardcoded register address
from a header that we want to not be visible to drivers, just
move the existing global function and add a declaration in
one of the cpufreq header files.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/cpufreq/s3c2412-cpufreq.c            | 23 --------------------
 include/linux/soc/samsung/s3c-cpufreq-core.h |  1 +
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/cpufreq/s3c2412-cpufreq.c b/drivers/cpufreq/s3c2412-cpufreq.c
index 38dc9e6db633..a77c63e92e1a 100644
--- a/drivers/cpufreq/s3c2412-cpufreq.c
+++ b/drivers/cpufreq/s3c2412-cpufreq.c
@@ -25,8 +25,6 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/s3c2412.h>
-
 #include <mach/map.h>
 
 #define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
@@ -156,27 +154,6 @@ static void s3c2412_cpufreq_setdivs(struct s3c_cpufreq_config *cfg)
 	clk_set_parent(armclk, cfg->divs.dvs ? hclk : fclk);
 }
 
-static void s3c2412_cpufreq_setrefresh(struct s3c_cpufreq_config *cfg)
-{
-	struct s3c_cpufreq_board *board = cfg->board;
-	unsigned long refresh;
-
-	s3c_freq_dbg("%s: refresh %u ns, hclk %lu\n", __func__,
-		     board->refresh, cfg->freq.hclk);
-
-	/* Reduce both the refresh time (in ns) and the frequency (in MHz)
-	 * by 10 each to ensure that we do not overflow 32 bit numbers. This
-	 * should work for HCLK up to 133MHz and refresh period up to 30usec.
-	 */
-
-	refresh = (board->refresh / 10);
-	refresh *= (cfg->freq.hclk / 100);
-	refresh /= (1 * 1000 * 1000);	/* 10^6 */
-
-	s3c_freq_dbg("%s: setting refresh 0x%08lx\n", __func__, refresh);
-	__raw_writel(refresh, S3C2412_REFRESH);
-}
-
 /* set the default cpu frequency information, based on an 200MHz part
  * as we have no other way of detecting the speed rating in software.
  */
diff --git a/include/linux/soc/samsung/s3c-cpufreq-core.h b/include/linux/soc/samsung/s3c-cpufreq-core.h
index 4d22be1031b9..eca942559014 100644
--- a/include/linux/soc/samsung/s3c-cpufreq-core.h
+++ b/include/linux/soc/samsung/s3c-cpufreq-core.h
@@ -246,6 +246,7 @@ extern int s3c2412_iotiming_calc(struct s3c_cpufreq_config *cfg,
 
 extern void s3c2412_iotiming_set(struct s3c_cpufreq_config *cfg,
 				 struct s3c_iotimings *iot);
+extern void s3c2412_cpufreq_setrefresh(struct s3c_cpufreq_config *cfg);
 #else
 #define s3c2412_iotiming_debugfs NULL
 #define s3c2412_iotiming_calc NULL
-- 
2.20.0
