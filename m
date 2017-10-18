From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] extcon: max88743: Add OTG power control to the MUIC
 driver
Date: Wed, 18 Oct 2017 11:28:01 +0200
Message-ID: <20171018092802.25390-2-m.szyprowski@samsung.com>
References: <20171018092802.25390-1-m.szyprowski@samsung.com>
        <CGME20171018092808eucas1p28a1a35b47d26687997798f68315d2a1f@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20171018092802.25390-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Enabling power on VBUS micro-usb pin is required only when passive OTG
cable is connected. Initially OTG VBUS power control was planned to be
done in charger driver. However such information is not really available
from the extcon notifications, so VBUS power control has to be done
directly in MUIC driver, which has all information about the attached
accessory.

For example SmartDock is externally powered accessory, provides OTG
(USB HOST) functionality and use VBUS pin for charging a device battery,
so the VBUS charging pump should be disabled in such case.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/extcon/extcon-max77843.c     | 16 ++++++++++++++++
 include/linux/mfd/max77843-private.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index 6e722d552cf1..217c743405f8 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -240,6 +240,21 @@ static int max77843_muic_set_path(struct max77843_muic_info *info,
 	return 0;
 }
 
+static void max77843_charger_set_otg_vbus(struct max77843_muic_info *info,
+		 bool on)
+{
+	struct max77693_dev *max77843 = info->max77843;
+	unsigned int cnfg00;
+
+	if (on)
+		cnfg00 = MAX77843_CHG_OTG_MASK | MAX77843_CHG_BOOST_MASK;
+	else
+		cnfg00 = MAX77843_CHG_ENABLE | MAX77843_CHG_BUCK_MASK;
+
+	regmap_update_bits(max77843->regmap_chg, MAX77843_CHG_REG_CHG_CNFG_00,
+			   MAX77843_CHG_MODE_MASK, cnfg00);
+}
+
 static int max77843_muic_get_cable_type(struct max77843_muic_info *info,
 		enum max77843_muic_cable_group group, bool *attached)
 {
@@ -355,6 +370,7 @@ static int max77843_muic_adc_gnd_handler(struct max77843_muic_info *info)
 			return ret;
 
 		extcon_set_state_sync(info->edev, EXTCON_USB_HOST, attached);
+		max77843_charger_set_otg_vbus(info, attached);
 		break;
 	case MAX77843_MUIC_GND_MHL_VB:
 	case MAX77843_MUIC_GND_MHL:
diff --git a/include/linux/mfd/max77843-private.h b/include/linux/mfd/max77843-private.h
index c19303b0ccfd..0223cd5941c8 100644
--- a/include/linux/mfd/max77843-private.h
+++ b/include/linux/mfd/max77843-private.h
@@ -245,10 +245,13 @@ enum max77843_irq_muic {
 #define MAX77843_CHG_OVER_CURRENT_BAT		(0x06 << 4)
 
 /* MAX77843 CHG_CNFG_00 register */
+#define MAX77843_CHG_MODE_MASK			0x0f
 #define MAX77843_CHG_DISABLE			0x00
 #define MAX77843_CHG_ENABLE			0x05
 #define MAX77843_CHG_MASK			0x01
+#define MAX77843_CHG_OTG_MASK			0x02
 #define MAX77843_CHG_BUCK_MASK			0x04
+#define MAX77843_CHG_BOOST_MASK			0x08
 
 /* MAX77843 CHG_CNFG_01 register */
 #define MAX77843_CHG_RESTART_THRESHOLD_100	0x00
-- 
2.14.2
