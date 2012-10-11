From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 07/15] pinctrl: samsung: Match pin banks with their device nodes
Date: Thu, 11 Oct 2012 10:11:13 +0200
Message-ID: <1349943081-27939-8-git-send-email-t.figa@samsung.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12510 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932177Ab2JKIMG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 04:12:06 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBP005P8YRAMOI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:12:05 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBP005FVYR04E50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:12:05 +0900 (KST)
In-reply-to: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch is a preparation for converting the pinctrl-samsung driver to
one GPIO chip and IRQ domain per bank. It binds banks defined by
internal driver data with bank nodes in device tree.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 13 +++++++++++++
 drivers/pinctrl/pinctrl-samsung.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index 94e1378..f266710 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -794,6 +794,7 @@ static struct samsung_pin_ctrl *samsung_pinctrl_get_soc_data(
 	int id;
 	const struct of_device_id *match;
 	const struct device_node *node = pdev->dev.of_node;
+	struct device_node *np;
 	struct samsung_pin_ctrl *ctrl;
 	struct samsung_pin_bank *bank;
 	int i;
@@ -816,6 +817,18 @@ static struct samsung_pin_ctrl *samsung_pinctrl_get_soc_data(
 		}
 	}
 
+	for_each_child_of_node(node, np) {
+		if (!of_find_property(np, "gpio-controller", NULL))
+			continue;
+		bank = ctrl->pin_banks;
+		for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
+			if (!strcmp(bank->name, np->name)) {
+				bank->of_node = np;
+				break;
+			}
+		}
+	}
+
 	ctrl->base = pin_base;
 	pin_base += ctrl->nr_pins;
 
diff --git a/drivers/pinctrl/pinctrl-samsung.h b/drivers/pinctrl/pinctrl-samsung.h
index b895693..5c53f32 100644
--- a/drivers/pinctrl/pinctrl-samsung.h
+++ b/drivers/pinctrl/pinctrl-samsung.h
@@ -111,6 +111,7 @@ struct samsung_pinctrl_drv_data;
  * @eint_type: type of the external interrupt supported by the bank.
  * @irq_base: starting controller local irq number of the bank.
  * @name: name to be prefixed for each pin in this pin bank.
+ * @of_node: OF node of the bank.
  */
 struct samsung_pin_bank {
 	u32		pctl_offset;
@@ -124,6 +125,7 @@ struct samsung_pin_bank {
 	enum eint_type	eint_type;
 	u32		irq_base;
 	char		*name;
+	struct device_node *of_node;
 };
 
 /**
-- 
1.7.12
