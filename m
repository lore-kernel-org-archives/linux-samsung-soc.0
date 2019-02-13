From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH v3 2/2] mfd: sec: Add support for the RTC on S2MPA01
Date: Wed, 13 Feb 2019 22:24:02 +0000
Message-ID: <20190213222402.20541-3-stuart.menefy@mathembedded.com>
References: <20190213222402.20541-1-stuart.menefy@mathembedded.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213222402.20541-1-stuart.menefy@mathembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Stuart Menefy <stuart.menefy@mathembedded.com>
List-Id: linux-samsung-soc@vger.kernel.org

The RTC portion of the S2MPA01 appears to have the same
register layout as the S2MPS14.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 drivers/mfd/sec-core.c | 1 +
 drivers/mfd/sec-irq.c  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 5ff3fd726f9e..8a299080cb55 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -86,6 +86,7 @@ static const struct mfd_cell s2mps15_devs[] = {
 
 static const struct mfd_cell s2mpa01_devs[] = {
 	{ .name = "s2mpa01-pmic", },
+	{ .name = "s2mps14-rtc", },
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index ad0099077e7e..a98c5d165039 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -455,6 +455,9 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
+	case S2MPA01:
+		sec_irq_chip = &s2mps14_irq_chip;
+		break;
 	case S2MPS11X:
 		sec_irq_chip = &s2mps11_irq_chip;
 		break;
-- 
2.13.6
