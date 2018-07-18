From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] dt-bindings: pinctrl: samsung: Add SPDX license identifier
Date: Wed, 18 Jul 2018 22:03:50 +0200
Message-ID: <20180718200350.6590-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace GPL license statement with SPDX license identifier (GPL-2.0).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/dt-bindings/pinctrl/samsung.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index ceb672305f59..b1832506b923 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -1,14 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Samsung's Exynos pinctrl bindings
  *
  * Copyright (c) 2016 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  * Author: Krzysztof Kozlowski <krzk@kernel.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
+ */
 
 #ifndef __DT_BINDINGS_PINCTRL_SAMSUNG_H__
 #define __DT_BINDINGS_PINCTRL_SAMSUNG_H__
-- 
2.14.1
