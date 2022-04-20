Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611CDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Apr 2022 14:16:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358631AbiDTOTM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Apr 2022 10:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380236AbiDTOSo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 10:18:44 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D367945534
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Apr 2022 07:14:13 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id k23so3865391ejd.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Apr 2022 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aQ942c+7vb6/qCDUQRQxRZC5wp53vmGcX8QQSZzWOFI=;
        b=RKgHBFDDg/JiJVmQisIRJGrEpZ2E81++nBGY0N2innYsm9KQAUjV3TMkLMqjEHYVS9
         YZaFLrTh4hw6/QQOk7r+dFztN7u2F93uJ19L89b8wvGbMIGBU/WgRsT9Xhf+6OvtkVGe
         eu/aBE6k1BTjoN6Kv01mXZC1A6v9J+sIGU9BWSrr1HZdxGckhRvmqjLZVgLIF73rKxOy
         4dc+itvEHSCspXMYIEO7jA1xFgufPizM0UGXerRCyyqFicrjmJU85htg3BYMrT6fc1Z/
         wbzAeF5MTeUKVrFCBQccR90OAFB9fakXUe2+aROc6hYTv6SyqzbDyl1n7H0v8Iw0Iq7+
         /ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aQ942c+7vb6/qCDUQRQxRZC5wp53vmGcX8QQSZzWOFI=;
        b=nkg17O2C0oGPfgd7MD0cEzZC2/p0x5YLPMAauJHtHjePJi9FcCgBkv4w3Pp7UBWtOT
         KSXh3JSPlZBmbGzt+MyNc4R0qDQ/uH+05dl+DU//I1uyKydeiSvnj3UMd/0vQrDBoevq
         pfzbKr7LzqNzTBG8KEpUkBTCex8i1uayqR1RHgdsHM//56KrYTCP/EaXEDywf9Z6O4vn
         1ll/7E35w+DM6/H0qBa0i0wMomQ2HY+b7QldHVcu/gD8q4sJ3gUZUvLv/CRHs0T2dMBW
         zAj0WZ9uJ6JBG9a4CxJM77ftXY8Sb1Ixi/ecz1iUxGhG9/VcQ80rjb1hmi5gjQqxW+R+
         f/3Q==
X-Gm-Message-State: AOAM532MIA64TbKToQQ+23eC0aHUKxtXT4Na7vpYEZqkfUsitDvyf/he
        V41tIeHbbys8uN2K6O8gVRGeYQ==
X-Google-Smtp-Source: ABdhPJxp5IWPFIxb6KZ3dRafE5gv7h8/JLmZGz6bqI5HkNKyelttYLmZhMfHrNc95/3MtEr1mWRUlg==
X-Received: by 2002:a17:906:9754:b0:6da:7d72:1353 with SMTP id o20-20020a170906975400b006da7d721353mr18472378ejy.273.1650464052444;
        Wed, 20 Apr 2022 07:14:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id yy18-20020a170906dc1200b006d6e5c75029sm6635599ejb.187.2022.04.20.07.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:14:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] pinctrl: samsung: fix missing GPIOLIB on ARM64 Exynos config
Date:   Wed, 20 Apr 2022 16:14:07 +0200
Message-Id: <20220420141407.470955-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung pinctrl drivers depend on OF_GPIO, which is part of GPIOLIB.
ARMv7 Exynos platform selects GPIOLIB and Samsung pinctrl drivers. ARMv8
Exynos selects only the latter leading to possible wrong configuration
on ARMv8 build:

  WARNING: unmet direct dependencies detected for PINCTRL_EXYNOS
    Depends on [n]: PINCTRL [=y] && OF_GPIO [=n] && (ARCH_EXYNOS [=y] || ARCH_S5PV210 || COMPILE_TEST [=y])
    Selected by [y]:
    - ARCH_EXYNOS [=y]

Always select the GPIOLIB from the Samsung pinctrl drivers to fix the
issue.  This requires removing of OF_GPIO dependency (to avoid recursive
dependency), so add dependency on OF for COMPILE_TEST cases.

Reported-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Fixes: eed6b3eb20b9 ("arm64: Split out platform options to separate Kconfig")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Do not select OF_GPIO and add back dependency on OF (Arnd).

Original report:
https://bugzilla.kernel.org/show_bug.cgi?id=210047
---
 arch/arm/mach-exynos/Kconfig    |  1 -
 drivers/pinctrl/samsung/Kconfig | 11 ++++-------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 51a336f349f4..4d3b40e4049a 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -16,7 +16,6 @@ menuconfig ARCH_EXYNOS
 	select EXYNOS_PMU
 	select EXYNOS_SROM
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
-	select GPIOLIB
 	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
 	select HAVE_ARM_SCU if SMP
 	select PINCTRL
diff --git a/drivers/pinctrl/samsung/Kconfig b/drivers/pinctrl/samsung/Kconfig
index dfd805e76862..7b0576f71376 100644
--- a/drivers/pinctrl/samsung/Kconfig
+++ b/drivers/pinctrl/samsung/Kconfig
@@ -4,14 +4,13 @@
 #
 config PINCTRL_SAMSUNG
 	bool
-	depends on OF_GPIO
+	select GPIOLIB
 	select PINMUX
 	select PINCONF
 
 config PINCTRL_EXYNOS
 	bool "Pinctrl common driver part for Samsung Exynos SoCs"
-	depends on OF_GPIO
-	depends on ARCH_EXYNOS || ARCH_S5PV210 || COMPILE_TEST
+	depends on ARCH_EXYNOS || ARCH_S5PV210 || (COMPILE_TEST && OF)
 	select PINCTRL_SAMSUNG
 	select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV210)
 	select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
@@ -26,12 +25,10 @@ config PINCTRL_EXYNOS_ARM64
 
 config PINCTRL_S3C24XX
 	bool "Samsung S3C24XX SoC pinctrl driver"
-	depends on OF_GPIO
-	depends on ARCH_S3C24XX || COMPILE_TEST
+	depends on ARCH_S3C24XX || (COMPILE_TEST && OF)
 	select PINCTRL_SAMSUNG
 
 config PINCTRL_S3C64XX
 	bool "Samsung S3C64XX SoC pinctrl driver"
-	depends on OF_GPIO
-	depends on ARCH_S3C64XX || COMPILE_TEST
+	depends on ARCH_S3C64XX || (COMPILE_TEST && OF)
 	select PINCTRL_SAMSUNG
-- 
2.32.0

