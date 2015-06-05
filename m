From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH] extcon: max77843: Clear IRQ bits state before request IRQ
Date: Fri, 05 Jun 2015 13:32:27 +0900
Message-ID: <1433478747-12254-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

IRQ signal before driver probe is needless because driver sends
current state after platform booting done.
So, this patch clears MUIC IRQ bits before request IRQ.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 drivers/extcon/extcon-max77843.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index d78a64d..11e09d1 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -781,6 +781,15 @@ static int max77843_muic_probe(struct platform_device *pdev)
 	/* Support virtual irq domain for max77843 MUIC device */
 	INIT_WORK(&info->irq_work, max77843_muic_irq_work);
 
+	/* Clear IRQ bits before request IRQs */
+	ret = regmap_bulk_read(max77843->regmap_muic,
+			MAX77843_MUIC_REG_INT1, info->status,
+			MAX77843_MUIC_IRQ_NUM);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to Clear IRQ bits\n");
+		goto err_muic_irq;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(max77843_muic_irqs); i++) {
 		struct max77843_muic_irq *muic_irq = &max77843_muic_irqs[i];
 		unsigned int virq = 0;
-- 
1.7.9.5
