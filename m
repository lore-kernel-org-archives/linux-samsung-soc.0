From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] pinctrl: samsung: Add include guard to local header
Date: Tue, 16 May 2017 22:06:48 +0200
Message-ID: <20170516200649.4730-2-krzk@kernel.org>
References: <20170516200649.4730-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170516200649.4730-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The pinctrl-exynos.h header is included only once so till now it did not
require an include guard.  However adding such is harmless and makes
code prepared for more inclusions.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index cd046eb7d705..ffad70458129 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -17,6 +17,9 @@
  * (at your option) any later version.
  */
 
+#ifndef __PINCTRL_SAMSUNG_EXYNOS_H
+#define __PINCTRL_SAMSUNG_EXYNOS_H
+
 /* External GPIO and wakeup interrupt related definitions */
 #define EXYNOS_GPIO_ECON_OFFSET		0x700
 #define EXYNOS_GPIO_EFLTCON_OFFSET	0x800
@@ -131,3 +134,5 @@ struct exynos_muxed_weint_data {
 	unsigned int nr_banks;
 	struct samsung_pin_bank *banks[];
 };
+
+#endif /* __PINCTRL_SAMSUNG_EXYNOS_H */
-- 
2.9.3
