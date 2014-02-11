From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 05/14] mfd: sec: Use consistent S2MPS11 RTC alarm interrupt
 indexes
Date: Tue, 11 Feb 2014 14:03:48 +0100
Message-ID: <1392123837-5517-6-git-send-email-k.kozlowski@samsung.com>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:34136 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751837AbaBKNEP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 08:04:15 -0500
In-reply-to: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The S2MPS11 RTC has two alarms: alarm0 and alarm1 (corresponding
interrupts are named similarly). Use consistent names for interrupts to
limit possible errors.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/mfd/sec-irq.c           |    8 ++++----
 include/linux/mfd/samsung/irq.h |    4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 4de494f51d40..e403c293b437 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -59,13 +59,13 @@ static const struct regmap_irq s2mps11_irqs[] = {
 		.reg_offset = 1,
 		.mask = S2MPS11_IRQ_RTC60S_MASK,
 	},
-	[S2MPS11_IRQ_RTCA1] = {
+	[S2MPS11_IRQ_RTCA0] = {
 		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA1_MASK,
+		.mask = S2MPS11_IRQ_RTCA0_MASK,
 	},
-	[S2MPS11_IRQ_RTCA2] = {
+	[S2MPS11_IRQ_RTCA1] = {
 		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA2_MASK,
+		.mask = S2MPS11_IRQ_RTCA1_MASK,
 	},
 	[S2MPS11_IRQ_SMPL] = {
 		.reg_offset = 1,
diff --git a/include/linux/mfd/samsung/irq.h b/include/linux/mfd/samsung/irq.h
index d43b4f9e7fb2..abe1a6aae3b7 100644
--- a/include/linux/mfd/samsung/irq.h
+++ b/include/linux/mfd/samsung/irq.h
@@ -24,8 +24,8 @@ enum s2mps11_irq {
 	S2MPS11_IRQ_MRB,
 
 	S2MPS11_IRQ_RTC60S,
+	S2MPS11_IRQ_RTCA0,
 	S2MPS11_IRQ_RTCA1,
-	S2MPS11_IRQ_RTCA2,
 	S2MPS11_IRQ_SMPL,
 	S2MPS11_IRQ_RTC1S,
 	S2MPS11_IRQ_WTSR,
@@ -47,7 +47,7 @@ enum s2mps11_irq {
 
 #define S2MPS11_IRQ_RTC60S_MASK		(1 << 0)
 #define S2MPS11_IRQ_RTCA1_MASK		(1 << 1)
-#define S2MPS11_IRQ_RTCA2_MASK		(1 << 2)
+#define S2MPS11_IRQ_RTCA0_MASK		(1 << 2)
 #define S2MPS11_IRQ_SMPL_MASK		(1 << 3)
 #define S2MPS11_IRQ_RTC1S_MASK		(1 << 4)
 #define S2MPS11_IRQ_WTSR_MASK		(1 << 5)
-- 
1.7.9.5
