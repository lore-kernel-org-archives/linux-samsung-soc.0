Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB17C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 May 2022 14:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347697AbiEZOhi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 May 2022 10:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347396AbiEZOhf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 May 2022 10:37:35 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58ECD6813
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 May 2022 07:37:30 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id gh17so3422730ejc.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 May 2022 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j0PQ9KvLcDyhGe/3AHaycqSIR9icXjVWVlUf+JYxn18=;
        b=ERm27+39gtNECxQMYFX5EkW3ltwET1+2QLwXKG10T6xvWxBHHxrlFqCWX3PptaiPXg
         Otbc2egol/N+bCdp22qnTPAiTop/KSIiuRi2pW/Qyugyy8Eb0LWGNet2rKcY54LDmpyC
         GSGV/P5YYmV2gciXxlUxFxehFmYZsYOKWxW9ygr0XX9s/v11mVMJMr+VFRXjPcasdTaC
         7nitZtcw4E5HimUb9YTQS49PwBD3b0mgqoMWsJpbadGOygjkDROVl7u52ACrO8Vr4ZxE
         T89UCdcpRqdZk9w5hiu3x/k9PIWTTkg/wE8UNH7pCm4HOlK93XkeOXMpYrmvZdYdMtWl
         U85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j0PQ9KvLcDyhGe/3AHaycqSIR9icXjVWVlUf+JYxn18=;
        b=stP2RzLwT+K7dAD4H3d80GY9xaz1ZA4IQZvrD6L3Ce11GkNA0cv9I0NcxyNgi/vAnq
         TgV3ixcjYJ7KLqRC2Es0U5VZg/5PIK7q/w8vV1OlU5/mjFxV46ua/vbd3Wof9bV2f//4
         M8yjNI9+h3qWOG3ck+zO6hG6HCUCuwI6AbOWYoJ/4lbkNFCFvRhbL19frhXVzaMeVlbe
         pgLhBl4w1G92yIQ/uOjVPB9PdNNrlqUqEkE8KyGC6nvfALA2MFJUWSjvLps0DtzKdXIK
         7D7IufBrrxSE9LXr5hVTfqf6HJvEQAefxJuRG3UOD3vtRqAlDjk9E6xLUkxq1okwbO70
         PQag==
X-Gm-Message-State: AOAM531XHxgcJvXGYIJ2jUevO8QvJ1cpi7sOuvPSrpemWQhzrJcJImV0
        nVjuSshyYUMcA5wdV+BtjbCXww==
X-Google-Smtp-Source: ABdhPJz0TGEj4D8JCwSgEF4ZkDJuijpUzGCx6tNkMnvHxE5o9H5mGyw//NzbhGFp79EzYVL9MUj2+A==
X-Received: by 2002:a17:906:b048:b0:6fe:be4a:3ecf with SMTP id bj8-20020a170906b04800b006febe4a3ecfmr23471529ejb.104.1653575849408;
        Thu, 26 May 2022 07:37:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f27-20020a50a6db000000b0042be2dfa8bdsm267962edc.81.2022.05.26.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 07:37:28 -0700 (PDT)
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
Subject: [PATCH 7/7] dt-bindings: pinctrl: deprecate header with register constants
Date:   Thu, 26 May 2022 16:37:07 +0200
Message-Id: <20220526143707.767490-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526143707.767490-1-krzysztof.kozlowski@linaro.org>
References: <20220526143707.767490-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

For convenience (less code duplication, some meaning added to raw
number), the pin controller pin configuration register values
were defined in the bindings header.  These are not some IDs or other
abstraction layer but raw numbers used in the registers

These constants do not fit the purpose of bindings.  They do not provide
any abstraction, any hardware and driver independent ID.  With minor
exceptions, the Linux drivers actually do not use the bindings header at
all.

