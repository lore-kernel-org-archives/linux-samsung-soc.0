From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT v2 02/10] pinctrl: samsung: Document suspend and resume members
Date: Mon, 23 Jul 2018 19:52:54 +0200
Message-ID: <20180723175302.22535-3-krzk@kernel.org>
References: <20180723175302.22535-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723175302.22535-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, Sylwester Nawrocki <snawrocki@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add missing documentation for suspend and resume members of struct
samsung_pin_ctrl and samsung_pinctrl_drv_data.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>
Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index f0cda9424dfe..aac16cc8362a 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -223,6 +223,10 @@ struct samsung_retention_data {
  *	interrupts for the controller.
  * @eint_wkup_init: platform specific callback to setup the external wakeup
  *	interrupts for the controller.
+ * @suspend: platform specific suspend callback, executed during pin controller
+ *	device suspend, see samsung_pinctrl_suspend()
+ * @resume: platform specific resume callback, executed during pin controller
+ *	device suspend, see samsung_pinctrl_resume()
  */
 struct samsung_pin_ctrl {
 	const struct samsung_pin_bank_data *pin_banks;
@@ -255,6 +259,10 @@ struct samsung_pin_ctrl {
  * @pin_base: starting system wide pin number.
  * @nr_pins: number of pins supported by the controller.
  * @retention_ctrl: retention control runtime data.
+ * @suspend: platform specific suspend callback, executed during pin controller
+ *	device suspend, see samsung_pinctrl_suspend()
+ * @resume: platform specific resume callback, executed during pin controller
+ *	device suspend, see samsung_pinctrl_resume()
  */
 struct samsung_pinctrl_drv_data {
 	struct list_head		node;
-- 
2.14.1
