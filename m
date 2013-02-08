From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] pinctrl: samsung: remove duplicated line of
 samsung_pinctrl_register()
Date: Fri, 08 Feb 2013 14:39:30 +0900
Message-ID: <001901ce05be$aacdeb30$0069c190$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54409 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751541Ab3BHFjc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 00:39:32 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHV00M8EZOPSK60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Feb 2013 14:39:31 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHV00AMGZPUUDC0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Feb 2013 14:39:30 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>

This patch removes duplicated line of samsung_pinctrl_register(),
because the number of pins is redundantly assigned twice.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index 294bcdd..3d5cf63 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -716,7 +716,6 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 	}
 	ctrldesc->pins = pindesc;
 	ctrldesc->npins = drvdata->ctrl->nr_pins;
-	ctrldesc->npins = drvdata->ctrl->nr_pins;
 
 	/* dynamically populate the pin number and pin name for pindesc */
 	for (pin = 0, pdesc = pindesc; pin < ctrldesc->npins; pin++, pdesc++)
-- 
1.7.2.5
