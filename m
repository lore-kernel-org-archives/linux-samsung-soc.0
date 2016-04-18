From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2] regulator: s2mps11: Set default ramp delay for S2MPS11 LDOs
Date: Mon, 18 Apr 2016 15:33:10 +0200
Message-ID: <1460986390-9674-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28841 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751560AbcDRNdl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2016 09:33:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

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

---

Changes since v1:
1. Instead of removing the implementation of .set_voltage_time_sel()
   callback, use some value from reference kernel.
---
 drivers/regulator/s2mps11.c      | 1 +
 include/linux/mfd/samsung/core.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 64a262f10845..02fb6b4ea820 100644
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
1.9.1
