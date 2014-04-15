From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 2/3] mfd: tps65090: Stop caching registers
Date: Tue, 15 Apr 2014 13:14:35 -0700
Message-ID: <1397592876-5741-3-git-send-email-dianders@chromium.org>
References: <1397592876-5741-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397592876-5741-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <anton@enomsg.org>
Cc: Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, ajaykumar.rs@samsung.com, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Nearly all of the registers in tps65090 combine control bits and
status bits.  Turn off caching of registers so that we can read status
bits reliably.

NOTE: the IRQnMASK and CG_CTRLn registers are the exception and could
be cached.  If we find that we spend a lot of time reading those we
can turn on cache for just those registers.

Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 drivers/mfd/tps65090.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index c3cddb4..4cfdd07 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -149,21 +149,11 @@ static struct regmap_irq_chip tps65090_irq_chip = {
 	.mask_invert = true,
 };
 
-static bool is_volatile_reg(struct device *dev, unsigned int reg)
-{
-	if ((reg == TPS65090_INT_STS) || (reg == TPS65090_INT_STS2))
-		return true;
-	else
-		return false;
-}
-
 static const struct regmap_config tps65090_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = TOTAL_NUM_REG,
 	.num_reg_defaults_raw = TOTAL_NUM_REG,
-	.cache_type = REGCACHE_RBTREE,
-	.volatile_reg = is_volatile_reg,
 };
 
 #ifdef CONFIG_OF
-- 
1.9.1.423.g4596e3a
