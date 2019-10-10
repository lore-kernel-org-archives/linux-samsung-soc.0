From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 32/36] ARM: s3c: iotiming: make functions static
Date: Thu, 10 Oct 2019 22:30:16 +0200
Message-ID: <20191010203043.1241612-32-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010203043.1241612-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

There are two functions in this file that are never called from
anywhere else, so they should be static to allow the compiler
to optimize it better and not pollute the global namespace.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c24xx/iotiming-s3c2410.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
index 5b3b16dd0ce8..5d85c259f328 100644
--- a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
@@ -129,7 +129,7 @@ static unsigned int calc_0124(unsigned int cyc, unsigned long hclk_tns,
 	return 0;
 }
 
-int calc_tacp(unsigned int cyc, unsigned long hclk, unsigned long *v)
+static int calc_tacp(unsigned int cyc, unsigned long hclk, unsigned long *v)
 {
 	/* Currently no support for Tacp calculations. */
 	return 0;
@@ -288,8 +288,8 @@ static unsigned int get_0124(unsigned long hclk_tns,
  * Given the BANKCON setting in @bt and the current frequency settings
  * in @cfg, update the cycle timing information.
  */
-void s3c2410_iotiming_getbank(struct s3c_cpufreq_config *cfg,
-			      struct s3c2410_iobank_timing *bt)
+static void s3c2410_iotiming_getbank(struct s3c_cpufreq_config *cfg,
+				     struct s3c2410_iobank_timing *bt)
 {
 	unsigned long bankcon = bt->bankcon;
 	unsigned long hclk = cfg->freq.hclk_tns;
-- 
2.20.0
