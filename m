From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/4] extcon: max8997: Avoid forcing UART path on drive probe
Date: Thu, 08 Nov 2018 14:45:48 +0100
Message-ID: <20181108134548.31140-5-m.szyprowski@samsung.com>
References: <20181108134548.31140-1-m.szyprowski@samsung.com>
        <CGME20181108134555eucas1p10f126bdad7538c224d97be4f7e31e4bb@eucas1p1.samsung.com>
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
 drivers/extcon/extcon-max8997.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-max8997.c b/drivers/extcon/extcon-max8997.c
index bdabb2479e0d..632192d027bf 100644
--- a/drivers/extcon/extcon-max8997.c
+++ b/drivers/extcon/extcon-max8997.c
@@ -632,6 +632,8 @@ static int max8997_muic_probe(struct platform_device *pdev)
 	struct max8997_platform_data *pdata = dev_get_platdata(max8997->dev);
 	struct max8997_muic_info *info;
 	int delay_jiffies;
+	int cable_type;
+	bool attached;
 	int ret, i;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(struct max8997_muic_info),
@@ -724,8 +726,17 @@ static int max8997_muic_probe(struct platform_device *pdev)
 		delay_jiffies = msecs_to_jiffies(DELAY_MS_DEFAULT);
 	}
 
-	/* Set initial path for UART */
-	 max8997_muic_set_path(info, info->path_uart, true);
+	/* Set initial path for UART when JIG is connected to get serial logs */
+	ret = max8997_bulk_read(info->muic, MAX8997_MUIC_REG_STATUS1,
+				2, info->status);
+	if (ret) {
+		dev_err(info->dev, "failed to read MUIC register\n");
+		return ret;
+	}
+	cable_type = max8997_muic_get_cable_type(info,
+					   MAX8997_CABLE_GROUP_ADC, &attached);
+	if (attached && cable_type == MAX8997_MUIC_ADC_FACTORY_MODE_UART_OFF)
+		max8997_muic_set_path(info, info->path_uart, true);
 
 	/* Set ADC debounce time */
 	max8997_muic_set_debounce_time(info, ADC_DEBOUNCE_TIME_25MS);
-- 
2.17.1
