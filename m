From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 5/6] pinctrl: samsung: Handle banks with two configuration registers
Date: Mon, 18 Mar 2013 22:31:54 +0100
Message-ID: <1363642315-10331-6-git-send-email-tomasz.figa@gmail.com>
References: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:58041 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757049Ab3CRVcR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 17:32:17 -0400
Received: by mail-ee0-f49.google.com with SMTP id d41so2775334eek.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Mar 2013 14:32:16 -0700 (PDT)
In-Reply-To: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>

This patch adds support for banks that have more than one function
configuration registers, e.g. some of the banks of S3C64xx SoCs.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index 45a9939..b738b7b 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -303,6 +303,11 @@ static void samsung_pinmux_setup(struct pinctrl_dev *pctldev, unsigned selector,
 		type = bank->type;
 		mask = (1 << type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 		shift = pin_offset * type->fld_width[PINCFG_TYPE_FUNC];
+		if (shift >= 32) {
+			/* Some banks have two config registers */
+			shift -= 32;
+			reg += 4;
+		}
 
 		spin_lock_irqsave(&bank->slock, flags);
 
@@ -356,6 +361,11 @@ static int samsung_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 
 	mask = (1 << type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 	shift = pin_offset * type->fld_width[PINCFG_TYPE_FUNC];
+	if (shift >= 32) {
+		/* Some banks have two config registers */
+		shift -= 32;
+		reg += 4;
+	}
 
 	spin_lock_irqsave(&bank->slock, flags);
 
-- 
1.8.1.5
