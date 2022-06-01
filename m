Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25BDCCA47A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Jun 2022 15:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355601AbiFAP2L (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Jun 2022 11:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355549AbiFAP2J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Jun 2022 11:28:09 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54626527FA
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jun 2022 08:27:57 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id rq11so4531137ejc.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jun 2022 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xkCtDUW8KDmXB613fVyiMXB2YkEaxXKxwnsWXEUT47c=;
        b=XiP4K+OXtb2g0sAVbW0Ke2qwQoraPZr10w0/Vtq1k4TkIRE0u3eyrJjQZe43kL6Dav
         0ZSeFadD2rPMIK9nkZSwaTUvt+Q59JnKkGT11v0vjEoD+RkBhgviiwz3JeBREIrYzweG
         dZls+QHYfxbcxzOvNqXjFjTfr5pqWXEfs6MMiSc+blzO213hf7lxfAUUCqRuaCKANMf9
         aftTQse8lDSa7syQNh+PcCG2f2+STlqhkbE5z70DLnPpxzLPCXd9twT1Hyl3IIidxKKA
         xgQ34hV625zUna8caTadBULW8PNRR1iTxczINECy+2bzW704DGgWqQF8mvAMYO0Ay1WC
         cT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xkCtDUW8KDmXB613fVyiMXB2YkEaxXKxwnsWXEUT47c=;
        b=WHOBn4xyebGBGIOoTLNSQ6dsHAhvF6nNFuFBt8kAy+ULkPIkoO5/f+8IbWjX/COJNt
         w6BfDHQe1RpwIZwy//KPYR13f7Z/r4DNep6rnUzpVTbZ6GWJN4qnC5L6lNbNA4AaFj09
         +gROJjm5QTzhRs9zsIZXGQ1jQ4Od9JJh3mVouMq1F7hm4IJyaHEI9K8KHVO6ZP7NuOPm
         xo8cTxQkvn/b2sx/B9dA+XhX+j2GlArIrWexQyDb4ZNfpEq54R9qBSN0S1s9QrkGX25X
         l/Td7vGdV3IQcpE5Pe77aqhAf/z0hLU97I89sisWKfJ86X+pC/lX8K7FlK0r8Oy389C2
         ztAw==
X-Gm-Message-State: AOAM533UMZcK+eWhdCcErVJ4CbURYJuZI3a/1wLJSqtwInxgj7NS9VzQ
        CKVGIl8JyrYvvEDco7wTj0poVA==
X-Google-Smtp-Source: ABdhPJzGUdJeCPAq3rdMERlG9nMzXccLGpPuKiSoDNm457/XviI9WvS5F1tm5ZIc1Ggy5IZD4IwCFg==
X-Received: by 2002:a17:907:1690:b0:6f5:40d:f4bb with SMTP id hc16-20020a170907169000b006f5040df4bbmr25515ejc.495.1654097275757;
        Wed, 01 Jun 2022 08:27:55 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e13-20020a170906248d00b006fee7b5dff2sm845870ejb.143.2022.06.01.08.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:27:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/7] ARM: dts: exynos: use local header for pinctrl register values
Date:   Wed,  1 Jun 2022 17:27:17 +0200
Message-Id: <20220601152720.232383-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601152720.232383-1-krzysztof.kozlowski@linaro.org>
References: <20220601152720.232383-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The DTS uses hardware register values directly in pin controller pin
configuration.  These are not some IDs or other abstraction layer but
raw numbers used in the registers.

These numbers were previously put in the bindings header to avoid code
duplication and to provide some context meaning (name), but they do not
fit the purpose of bindings.

Store the constants in a header next to DTS and use them instead of
bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos-pinctrl.h        | 55 +++++++++++++++++++++++
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi |  2 +-
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi |  2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi   |  3 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi  |  2 +-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi |  2 +-
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi |  2 +-
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi |  2 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi |  2 +-
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi |  2 +-
 10 files changed, 65 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos-pinctrl.h

