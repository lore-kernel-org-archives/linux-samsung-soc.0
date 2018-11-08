From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/4] extcon: max14577: Avoid forcing UART path on drive
 probe
Date: Thu, 08 Nov 2018 14:45:47 +0100
Message-ID: <20181108134548.31140-4-m.szyprowski@samsung.com>
References: <20181108134548.31140-1-m.szyprowski@samsung.com>
        <CGME20181108134554eucas1p26363910951ef941a3b80f47a1c0006c2@eucas1p2.samsung.com>
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
 drivers/extcon/extcon-max14577.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-max14577.c b/drivers/extcon/extcon-max14577.c
index 22d2feb1f8bc..32f663436e6e 100644
--- a/drivers/extcon/extcon-max14577.c
+++ b/drivers/extcon/extcon-max14577.c
@@ -657,6 +657,8 @@ static int max14577_muic_probe(struct platform_device *pdev)
 	struct max14577 *max14577 = dev_get_drvdata(pdev->dev.parent);
 	struct max14577_muic_info *info;
 	int delay_jiffies;
+	int cable_type;
+	bool attached;
 	int ret;
 	int i;
 	u8 id;
@@ -725,8 +727,17 @@ static int max14577_muic_probe(struct platform_device *pdev)
 	info->path_uart = CTRL1_SW_UART;
 	delay_jiffies = msecs_to_jiffies(DELAY_MS_DEFAULT);
 
-	/* Set initial path for UART */
-	max14577_muic_set_path(info, info->path_uart, true);
+	/* Set initial path for UART when JIG is connected to get serial logs */
+	ret = max14577_bulk_read(info->max14577->regmap,
+			MAX14577_MUIC_REG_STATUS1, info->status, 2);
+	if (ret) {
+		dev_err(info->dev, "Cannot read STATUS registers\n");
+		return ret;
+	}
+	cable_type = max14577_muic_get_cable_type(info, MAX14577_CABLE_GROUP_ADC,
+					 &attached);
+	if (attached && cable_type == MAX14577_MUIC_ADC_FACTORY_MODE_UART_OFF)
+		max14577_muic_set_path(info, info->path_uart, true);
 
 	/* Check revision number of MUIC device*/
 	ret = max14577_read_reg(info->max14577->regmap,
-- 
2.17.1
