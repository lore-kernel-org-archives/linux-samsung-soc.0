From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 06/14] pinctrl: samsung: use CONFIG_PINCTRL_SAMSUNG symbol in
 makefile
Date: Wed, 27 Aug 2014 15:18:09 +0530
Message-ID: <1409132889-2080-6-git-send-email-ch.naveen@samsung.com>
References: <1409132889-2080-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34111 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933090AbaH0Jwq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 05:52:46 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NAY002B5M3XIT10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Aug 2014 18:52:45 +0900 (KST)
In-reply-to: <1409132889-2080-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, cpgs@samsung.com, Tomasz Figa <t.figa@samsung.com>, linus.walleij@linaro.org, Thomas Abraham <thomas.ab@samsung.com>

Samsung Exynos7 is a ARM64bit processor. Which does not select
the CONFIG_PLAT_SAMSUNG symbol. CONFIG_PINCTRL_SAMSUNG is being
selected for both PLAT_SAMSUNG and ARCH_EXYNOS7 symbols.

This patch modifes the pinctrl/Makefile to use
CONFIG_PINCTRL_SAMSUNG symbol to compile the pinctrl/samsung/*.c

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>
Cc: linus.walleij@linaro.org
Cc: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/pinctrl/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 05d2275..801777e 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -58,7 +58,7 @@ obj-$(CONFIG_ARCH_BERLIN)	+= berlin/
 obj-$(CONFIG_PLAT_ORION)        += mvebu/
 obj-y				+= nomadik/
 obj-$(CONFIG_ARCH_QCOM)		+= qcom/
-obj-$(CONFIG_PLAT_SAMSUNG)	+= samsung/
+obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
 obj-$(CONFIG_ARCH_SHMOBILE)	+= sh-pfc/
 obj-$(CONFIG_SUPERH)		+= sh-pfc/
 obj-$(CONFIG_PLAT_SPEAR)	+= spear/
-- 
1.7.9.5
