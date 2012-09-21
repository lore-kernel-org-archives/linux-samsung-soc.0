From: Tomasz Figa <t.figa@samsung.com>
Subject: [RFC PATCH 1/6] pinctrl: samsung: Hold OF node of pin bank in bank
 struct
Date: Fri, 21 Sep 2012 16:22:52 +0200
Message-ID: <1348237377-21299-2-git-send-email-t.figa@samsung.com>
References: <1348237377-21299-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49926 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753113Ab2IUOYA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 10:24:00 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAP006QLEMV2O50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Sep 2012 23:23:26 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAP0020KEMM3N30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Sep 2012 23:23:26 +0900 (KST)
In-reply-to: <1348237377-21299-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

The node pointer will be used in extensions added by patches that will
follow.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 2 ++
 drivers/pinctrl/pinctrl-samsung.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index 03bf743..846b277 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -825,6 +825,8 @@ static int samsung_pinctrl_parse_dt_bank(struct samsung_pin_bank *bank,
 	if (!ret)
 		bank->pudpdn_width = val;
 
+	bank->of_node = np;
+
 	if (!of_find_property(np, "interrupt-controller", NULL)) {
 		bank->eint_type = EINT_TYPE_NONE;
 		return 0;
diff --git a/drivers/pinctrl/pinctrl-samsung.h b/drivers/pinctrl/pinctrl-samsung.h
index 72303f1..b7b74cc 100644
--- a/drivers/pinctrl/pinctrl-samsung.h
+++ b/drivers/pinctrl/pinctrl-samsung.h
@@ -111,6 +111,7 @@ struct samsung_pinctrl_drv_data;
  * @eint_type: type of the external interrupt supported by the bank.
  * @irq_base: starting controller local irq number of the bank.
  * @name: name to be prefixed for each pin in this pin bank.
+ * @of_node: node of pin bank in device tree
  */
 struct samsung_pin_bank {
 	u32		pctl_offset;
@@ -125,6 +126,8 @@ struct samsung_pin_bank {
 	u32		eint_offset;
 	u32		irq_base;
 	const char	*name;
+
+	struct device_node *of_node;
 };
 
 /**
-- 
1.7.12
