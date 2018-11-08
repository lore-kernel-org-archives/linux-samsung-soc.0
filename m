From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/4] extcon: max77843: Avoid forcing UART path on drive
 probe
Date: Thu, 08 Nov 2018 14:45:45 +0100
Message-ID: <20181108134548.31140-2-m.szyprowski@samsung.com>
References: <20181108134548.31140-1-m.szyprowski@samsung.com>
        <CGME20181108134554eucas1p20df6cef615670df482e1f6c8ac4b86de@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181108134548.31140-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Driver unconditionally forces UART path during probe, probably to ensure
that one can get kernel serial log as soon as possible.

This approach causes some issues, especially when board is booted with
non-UART cable connected to micro-USB port. For example, when USB cable is
connected, UART TX/RX lines are unconditionally short-circuited to USB
D+/D- lines. This is in turn recognized by a series of serial BREAK
signals and some random characters when USB host tries to perform
enumeration procedure.

To solve the above issue and keep UART console operational as early as
possible, set UART path only when USB ID reports UART capable cable.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/extcon/extcon-max77843.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index b98cbd0362f5..a343a6ef3506 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -812,6 +812,8 @@ static int max77843_muic_probe(struct platform_device *pdev)
 	struct max77693_dev *max77843 = dev_get_drvdata(pdev->dev.parent);
 	struct max77843_muic_info *info;
 	unsigned int id;
+	int cable_type;
+	bool attached;
 	int i, ret;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
@@ -856,9 +858,19 @@ static int max77843_muic_probe(struct platform_device *pdev)
 	/* Set ADC debounce time */
 	max77843_muic_set_debounce_time(info, MAX77843_DEBOUNCE_TIME_25MS);
 
-	/* Set initial path for UART */
-	max77843_muic_set_path(info, MAX77843_MUIC_CONTROL1_SW_UART, true,
-			       false);
+	/* Set initial path for UART when JIG is connected to get serial logs */
+	ret = regmap_bulk_read(max77843->regmap_muic,
+			MAX77843_MUIC_REG_STATUS1, info->status,
+			MAX77843_MUIC_STATUS_NUM);
+	if (ret) {
+		dev_err(info->dev, "Cannot read STATUS registers\n");
+		goto err_muic_irq;
+	}
+	cable_type = max77843_muic_get_cable_type(info, MAX77843_CABLE_GROUP_ADC,
+					 &attached);
+	if (attached && cable_type == MAX77843_MUIC_ADC_FACTORY_MODE_UART_OFF)
+		max77843_muic_set_path(info, MAX77843_MUIC_CONTROL1_SW_UART,
+				       true, false);
 
 	/* Check revision number of MUIC device */
 	ret = regmap_read(max77843->regmap_muic, MAX77843_MUIC_REG_ID, &id);
-- 
2.17.1
