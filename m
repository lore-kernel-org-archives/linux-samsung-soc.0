From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] pinctrl: samsung: Consistently use unsigned instead of u32 for nr_banks
Date: Thu, 15 Jun 2017 18:33:16 +0200
Message-ID: <20170615163316.6444-2-krzk@kernel.org>
References: <20170615163316.6444-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751803AbdFOQdq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 12:33:46 -0400
In-Reply-To: <20170615163316.6444-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Unlike for other countable members, the driver used u32 for number of
banks (nr_banks).  There is no specific need for using fixed-width
integer in this particular place.  Make it consistent.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-samsung.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 49a05f4fc37d..9af07af6cad6 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -230,7 +230,7 @@ struct samsung_retention_data {
  */
 struct samsung_pin_ctrl {
 	const struct samsung_pin_bank_data *pin_banks;
-	u32		nr_banks;
+	unsigned int	nr_banks;
 	unsigned int	nr_ext_resources;
 	const struct samsung_retention_data *retention_data;
 
@@ -275,7 +275,7 @@ struct samsung_pinctrl_drv_data {
 	unsigned int			nr_functions;
 
 	struct samsung_pin_bank		*pin_banks;
-	u32				nr_banks;
+	unsigned int			nr_banks;
 	unsigned int			pin_base;
 	unsigned int			nr_pins;
 
-- 
2.9.3
