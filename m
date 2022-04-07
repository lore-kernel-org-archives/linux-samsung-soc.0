Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CD0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 07:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241718AbiDGHZY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 03:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbiDGHZX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:25:23 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B322E7A
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 00:23:23 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id i27so8925324ejd.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 00:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JQl94m0PqCXD+LGa2eBxh9FZsiEePYOtGmPb20IDP/E=;
        b=TppdCLWcbLDy2dzem71sJHOjGFmnTO1FY3CaMlApQ4NWmxBrt8yvZ+KAtA8vOI15QJ
         WYCmnd7KOTfVQ46APpH3zWrTGtlErEsbMPQFWfUTF61iSPDEufFKuLzjHQmAk+dNXfS9
         kz+xTitG0ok0Kux/HDva6OhHqGtgTeupwofSTyjwg/yKWJkE9JWhf71mnOFTtQKA533y
         ABVwMRvcMikHPjHJM8Bz4o93byNwSK6o5QJnb35XX47ndAJPaBwQyJqm18s2xzn9/fIy
         GxGPrgTWjK87S65gy/nFnacgEBuAigEHvjpZTQZ487ysl/UK8lYWoFMTYM5z9wbD/klI
         ktaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JQl94m0PqCXD+LGa2eBxh9FZsiEePYOtGmPb20IDP/E=;
        b=4hERlvHxBO99V1xIZMQdH/NGux+7o6epsxJGbsltRe5uUR6J+ESavszP/wS86rxNTA
         cl9Yu1oX2Ou1ZUtpB/rl+tp1oAW5PeZF2kkyMD8xXA7XZWy6BMo4JaNRnAtCYCROeo0I
         mVfCi/5pdEgo3mhKKO4L1KdWr3p1/L7gz4QwHtWobTRyMfFokIT/lu+2MPm67k0+Fv7J
         9/4TMzchU/M/p1furfCDc3ACMpExEnLr9pZ4L4tAZpf/Mh5a36GxAbPAG+0M3FSQzjVB
         WLjW7A1f2tyRXh+fpAkvlFpjyZ3MsIPMMqMftMeOsL8PYD50lyMyv9GnOq/7euGtL0YQ
         XHsw==
X-Gm-Message-State: AOAM530Z1G9i2/W9aCQJM68PFGyHFvnbE7ntxOqUr+nZ0JCXq8jBWsIM
        bwl4pgQzOwZFWCRojkmvsOTbqA==
X-Google-Smtp-Source: ABdhPJxl/FiKAekAR1Fup1MzAtANE/f1/F4P25++0drHeIV6KPzAlPY9tNWEMSijk85EnkvdEamntg==
X-Received: by 2002:a17:907:3d94:b0:6df:8791:135f with SMTP id he20-20020a1709073d9400b006df8791135fmr11739008ejc.205.1649316202038;
        Thu, 07 Apr 2022 00:23:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id et21-20020a170907295500b006e7f1abe2ccsm4187329ejc.75.2022.04.07.00.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 00:23:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v2] ARM: s3c: mark as deprecated and schedule removal
Date:   Thu,  7 Apr 2022 09:23:19 +0200
Message-Id: <20220407072319.75614-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung S3C24xx and S3C64xx platforms are very old designs. S3C2416
was introduced in 2008 and S3C6410 in 2009/2010.  They are not widely
available anymore - out-of-stock on FriendlyArm (one of manufacturers of
boards) and only few specialist stores still offer them for quite a high
price.

The community around these platforms was not very active, so I suspect
no one really uses them anymore. Maintenance takes precious time so
there is little sense in keeping them alive if there are no real users.

Let's mark all S3C24xx and S3C64xx platforms as deprecated and mention
possible removal in after 2022 for the first and 2024 for the lattere.
The deprecation message will be as text in Kconfig, build message (not a
warning though) and runtime print error.

If there are any users, they might respond and postpone the removal.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

---

Changes since v1:
1. Language: in->for removal.
2. Don't show pragma with COMPILE_TEST.
3. Add Acks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/Kconfig                  | 7 ++++++-
 arch/arm/mach-s3c/Kconfig.s3c64xx | 7 ++++++-
 arch/arm/mach-s3c/cpu.c           | 1 +
 arch/arm/mach-s3c/init.c          | 2 ++
 arch/arm/mach-s3c/s3c24xx.c       | 7 +++++++
 arch/arm/mach-s3c/s3c64xx.c       | 7 +++++++
 6 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4814e098f320..22baf93d8be9 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -468,7 +468,7 @@ config ARCH_SA1100
 	  Support for StrongARM 11x0 based boards.
 
 config ARCH_S3C24XX
