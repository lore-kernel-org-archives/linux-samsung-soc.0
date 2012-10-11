From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 01/15] pinctrl: samsung: Detect and handle unsupported
 configuration types
Date: Thu, 11 Oct 2012 10:11:07 +0200
Message-ID: <1349943081-27939-2-git-send-email-t.figa@samsung.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12395 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932131Ab2JKILm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 04:11:42 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBP005P8YRAMOI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:11:38 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBP005FVYR04E50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:11:38 +0900 (KST)
In-reply-to: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch modifies the pinctrl-samsung driver to detect when width of a
bit field is set to zero (which means that such configuraton type is not
supported) and return an error instead of trying to modify an inexistent
register.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index dd108a9..c660fa5 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -391,6 +391,9 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pctldev, unsigned int pin,
 		return -EINVAL;
 	}
 
+	if (!width)
+		return -EINVAL;
+
 	mask = (1 << width) - 1;
 	shift = pin_offset * width;
 	data = readl(reg_base + cfg_reg);
-- 
1.7.12
