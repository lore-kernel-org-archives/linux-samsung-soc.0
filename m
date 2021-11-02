Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7096FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 11:05:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5158E60C41
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 11:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhKBLIF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 07:08:05 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:49294
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230109AbhKBLIE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 07:08:04 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2608E3F1BA
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 11:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635851129;
        bh=eCXkhtzwAkxmBwcMzvoTZ9XLgb1F/fHJXMlrCrHh7Fg=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=OoC5AfJ5hUwiUxpN/2w3SCMZgjgSWfTk7jCl+B5ul691+oBXwNIupRCweXMJM615K
         abX8p5Ve4KwxBdyqRgz3I53Wojrerl80NmXaKC1D4q6GY371D0I6nzL55AUG8WMnLY
         ycTLWHvqBKfMn+YF4q8v7o/5v6KAIyT57GSRG0HfLwyV5MKjQ7djbxyKrjcqvZBxj+
         6IDd3wQRHcWB/LJoe3kvk0lglkEaXkylsuQP3gxv8qjWQ6jv3nTuAIlkNlCDO+cKlc
         JHplD4ZjnklYr8bYID9Occy+7DRad+wU/+/Rks47oi4/rlE8lmSVb8i1+jGAKPTpFA
         IlPPFJFK+HJyg==
Received: by mail-lf1-f69.google.com with SMTP id i1-20020a056512318100b003ffd4e89eb9so6255863lfe.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Nov 2021 04:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eCXkhtzwAkxmBwcMzvoTZ9XLgb1F/fHJXMlrCrHh7Fg=;
        b=7ZHQgR15h3nrH5czBpuoStZK6sL4LhhmsffPQatJKkEFFQ6/0BsU0M+iv1+V7ye1qa
         +/+BkD3+Ni15kW5bhPcCw6i8fuU4G3tKZ4svSslDaNN3Hl0wRRicecPC/sPqFPMCZSOG
         AGpIqjpxf5MP6PYHNeOOukh33jk5NsTqK+1BUVgfAuEgwnKMg9Bvnp4jErrD8dka9nT7
         Pf+3De+GxkS1L//i6NDpzbvbAmKlxmjf27zrni0EGCgZo5Yog5AX7oFUGCmSm2j5LXbM
         EWu5Y8StzBFb/8If/3ktIhTdKagWiGPTuGShy88zX31xWdeDJzyf4xpF8ojt7bg889Rv
         56HQ==
X-Gm-Message-State: AOAM5330f4zNb5dRLNSSvbRsUBgazflu4ycthH74lNj1APta2ECYUJb1
        bxQnqbzcjH0yvDoVjOSgZwzVXyum2RNdtIadLDwsQ7ftG2EEF83zhhOYh6O9vqZLPrYATm+tWVc
        9aVKv3eWOYiaSXK0yKULZwuXToWQbY+cE1raZuA1fSRsUmE1H
X-Received: by 2002:a05:6512:e83:: with SMTP id bi3mr13362222lfb.479.1635851128186;
        Tue, 02 Nov 2021 04:05:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwseu9XzPZO5lqX9ofSsGGrNhP59zvsk8fmBNAtBvWsuKP4dwmjgVWVIem8UF2IObzhslAmzA==
X-Received: by 2002:a05:6512:e83:: with SMTP id bi3mr13362181lfb.479.1635851127903;
        Tue, 02 Nov 2021 04:05:27 -0700 (PDT)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j26sm1655127lfb.84.2021.11.02.04.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 04:05:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kukjin Kim <kgene@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>, Cedric Roux <sed@free.fr>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>,
        Heiko Stuebner <heiko@sntech.de>
Subject: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal after 2022
Date:   Tue,  2 Nov 2021 12:05:19 +0100
Message-Id: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
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
possible removal in one year (after 2022).  The deprecation message will
be as text in Kconfig, build message (not a warning though) and runtime
print error.

If there are any users, they might respond and postpone the removal.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/Kconfig                  | 7 ++++++-
 arch/arm/mach-s3c/Kconfig.s3c64xx | 7 ++++++-
 arch/arm/mach-s3c/cpu.c           | 1 +
 arch/arm/mach-s3c/init.c          | 2 ++
 arch/arm/mach-s3c/s3c24xx.c       | 5 +++++
 arch/arm/mach-s3c/s3c64xx.c       | 5 +++++
 6 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f0f9e8bec83a..bd8237c7e7f1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -473,7 +473,7 @@ config ARCH_SA1100
 	  Support for StrongARM 11x0 based boards.
 
 config ARCH_S3C24XX
