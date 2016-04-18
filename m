From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: s2mps11: Set default ramp delay for S2MPS11 LDOs" to the regulator tree
Date: Mon, 18 Apr 2016 20:04:05 +0100
Message-ID: <E1asESr-0006jg-Ln@debutante>
References: <1460986390-9674-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460986390-9674-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   regulator: s2mps11: Set default ramp delay for S2MPS11 LDOs

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 94be46b9e5e2954b6d5962750f8aae8b5f099baa Mon Sep 17 00:00:00 2001
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Date: Mon, 18 Apr 2016 15:33:10 +0200
Subject: [PATCH] regulator: s2mps11: Set default ramp delay for S2MPS11 LDOs

Driver did not provide default value for ramp delay for LDOs which lead
to warning in dmesg, e.g. on Odroid XU4:

[    1.486076] vdd_ldo9: ramp_delay not set
[    1.506875] vddq_mmc2: ramp_delay not set
[    1.523766] vdd_ldo15: ramp_delay not set
[    1.544702] vdd_sd: ramp_delay not set

The datasheet for all the S2MPS1x family is inconsistent here and does
not specify unambiguously the value of ramp delay for LDO. It mentions
30 mV/us in one timing diagram but then omits it completely in LDO
regulator characteristics table (it is specified for bucks).

However the vendor kernels for Galaxy S5 and Odroid XU3 use values of 12
mV/us or 24 mV/us.

Without the ramp delay value the consumers do not wait for voltage
settle after changing it. Although the proper value of ramp delay for
LDOs is unknown, it seems safer to use at least some value from
reference kernel than to leave it unset.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/s2mps11.c      | 1 +
 include/linux/mfd/samsung/core.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 46e5a2922c4d..47c7de8f39e9 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -267,6 +267,7 @@ static struct regulator_ops s2mps11_buck_ops = {
 	.ops		= &s2mps11_ldo_ops,		\
 	.type		= REGULATOR_VOLTAGE,		\
 	.owner		= THIS_MODULE,			\
+	.ramp_delay	= RAMP_DELAY_12_MVUS,		\
 	.min_uV		= MIN_800_MV,			\
 	.uV_step	= step,				\
 	.n_voltages	= S2MPS11_LDO_N_VOLTAGES,	\
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 6bc4bcd488ac..5a23dd4df432 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -30,6 +30,9 @@
 #define MIN_600_MV		600000
 #define MIN_500_MV		500000
 
+/* Ramp delay in uV/us */
+#define RAMP_DELAY_12_MVUS	12000
+
 /* Macros to represent steps for LDO/BUCK */
 #define STEP_50_MV		50000
 #define STEP_25_MV		25000
-- 
2.8.0.rc3
