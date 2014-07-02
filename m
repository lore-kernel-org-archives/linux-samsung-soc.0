From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 6/6] pinctrl: samsung: Allow pin value to be initialized using
 pinfunc
Date: Wed, 02 Jul 2014 17:41:04 +0200
Message-ID: <1404315664-3174-7-git-send-email-t.figa@samsung.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62987 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752249AbaGBPlm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 11:41:42 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N830062RCXDQ750@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Jul 2014 16:41:37 +0100 (BST)
In-reply-to: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

This patch extends the range of settings configurable via pinfunc API
to cover pin value as well. This allows configuration of default values
of pins, which is useful for pins that are not supposed to be used by
any dedicated driver, but need certain board-specific setting.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
 drivers/pinctrl/pinctrl-samsung.c                             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index 464b2bb..e82aaf4 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -75,6 +75,7 @@ Required Properties:
   "samsung,pins" property of the child node. The following pin configuration
   properties are supported.
 
+  - samsung,pin-val: Initial value of pin output buffer.
   - samsung,pin-pud: Pull up/down configuration.
   - samsung,pin-drv: Drive strength configuration.
   - samsung,pin-pud-pdn: Pull up/down configuration in power down mode.
diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index caa6dbe..76de677 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -47,6 +47,7 @@ static struct pin_config {
 	{ "samsung,pin-drv", PINCFG_TYPE_DRV },
 	{ "samsung,pin-con-pdn", PINCFG_TYPE_CON_PDN },
 	{ "samsung,pin-pud-pdn", PINCFG_TYPE_PUD_PDN },
+	{ "samsung,pin-val", PINCFG_TYPE_DAT },
 };
 
 /* Global list of devices (struct samsung_pinctrl_drv_data) */
-- 
1.9.3