-	bool "Samsung S3C24XX SoCs"
+	bool "Samsung S3C24XX SoCs (deprecated, see help)"
 	select ATAGS
 	select CLKSRC_SAMSUNG_PWM
 	select GPIO_SAMSUNG
@@ -491,6 +491,11 @@ config ARCH_S3C24XX
 	  (<http://www.simtec.co.uk/products/EB110ITX/>), the IPAQ 1940 or the
 	  Samsung SMDK2410 development board (and derivatives).
 
+	  The platform is deprecated and scheduled in removal. Please reach to
+	  the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
+	  you still use it.
+	  Without such feedback, the platform will be removed after 2022.
+
 config ARCH_OMAP1
 	bool "TI OMAP1"
 	depends on MMU
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index f3fcb570edf5..3b090ae72bbd 100644
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
@@ -25,6 +25,11 @@ menuconfig ARCH_S3C64XX
 	help
 	  Samsung S3C64XX series based systems
 
+	  The platform is deprecated and scheduled in removal. Please reach to
+	  the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
+	  you still use it.
+	  Without such feedback, the platform will be removed after 2022.
+
 if ARCH_S3C64XX
 
 # Configuration options for the S3C6410 CPU
diff --git a/arch/arm/mach-s3c/cpu.c b/arch/arm/mach-s3c/cpu.c
index 6e9772555f0d..3b16cf42910f 100644
--- a/arch/arm/mach-s3c/cpu.c
+++ b/arch/arm/mach-s3c/cpu.c
@@ -28,4 +28,5 @@ void __init s3c64xx_init_cpu(void)
 	}
 
 	pr_info("Samsung CPU ID: 0x%08lx\n", samsung_cpu_id);
+	pr_err("The platform is deprecated and scheduled in removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.  Without such feedback, the platform will be removed after 2022.\n");
 }
diff --git a/arch/arm/mach-s3c/init.c b/arch/arm/mach-s3c/init.c
index 9d92f03e9bc1..5db7dc54340c 100644
--- a/arch/arm/mach-s3c/init.c
+++ b/arch/arm/mach-s3c/init.c
@@ -59,6 +59,8 @@ void __init s3c_init_cpu(unsigned long idcode,
 
 	if (cpu->map_io)
 		cpu->map_io();
+
+	pr_err("The platform is deprecated and scheduled in removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.  Without such feedback, the platform will be removed after 2022.\n");
 }
 
 /* s3c24xx_init_clocks
diff --git a/arch/arm/mach-s3c/s3c24xx.c b/arch/arm/mach-s3c/s3c24xx.c
index ccfed48c98aa..2ea1cb21dfbc 100644
--- a/arch/arm/mach-s3c/s3c24xx.c
+++ b/arch/arm/mach-s3c/s3c24xx.c
@@ -678,3 +678,8 @@ struct platform_device s3c2410_device_dclk = {
 	},
 };
 #endif
+
+#pragma message "The platform is deprecated and scheduled in removal (see platform help). " \
+		"Please reach to the maintainers of the platform " \
+		"and linux-samsung-soc@vger.kernel.org if you still use it." \
+		"Without such feedback, the platform will be removed after 2022."
diff --git a/arch/arm/mach-s3c/s3c64xx.c b/arch/arm/mach-s3c/s3c64xx.c
index 4dfb648142f2..3e248f0e96a2 100644
--- a/arch/arm/mach-s3c/s3c64xx.c
+++ b/arch/arm/mach-s3c/s3c64xx.c
@@ -425,3 +425,8 @@ static int __init s3c64xx_init_irq_eint(void)
 	return 0;
 }
 arch_initcall(s3c64xx_init_irq_eint);
+
+#pragma message "The platform is deprecated and scheduled in removal (see platform help). " \
+		"Please reach to the maintainers of the platform " \
+		"and linux-samsung-soc@vger.kernel.org if you still use it." \
+		"Without such feedback, the platform will be removed after 2022."
-- 
2.32.0

