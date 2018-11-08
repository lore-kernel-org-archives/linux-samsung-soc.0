From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] extcon: max77693: Avoid forcing UART path on drive
 probe
Date: Thu, 08 Nov 2018 14:45:46 +0100
Message-ID: <20181108134548.31140-3-m.szyprowski@samsung.com>
References: <20181108134548.31140-1-m.szyprowski@samsung.com>
        <CGME20181108134554eucas1p12694abede1bf0ce633d4890e2297b685@eucas1p1.samsung.com>
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
 drivers/extcon/extcon-max77693.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-max77693.c b/drivers/extcon/extcon-max77693.c
index a79537ebb671..32fc5a66ffa9 100644
--- a/drivers/extcon/extcon-max77693.c
+++ b/drivers/extcon/extcon-max77693.c
@@ -1072,6 +1072,8 @@ static int max77693_muic_probe(struct platform_device *pdev)
 	struct max77693_reg_data *init_data;
 	int num_init_data;
 	int delay_jiffies;
+	int cable_type;
+	bool attached;
 	int ret;
 	int i;
 	unsigned int id;
@@ -1212,8 +1214,18 @@ static int max77693_muic_probe(struct platform_device *pdev)
 		delay_jiffies = msecs_to_jiffies(DELAY_MS_DEFAULT);
 	}
 
-	/* Set initial path for UART */
-	 max77693_muic_set_path(info, info->path_uart, true);
+	/* Set initial path for UART when JIG is connected to get serial logs */
+	ret = regmap_bulk_read(info->max77693->regmap_muic,
+			MAX77693_MUIC_REG_STATUS1, info->status, 2);
+	if (ret) {
+		dev_err(info->dev, "failed to read MUIC register\n");
+		return ret;
+	}
+	cable_type = max77693_muic_get_cable_type(info,
+					   MAX77693_CABLE_GROUP_ADC, &attached);
+	if (attached && (cable_type == MAX77693_MUIC_ADC_FACTORY_MODE_UART_ON ||
+			 cable_type == MAX77693_MUIC_ADC_FACTORY_MODE_UART_OFF))
+		max77693_muic_set_path(info, info->path_uart, true);
 
 	/* Check revision number of MUIC device*/
 	ret = regmap_read(info->max77693->regmap_muic,
-- 
2.17.1
