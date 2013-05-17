From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 5/6] pinctrl: samsung: Allow per-bank SoC-specific private data
Date: Fri, 17 May 2013 18:24:31 +0200
Message-ID: <1368807872-2601-6-git-send-email-t.figa@samsung.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17618 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755803Ab3EQQZE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 12:25:04 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MMY003AFAXG67C0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 May 2013 17:25:02 +0100 (BST)
In-reply-to: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, Doug Anderson <dianders@chromium.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch extends pin bank descriptor structure with SoC-specific
private data field that allows SoC-specific drivers to store their own
private data.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-samsung.h b/drivers/pinctrl/pinctrl-samsung.h
index b316d9f..26d3519 100644
--- a/drivers/pinctrl/pinctrl-samsung.h
+++ b/drivers/pinctrl/pinctrl-samsung.h
@@ -139,6 +139,7 @@ struct samsung_pin_bank {
 	u32		eint_mask;
 	u32		eint_offset;
 	char		*name;
+	void		*soc_priv;
 	struct device_node *of_node;
 	struct samsung_pinctrl_drv_data *drvdata;
 	struct irq_domain *irq_domain;
-- 
1.8.2.1
