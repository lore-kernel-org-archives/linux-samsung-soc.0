From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 1/4] pinctrl: Fix trivial spelling typo in a comment
Date: Thu, 16 Feb 2017 13:27:13 +0000
Message-ID: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, krzk@kernel.org
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

No changes since v1.

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
