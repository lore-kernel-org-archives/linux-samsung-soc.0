From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 1/4] pinctrl: Fix trivial spelling typo in a comment
Date: Mon, 13 Feb 2017 10:11:03 +0000
Message-ID: <1486980666-7143-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:38140 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751479AbdBMKKN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 05:10:13 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linus.walleij@linaro.org
Cc: tomasz.figa@gmail.com, krzk@kernel.org, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d690465..0bf6392f 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -525,7 +525,7 @@ pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
 EXPORT_SYMBOL_GPL(pinctrl_find_gpio_range_from_pin);
 
 /**
- * pinctrl_remove_gpio_range() - remove a range of GPIOs fro a pin controller
+ * pinctrl_remove_gpio_range() - remove a range of GPIOs from a pin controller
  * @pctldev: pin controller device to remove the range from
  * @range: the GPIO range to remove
  */
-- 
2.1.4