All of the constants were moved already to headers local to DTS
(residing in DTS directory), so remove any references to the bindings
header and add a warning tha tit is deprecated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 6 ++----
 drivers/pinctrl/samsung/pinctrl-exynos.h  | 3 +++
 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 +---
 drivers/pinctrl/samsung/pinctrl-samsung.h | 8 ++++++++
 include/dt-bindings/pinctrl/samsung.h     | 3 +++
 5 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 6d7ca1758292..a8212fc126bf 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -27,8 +27,6 @@
 #include <linux/soc/samsung/exynos-pmu.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 
-#include <dt-bindings/pinctrl/samsung.h>
-
 #include "pinctrl-samsung.h"
 #include "pinctrl-exynos.h"
 
@@ -173,7 +171,7 @@ static int exynos_irq_request_resources(struct irq_data *irqd)
 
 	con = readl(bank->pctl_base + reg_con);
 	con &= ~(mask << shift);
-	con |= EXYNOS_PIN_FUNC_EINT << shift;
+	con |= EXYNOS_PIN_CON_FUNC_EINT << shift;
 	writel(con, bank->pctl_base + reg_con);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
@@ -196,7 +194,7 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
 
 	con = readl(bank->pctl_base + reg_con);
 	con &= ~(mask << shift);
-	con |= EXYNOS_PIN_FUNC_INPUT << shift;
+	con |= PIN_CON_FUNC_INPUT << shift;
 	writel(con, bank->pctl_base + reg_con);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index bfad1ced8017..7bd6d82c9f36 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -16,6 +16,9 @@
 #ifndef __PINCTRL_SAMSUNG_EXYNOS_H
 #define __PINCTRL_SAMSUNG_EXYNOS_H
 
+/* Values for the pin CON register */
+#define EXYNOS_PIN_CON_FUNC_EINT	0xf
+
 /* External GPIO and wakeup interrupt related definitions */
 #define EXYNOS_GPIO_ECON_OFFSET		0x700
 #define EXYNOS_GPIO_EFLTCON_OFFSET	0x800
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 26d309d2516d..4837bceb767b 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -26,8 +26,6 @@
 #include <linux/of_device.h>
 #include <linux/spinlock.h>
 
-#include <dt-bindings/pinctrl/samsung.h>
-
 #include "../core.h"
 #include "pinctrl-samsung.h"
 
@@ -614,7 +612,7 @@ static int samsung_gpio_set_direction(struct gpio_chip *gc,
 	data = readl(reg);
 	data &= ~(mask << shift);
 	if (!input)
-		data |= EXYNOS_PIN_FUNC_OUTPUT << shift;
+		data |= PIN_CON_FUNC_OUTPUT << shift;
 	writel(data, reg);
 
 	return 0;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index fc6f5199c548..9af93e3d8d9f 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -53,6 +53,14 @@ enum pincfg_type {
 #define PINCFG_UNPACK_TYPE(cfg)		((cfg) & PINCFG_TYPE_MASK)
 #define PINCFG_UNPACK_VALUE(cfg)	(((cfg) & PINCFG_VALUE_MASK) >> \
 						PINCFG_VALUE_SHIFT)
+/*
+ * Values for the pin CON register, choosing pin function.
+ * The basic set (input and output) are same between: S3C24xx, S3C64xx, S5PV210,
+ * Exynos ARMv7, Exynos ARMv8, Tesla FSD.
+ */
+#define PIN_CON_FUNC_INPUT		0x0
+#define PIN_CON_FUNC_OUTPUT		0x1
+
 /**
  * enum eint_type - possible external interrupt types.
  * @EINT_TYPE_NONE: bank does not support external interrupts
diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index 950970634dfe..23e2ffcf6ab8 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -10,6 +10,9 @@
 #ifndef __DT_BINDINGS_PINCTRL_SAMSUNG_H__
 #define __DT_BINDINGS_PINCTRL_SAMSUNG_H__
 
+#warning "These bindings were deprecated, because they do not match the actual bindings but register values." \
+	 "Instead include the header in the DTS source directory."
+
 #define EXYNOS_PIN_PULL_NONE		0
 #define EXYNOS_PIN_PULL_DOWN		1
 #define EXYNOS_PIN_PULL_UP		3
-- 
2.34.1