diff --git a/arch/arm/boot/dts/exynos-pinctrl.h b/arch/arm/boot/dts/exynos-pinctrl.h
new file mode 100644
index 000000000000..e3a6df95281c
--- /dev/null
+++ b/arch/arm/boot/dts/exynos-pinctrl.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Samsung Exynos DTS pinctrl constants
+ *
+ * Copyright (c) 2016 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ * Copyright (c) 2022 Linaro Ltd
+ * Author: Krzysztof Kozlowski <krzk@kernel.org>
+ */
+
+#ifndef __DTS_ARM_SAMSUNG_EXYNOS_PINCTRL_H__
+#define __DTS_ARM_SAMSUNG_EXYNOS_PINCTRL_H__
+
+#define EXYNOS_PIN_PULL_NONE		0
+#define EXYNOS_PIN_PULL_DOWN		1
+#define EXYNOS_PIN_PULL_UP		3
+
+/* Pin function in power down mode */
+#define EXYNOS_PIN_PDN_OUT0		0
+#define EXYNOS_PIN_PDN_OUT1		1
+#define EXYNOS_PIN_PDN_INPUT		2
+#define EXYNOS_PIN_PDN_PREV		3
+
+/* Drive strengths for Exynos3250, Exynos4 (all) and Exynos5250 */
+#define EXYNOS4_PIN_DRV_LV1		0
+#define EXYNOS4_PIN_DRV_LV2		2
+#define EXYNOS4_PIN_DRV_LV3		1
+#define EXYNOS4_PIN_DRV_LV4		3
+
+/* Drive strengths for Exynos5260 */
+#define EXYNOS5260_PIN_DRV_LV1		0
+#define EXYNOS5260_PIN_DRV_LV2		1
+#define EXYNOS5260_PIN_DRV_LV4		2
+#define EXYNOS5260_PIN_DRV_LV6		3
+
+/*
+ * Drive strengths for Exynos5410, Exynos542x, Exynos5800 and Exynos850 (except
+ * GPIO_HSI block)
+ */
+#define EXYNOS5420_PIN_DRV_LV1		0
+#define EXYNOS5420_PIN_DRV_LV2		1
+#define EXYNOS5420_PIN_DRV_LV3		2
+#define EXYNOS5420_PIN_DRV_LV4		3
+
+#define EXYNOS_PIN_FUNC_INPUT		0
+#define EXYNOS_PIN_FUNC_OUTPUT		1
+#define EXYNOS_PIN_FUNC_2		2
+#define EXYNOS_PIN_FUNC_3		3
+#define EXYNOS_PIN_FUNC_4		4
+#define EXYNOS_PIN_FUNC_5		5
+#define EXYNOS_PIN_FUNC_6		6
+#define EXYNOS_PIN_FUNC_EINT		0xf
+#define EXYNOS_PIN_FUNC_F		EXYNOS_PIN_FUNC_EINT
+
+#endif /* __DTS_ARM_SAMSUNG_EXYNOS_PINCTRL_H__ */
diff --git a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
index cc30d154ec94..011ba2eff29e 100644
--- a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
@@ -9,7 +9,7 @@
  * tree nodes are listed in this file.
  */
 
-#include <dt-bindings/pinctrl/samsung.h>
+#include "exynos-pinctrl.h"
 
 #define PIN_IN(_pin, _pull, _drv)					\
 	pin- ## _pin {							\
diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
index 6373009bb727..76f44ae0de46 100644
--- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
@@ -11,7 +11,7 @@
  * tree nodes are listed in this file.
  */
 
-#include <dt-bindings/pinctrl/samsung.h>
+#include "exynos-pinctrl.h"
 
 &pinctrl_0 {
 	gpa0: gpa0-gpio-bank {
diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 23f50c9be527..b967397a46c5 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -12,11 +12,12 @@
 /dts-v1/;
 #include "exynos4412.dtsi"
 #include "exynos4412-ppmu-common.dtsi"
+
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/maxim,max77686.h>
-#include <dt-bindings/pinctrl/samsung.h>
+#include "exynos-pinctrl.h"
 
 / {
 	compatible = "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
index 97f131b1014b..286a547b110e 100644
--- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
@@ -15,8 +15,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/pinctrl/samsung.h>
 #include <dt-bindings/power/summit,smb347-charger.h>
+#include "exynos-pinctrl.h"
 
 / {
 	compatible = "samsung,p4note", "samsung,exynos4412", "samsung,exynos4";
diff --git a/arch/arm/boot/dts/exynos4412-pinctrl.dtsi b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
index 88b8afd55664..58847d4fa846 100644
--- a/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
@@ -9,7 +9,7 @@
  * tree nodes are listed in this file.
  */
 
-#include <dt-bindings/pinctrl/samsung.h>
+#include "exynos-pinctrl.h"
 
 #define PIN_SLP(_pin, _mode, _pull)					\
 	_pin {								\
diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
index 918947a3897e..48732edadff1 100644
--- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
@@ -9,7 +9,7 @@
  * tree nodes are listed in this file.
  */
 
-#include <dt-bindings/pinctrl/samsung.h>
+#include "exynos-pinctrl.h"
 
 &pinctrl_0 {
 	gpa0: gpa0-gpio-bank {
diff --git a/arch/arm/boot/dts/exynos5260-pinctrl.dtsi b/arch/arm/boot/dts/exynos5260-pinctrl.dtsi
index 150607f8103d..43e4a541f479 100644
--- a/arch/arm/boot/dts/exynos5260-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5260-pinctrl.dtsi
@@ -9,7 +9,7 @@
  * tree nodes are listed in this file.
  */
 
-#include <dt-bindings/pinctrl/samsung.h>
+#include "exynos-pinctrl.h"
 
 &pinctrl_0 {
 	gpa0: gpa0-gpio-bank {
diff --git a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
index 6c7814b4372e..f7b923382892 100644
--- a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
@@ -6,7 +6,7 @@
  *              https://www.hardkernel.com
  */
 
-#include <dt-bindings/pinctrl/samsung.h>
+#include "exynos-pinctrl.h"
 
 &pinctrl_0 {
 	gpa0: gpa0-gpio-bank {
diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index 546ba274f4e5..14cf9c4ca0ed 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -9,7 +9,7 @@
  * tree nodes are listed in this file.
  */
 
-#include <dt-bindings/pinctrl/samsung.h>
+#include "exynos-pinctrl.h"
 
 &pinctrl_0 {
 	gpy7: gpy7-gpio-bank {
-- 
2.34.1