-	bool "Samsung S3C24XX SoCs"
+	bool "Samsung S3C24XX SoCs (deprecated, see help)"
 	select ATAGS
 	select CLKSRC_SAMSUNG_PWM
 	select GPIO_SAMSUNG
@@ -485,6 +485,11 @@ config ARCH_S3C24XX
 	  (<http://www.simtec.co.uk/products/EB110ITX/>), the IPAQ 1940 or the
 	  Samsung SMDK2410 development board (and derivatives).
 
+	  The platform is deprecated and scheduled for removal. Please reach to
+	  the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
+	  you still use it.
+	  Without such feedback, the platform will be removed after 2022.
+
 config ARCH_OMAP1
 	bool "TI OMAP1"
 	select ARCH_OMAP
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index af01675d8769..2b27bff4d928 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -4,7 +4,7 @@
 #	Simtec Electronics, Ben Dooks <ben@simtec.co.uk>
 
 menuconfig ARCH_S3C64XX
-	bool "Samsung S3C64XX"
+	bool "Samsung S3C64XX (deprecated, see help)"
 	depends on ARCH_MULTI_V6
 	select ARM_AMBA
 	select ARM_VIC
@@ -24,6 +24,11 @@ menuconfig ARCH_S3C64XX
 	help
 	  Samsung S3C64XX series based systems
 
+	  The platform is deprecated and scheduled for removal. Please reach to
+	  the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
+	  you still use it.
+	  Without such feedback, the platform will be removed after 2024.
+
 if ARCH_S3C64XX
 
 # Configuration options for the S3C6410 CPU
diff --git a/arch/arm/mach-s3c/cpu.c b/arch/arm/mach-s3c/cpu.c
index 6e9772555f0d..0df428f01855 100644
--- a/arch/arm/mach-s3c/cpu.c
+++ b/arch/arm/mach-s3c/cpu.c
@@ -28,4 +28,5 @@ void __init s3c64xx_init_cpu(void)
 	}
 
 	pr_info("Samsung CPU ID: 0x%08lx\n", samsung_cpu_id);
+	pr_err("The platform is deprecated and scheduled for removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.  Without such feedback, the platform will be removed after 2022.\n");
 }
diff --git a/arch/arm/mach-s3c/init.c b/arch/arm/mach-s3c/init.c
index 9d92f03e9bc1..bf513616f55d 100644
--- a/arch/arm/mach-s3c/init.c
+++ b/arch/arm/mach-s3c/init.c
@@ -59,6 +59,8 @@ void __init s3c_init_cpu(unsigned long idcode,
 
 	if (cpu->map_io)
 		cpu->map_io();
+
+	pr_err("The platform is deprecated and scheduled for removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.  Without such feedback, the platform will be removed after 2022.\n");
 }
 
 /* s3c24xx_init_clocks
diff --git a/arch/arm/mach-s3c/s3c24xx.c b/arch/arm/mach-s3c/s3c24xx.c
index 37eaf9480da7..819a95364af9 100644
--- a/arch/arm/mach-s3c/s3c24xx.c
+++ b/arch/arm/mach-s3c/s3c24xx.c
@@ -678,3 +678,10 @@ struct platform_device s3c2410_device_dclk = {
 	},
 };
 #endif
+
+#ifndef CONFIG_COMPILE_TEST
+#pragma message "The platform is deprecated and scheduled for removal. " \
+		"Please reach to the maintainers of the platform " \
+		"and linux-samsung-soc@vger.kernel.org if you still use it." \
+		"Without such feedback, the platform will be removed after 2022."
+#endif
diff --git a/arch/arm/mach-s3c/s3c64xx.c b/arch/arm/mach-s3c/s3c64xx.c
index 4dfb648142f2..178085df6d9d 100644
--- a/arch/arm/mach-s3c/s3c64xx.c
+++ b/arch/arm/mach-s3c/s3c64xx.c
@@ -425,3 +425,10 @@ static int __init s3c64xx_init_irq_eint(void)
 	return 0;
 }
 arch_initcall(s3c64xx_init_irq_eint);
+
+#ifndef CONFIG_COMPILE_TEST
+#pragma message "The platform is deprecated and scheduled for removal. " \
+		"Please reach to the maintainers of the platform " \
+		"and linux-samsung-soc@vger.kernel.org if you still use it." \
+		"Without such feedback, the platform will be removed after 2024."
+#endif
-- 
2.32.0

