Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D19C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 20:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242489AbiAKUPY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 15:15:24 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37746
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242528AbiAKUPW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 15:15:22 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AE7BC4004D
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 20:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932120;
        bh=0E8C+Rn44ME6Cw5HlKSiXCVhNrRzFh1mSIEr4Fb5X7A=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=GeQvz0QBQzZUNli3t9c57z12TFJ6gg/DmcH4b2zkQRb0tjcJeX8TupFsq1agtec4X
         BFj1Vxxm7q1m5+iv7HKaAEnWwnEJ+rtSS4gHeBPWuI1HmIVCSLuF0a869GzZCZpmOo
         HBBNNTxkV5EScT2uGhtTuuIYggra65JYtPI0gQFCR7cI6rrD2twSb/fHxNFdGVGXYQ
         PFcQu+V8OjJUUIXET5pwuClUNjpxWf40La9w0DZqW+xJEVyzahE6YELzXTzJLLPu3I
         /4+zEqgIba+nqx6CUgij0KqaS1NvhZMaTqiHrGW0eq+7Q/BUdDrhqjlBpIqyqBl3cl
         Kr3FLO02UxfWg==
Received: by mail-ed1-f69.google.com with SMTP id j10-20020a05640211ca00b003ff0e234fdfso243450edw.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 12:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0E8C+Rn44ME6Cw5HlKSiXCVhNrRzFh1mSIEr4Fb5X7A=;
        b=boUCn7YQjzrau7//OkSbUPRZRxsyB/gg6iIlaJfQ+FXPkNdyafBO2WzyUgiiugT2HH
         c01M4mDBIkmYL6mXli/m3PoTazg5TqwEboZ+BPZfLla0cHB6Te1tLPNY2kG5DqyMqIAF
         EQZx+/ShEgJNa2T+inc1jTSIxmJYZPS76UW+2s5iRquMALietxmj9j4kpl3j/1FZbUAq
         1iFbJmMvGPs6gxU9FjtMK2JjPkUCm+zmTini9KYucTHYd0MU49V8xWlUVQseK1KUsdH6
         /sCPWuA3SstS7mEWosQzzgAWOK+hE9BPe6yWXRwI/18vZ15r1WgmGWjIYT4D7yzGCjSd
         w2Kg==
X-Gm-Message-State: AOAM530tCRWSQ0A6rIT07xad5tVKO3nJe1Xoc4ybAYUiAykjn0c4Bljh
        yDhM0rF9moNB89vb9Pd0y9GP8kXyFEpyjjCxeaneR9K24M6MH0XSC4MeW0//I3ROPfFCQe/R2ey
        93UY13vl1uPFlruw3fQqo5U7Y8sz6qqFsNBvOdGjBDjZiu3Dp
X-Received: by 2002:a05:6402:27d1:: with SMTP id c17mr5816276ede.128.1641932120315;
        Tue, 11 Jan 2022 12:15:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxmKnh6k/r5saDaFnr23ktoJ0Yoax352pKuEdFGzGl6uMI2aNb5xw/3cVDNKUongBZpE21yw==
X-Received: by 2002:a05:6402:27d1:: with SMTP id c17mr5816269ede.128.1641932120133;
        Tue, 11 Jan 2022 12:15:20 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f23sm3852212ejj.128.2022.01.11.12.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:15:19 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 03/28] ARM: dts: exynos: drop unused pinctrl defines in Exynos3250
Date:   Tue, 11 Jan 2022 21:14:01 +0100
Message-Id: <20220111201426.326777-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The PIN_OUT/PIN_OUT_SET/PIN_CFG defines for pin controller pin
configuration are not used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 25 -----------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
index dff3c6e3aa1f..a616cb1aca29 100644
--- a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
@@ -19,31 +19,6 @@ _pin {								\
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_ ##_drv>;		\
 	}
 
-#define PIN_OUT(_pin, _drv)						\
-	_pin {								\
-		samsung,pins = #_pin;					\
-		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;	\
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;		\
-		samsung,pin-drv = <EXYNOS4_PIN_DRV_ ##_drv>;		\
-	}
-
-#define PIN_OUT_SET(_pin, _val, _drv)					\
-	_pin {								\
-		samsung,pins = #_pin;					\
-		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;	\
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;		\
-		samsung,pin-drv = <EXYNOS4_PIN_DRV_ ##_drv>;		\
-		samsung,pin-val = <_val>;				\
-	}
-
-#define PIN_CFG(_pin, _sel, _pull, _drv)				\
-	_pin {								\
-		samsung,pins = #_pin;					\
-		samsung,pin-function = <_sel>;				\
-		samsung,pin-pud = <EXYNOS_PIN_PULL_ ##_pull>;		\
-		samsung,pin-drv = <EXYNOS4_PIN_DRV_ ##_drv>;		\
-	}
-
 #define PIN_SLP(_pin, _mode, _pull)					\
 	_pin {								\
 		samsung,pins = #_pin;					\
-- 
2.32.0

