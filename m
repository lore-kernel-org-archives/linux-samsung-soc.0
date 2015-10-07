From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 1/3] mfd: sec-core: Dump PMIC revision to find out the HW
Date: Wed, 07 Oct 2015 09:44:39 +0900
Message-ID: <1444178681-16188-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38790 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752667AbbJGApC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 20:45:02 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

There are different revisions of the same chipset. For example S2MPS13 has
more than 2 revisions. They differ slightly in regulator constraints.
Print the revision number to easily find which PMIC is used on the board.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Changs since v1:
None.
---
 drivers/mfd/sec-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 2d1137a7a0ee..589e5efc2d7f 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -253,6 +253,15 @@ static const struct regmap_config s5m8767_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
+{
+	unsigned int val;
+
+	/* For each device type, the REG_ID is always the first register */
+	if (!regmap_read(sec_pmic->regmap_pmic, S2MPS11_REG_ID, &val))
+		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", val);
+}
+
 #ifdef CONFIG_OF
 /*
  * Only the common platform data elements for s5m8767 are parsed here from the
@@ -425,6 +434,7 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 		goto err_mfd;
 
 	device_init_wakeup(sec_pmic->dev, sec_pmic->wakeup);
+	sec_pmic_dump_rev(sec_pmic);
 
 	return ret;
 
-- 
1.9.1
