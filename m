From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 01/36] ARM: samsung: make S3C24XX_MISCCR access indirect
Date: Thu, 10 Oct 2019 22:29:45 +0200
Message-ID: <20191010203043.1241612-1-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191010202802.1132272-1-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The clk driver uses both a function call into an exported
platform file and a direct register access to a hardcoded
virtual address for accessing the MISCCR register, both
become are a problem for a multiplatform kernel because
of the header file dependency.

Make this an indirect function call through platform data
instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c24xx/common.c         |  3 +++
 drivers/clk/samsung/clk-s3c2410-dclk.c | 10 ++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index 3dc029c2d2cb..ebf6bde67816 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -667,5 +667,8 @@ struct platform_device s3c2410_device_dclk = {
 	.id		= 0,
 	.num_resources	= ARRAY_SIZE(s3c2410_dclk_resource),
 	.resource	= s3c2410_dclk_resource,
+	.dev		= {
+		.platform_data = s3c2410_modify_misccr,
+	},
 };
 #endif
diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/samsung/clk-s3c2410-dclk.c
index 1281672cb00e..fbcec0252c45 100644
--- a/drivers/clk/samsung/clk-s3c2410-dclk.c
+++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
@@ -14,10 +14,6 @@
 #include <linux/module.h>
 #include "clk.h"
 
-/* legacy access to misccr, until dt conversion is finished */
-#include <mach/hardware.h>
-#include <mach/regs-gpio.h>
-
 #define MUX_DCLK0	0
 #define MUX_DCLK1	1
 #define DIV_DCLK0	2
@@ -52,6 +48,7 @@ struct s3c24xx_clkout {
 	struct clk_hw		hw;
 	u32			mask;
 	u8			shift;
+	unsigned int (*modify_misccr)(unsigned int clr, unsigned int chg);
 };
 
 #define to_s3c24xx_clkout(_hw) container_of(_hw, struct s3c24xx_clkout, hw)
@@ -62,7 +59,7 @@ static u8 s3c24xx_clkout_get_parent(struct clk_hw *hw)
 	int num_parents = clk_hw_get_num_parents(hw);
 	u32 val;
 
-	val = readl_relaxed(S3C24XX_MISCCR) >> clkout->shift;
+	val = clkout->modify_misccr(0, 0) >> clkout->shift;
 	val >>= clkout->shift;
 	val &= clkout->mask;
 
@@ -76,7 +73,7 @@ static int s3c24xx_clkout_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct s3c24xx_clkout *clkout = to_s3c24xx_clkout(hw);
 
-	s3c2410_modify_misccr((clkout->mask << clkout->shift),
+	clkout->modify_misccr((clkout->mask << clkout->shift),
 			      (index << clkout->shift));
 
 	return 0;
@@ -110,6 +107,7 @@ static struct clk_hw *s3c24xx_register_clkout(struct device *dev,
 	clkout->shift = shift;
 	clkout->mask = mask;
 	clkout->hw.init = &init;
+	clkout->modify_misccr = dev->platform_data;
 
 	ret = clk_hw_register(dev, &clkout->hw);
 	if (ret)
-- 
2.20.0
