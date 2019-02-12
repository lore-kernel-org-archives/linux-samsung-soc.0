From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH v2] mfd: sec: Add support for the RTC on S2MPA01
Date: Tue, 12 Feb 2019 21:46:39 +0000
Message-ID: <20190212214639.9613-1-stuart.menefy@mathembedded.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Stuart Menefy <stuart.menefy@mathembedded.com>
List-Id: linux-samsung-soc@vger.kernel.org

The RTC portion of the S2MPA01 appears to have the same
register layout as the S2MPS14.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 drivers/mfd/sec-core.c | 2 ++
 drivers/mfd/sec-irq.c  | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index e0835c9df7a1..08621ef5d822 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -103,6 +103,8 @@ static const struct mfd_cell s2mps15_devs[] = {
 static const struct mfd_cell s2mpa01_devs[] = {
 	{
 		.name = "s2mpa01-pmic",
+	}, {
+		.name = "s2mps14-rtc",
 	},
 };
 
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
