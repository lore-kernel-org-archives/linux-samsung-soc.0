From: Tomasz Figa <t.figa@samsung.com>
Subject: [RFC 4/6] pinctrl: samsung: Parse bank-specific eint offset from DT
Date: Thu, 20 Sep 2012 10:53:15 +0200
Message-ID: <1348131197-25506-5-git-send-email-t.figa@samsung.com>
References: <1348131197-25506-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58664 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753227Ab2ITIxq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 04:53:46 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAN009MV4P23OA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:53:45 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAN00DG64OWJ930@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:53:45 +0900 (KST)
In-reply-to: <1348131197-25506-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com

Some SoCs, like Exynos4x12, have non-linear layout of EINT control
registers and so current way of calculating register addresses does not
work correctly for them.

This patch adds parsing of samsung,eint-offset property from bank nodes
and uses the read values instead of calculating the offsets from bank
index.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos.c  | 5 ++---
 drivers/pinctrl/pinctrl-samsung.c | 5 +++++
 drivers/pinctrl/pinctrl-samsung.h | 1 +
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index 3cbc632..836ac36 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -146,7 +146,7 @@ static struct exynos_geint_data *exynos_get_eint_data(irq_hw_number_t hw,
 	struct samsung_pin_bank *bank = d->ctrl->pin_banks;
 	struct exynos_geint_data *eint_data;
 	unsigned int nr_banks = d->ctrl->nr_banks, idx;
-	unsigned int irq_base = 0, eint_offset = 0;
+	unsigned int irq_base = 0;
 
 	if (hw >= d->ctrl->nr_gint) {
 		dev_err(d->dev, "unsupported ext-gpio interrupt\n");
@@ -159,7 +159,6 @@ static struct exynos_geint_data *exynos_get_eint_data(irq_hw_number_t hw,
 		if ((hw >= irq_base) && (hw < (irq_base + bank->nr_pins)))
 			break;
 		irq_base += bank->nr_pins;
-		eint_offset += 4;
 	}
 
 	if (idx == nr_banks) {
@@ -175,7 +174,7 @@ static struct exynos_geint_data *exynos_get_eint_data(irq_hw_number_t hw,
 
 	eint_data->bank	= bank;
 	eint_data->pin = hw - irq_base;
-	eint_data->eint_offset = eint_offset;
+	eint_data->eint_offset = bank->eint_offset;
 	return eint_data;
 }
 
diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index ff1d001..03bf743 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -832,6 +832,11 @@ static int samsung_pinctrl_parse_dt_bank(struct samsung_pin_bank *bank,
 
 	bank->eint_type = EINT_TYPE_GPIO;
 
+	ret = of_property_read_u32(np, "samsung,eint-offset", &val);
+	if (ret)
+		return ret;
+	bank->eint_offset = val;
+
 	return 0;
 }
 
diff --git a/drivers/pinctrl/pinctrl-samsung.h b/drivers/pinctrl/pinctrl-samsung.h
index db1907c..72303f1 100644
--- a/drivers/pinctrl/pinctrl-samsung.h
+++ b/drivers/pinctrl/pinctrl-samsung.h
@@ -122,6 +122,7 @@ struct samsung_pin_bank {
 	u8		conpdn_width;
 	u8		pudpdn_width;
 	enum eint_type	eint_type;
+	u32		eint_offset;
 	u32		irq_base;
 	const char	*name;
 };
-- 
1.7.12
