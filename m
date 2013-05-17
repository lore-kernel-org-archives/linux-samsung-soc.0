From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/6] pinctrl: samsung: Add support for SoC-specific
 suspend/resume callbacks
Date: Fri, 17 May 2013 18:24:30 +0200
Message-ID: <1368807872-2601-5-git-send-email-t.figa@samsung.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44235 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755950Ab3EQQZD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 12:25:03 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MMY009ZMAXN4WA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 May 2013 17:25:01 +0100 (BST)
In-reply-to: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, Doug Anderson <dianders@chromium.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

SoC-specific driver might require additional save and restore of
registers. This patch adds pair of SoC-specific callbacks per pinctrl
device to account for this.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 6 ++++++
 drivers/pinctrl/pinctrl-samsung.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index 15db258..63ac22e 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -1010,6 +1010,9 @@ static void samsung_pinctrl_suspend_dev(
 				 reg, bank->pm_save[PINCFG_TYPE_FUNC]);
 		}
 	}
+
+	if (ctrl->suspend)
+		ctrl->suspend(drvdata);
 }
 
 /**
@@ -1026,6 +1029,9 @@ static void samsung_pinctrl_resume_dev(struct samsung_pinctrl_drv_data *drvdata)
 	void __iomem *virt_base = drvdata->virt_base;
 	int i;
 
+	if (ctrl->resume)
+		ctrl->resume(drvdata);
+
 	for (i = 0; i < ctrl->nr_banks; i++) {
 		struct samsung_pin_bank *bank = &ctrl->pin_banks[i];
 		void __iomem *reg = virt_base + bank->pctl_offset;
diff --git a/drivers/pinctrl/pinctrl-samsung.h b/drivers/pinctrl/pinctrl-samsung.h
index 9f5cc81..b316d9f 100644
--- a/drivers/pinctrl/pinctrl-samsung.h
+++ b/drivers/pinctrl/pinctrl-samsung.h
@@ -187,6 +187,9 @@ struct samsung_pin_ctrl {
 
 	int		(*eint_gpio_init)(struct samsung_pinctrl_drv_data *);
 	int		(*eint_wkup_init)(struct samsung_pinctrl_drv_data *);
+	void		(*suspend)(struct samsung_pinctrl_drv_data *);
+	void		(*resume)(struct samsung_pinctrl_drv_data *);
+
 	char		*label;
 };
 
-- 
1.8.2.1
