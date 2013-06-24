From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] pinctrl: samsung: Staticize drvdata_list
Date: Mon, 24 Jun 2013 16:50:21 +0530
Message-ID: <1372072821-22450-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:62386 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979Ab3FXLfX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Jun 2013 07:35:23 -0400
Received: by mail-pa0-f44.google.com with SMTP id lj1so10912943pab.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2013 04:35:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, t.figa@samsung.com, linus.walleij@linaro.org, sachin.kamat@linaro.org, patches@linaro.org

'drvdata_list' is used only in this file. Make it static.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/pinctrl/pinctrl-samsung.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index 0a6c720..a7fa9e2 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -50,7 +50,7 @@ static struct pin_config {
 };
 
 /* Global list of devices (struct samsung_pinctrl_drv_data) */
-LIST_HEAD(drvdata_list);
+static LIST_HEAD(drvdata_list);
 
 static unsigned int pin_base;
 
-- 
1.7.9.5
