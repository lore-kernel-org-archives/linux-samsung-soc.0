Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFABC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 13:49:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A49DE6113A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 13:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239115AbhKHNv4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Nov 2021 08:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240094AbhKHNvt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 08:51:49 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14C4C061746
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Nov 2021 05:49:04 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id v15so22505241ljc.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Nov 2021 05:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hCLXPTKUghGQdNXTTVhCz7T3ilZ5vayXa+94WNNB53k=;
        b=dVLaXAkK8JQG6w9UhVLDFKesNyfXRAfjynGuuM+l4OIFDEagZ8stU7Uhkhoy7c7VUL
         Rsu+p8LpOcyMiw/c+3ygG7AqPGY/v7+o/ijSDBWXlQyuBCsVO0/3wCMGuc7HyHyVyq5n
         VuXPYzBDu8ex2RpOkVwpvEB1+SZj3YTtc63VwB9oFR9cl62i9JpXQb0oLAOmo+8zcCVN
         8dXvnCQZJNsj+O0yTo9/7VFYY6A7tAzec4uMpEQZxJH6Y46EaeFrK7rZ1+2aD2OW176h
         fqjYQtz2+ULpLdcjRdqUaPx6B1H/gOTD1fYG0VTXOFOD5AsKb8moYdNX3VyJWI0DNqQX
         qpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hCLXPTKUghGQdNXTTVhCz7T3ilZ5vayXa+94WNNB53k=;
        b=IXTudBjGdh5N8lr1XST28q8Zziq3nFMgnbSRKcNJFKd5Kl70vpKEYIXQTk5pP0eI4M
         3f2pGPb8Klu2KHsV5vrJNT+aqwwhyp2lcvnCiZNt/PPPKRXGGc4YDRyvbZ3R+VsEO5Bz
         7Pbkibf5Le4auMPbSdRD5ZGFdaZ4qyBMkmAzdLb7QbsjI1Xl06sF467iyWXgI99jXlQN
         TCPqiMOO8wHV6lPztG0Z3egJ5Zh/Vg5qRGFOFrs2mviFt0WgWBRnzCXrMA1QbSk61Cp6
         dJ/Rt7qzx5qKyz8EcmmqOXA5qrUm9h1KKeOiYoz4jP4X1IIEaotuk7fH/3gUdGkhUzk2
         wiwQ==
X-Gm-Message-State: AOAM5336R+XGovSGlFDmtOuydayU5hCpEy2WzJi9qkXP0NN7RELaujwj
        fZ1Mapdd5cBJsRdyoqH5XGHJCA==
X-Google-Smtp-Source: ABdhPJxUdJR//dVeDc2ILYJMHRtGRTlS8YmI92bbacJLW80A1Y03O8LZKKkD5GDDao5jzrWwdEzJzQ==
X-Received: by 2002:a2e:904e:: with SMTP id n14mr85960575ljg.84.1636379343012;
        Mon, 08 Nov 2021 05:49:03 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id u5sm1816357lfs.268.2021.11.08.05.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 05:49:02 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH 1/2] arm: samsung: Remove HAVE_S3C2410_I2C and use direct dependencies
Date:   Mon,  8 Nov 2021 15:49:00 +0200
Message-Id: <20211108134901.20490-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

A separate Kconfig option HAVE_S3C2410_I2C for Samsung SoCs is not
really needed and the i2c-s3c24xx driver can depend on Samsung ARM
architectures instead. This also enables i2c-s3c2410 for arm64 Exynos
SoCs, which is required for example by Exynos850.

This is basically continuation of work made in following commits:
  - commit d96890fca9fd ("rtc: s3c: remove HAVE_S3C_RTC in favor of
    direct dependencies")
  - commit 7dd3cae90d85 ("ARM: samsung: remove HAVE_S3C2410_WATCHDOG and
    use direct dependencies")

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm/Kconfig                  |  1 -
 arch/arm/mach-exynos/Kconfig      |  1 -
 arch/arm/mach-s3c/Kconfig.s3c64xx |  1 -
 arch/arm/mach-s5pv210/Kconfig     |  1 -
 drivers/i2c/busses/Kconfig        | 10 ++--------
 5 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 59baf6c132a7..4536fb89b826 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -474,7 +474,6 @@ config ARCH_S3C24XX
 	select GPIO_SAMSUNG
 	select GPIOLIB
 	select GENERIC_IRQ_MULTI_HANDLER
-	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC if RTC_CLASS
 	select NEED_MACH_IO_H
 	select S3C2410_WATCHDOG
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 5a48abac6af4..0aa45d84ddf2 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -21,7 +21,6 @@ menuconfig ARCH_EXYNOS
 	select GPIOLIB
 	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
 	select HAVE_ARM_SCU if SMP
-	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index f3fcb570edf5..af01675d8769 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -12,7 +12,6 @@ menuconfig ARCH_S3C64XX
 	select COMMON_CLK_SAMSUNG
 	select GPIO_SAMSUNG if ATAGS
 	select GPIOLIB
-	select HAVE_S3C2410_I2C if I2C
 	select HAVE_TCM
 	select PLAT_SAMSUNG
 	select PM_GENERIC_DOMAINS if PM
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index d644b45bc29d..68f77d724bd5 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -12,7 +12,6 @@ config ARCH_S5PV210
 	select CLKSRC_SAMSUNG_PWM
 	select COMMON_CLK_SAMSUNG
 	select GPIOLIB
-	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e17790fe35a7..598becce03f0 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -949,16 +949,10 @@ config I2C_RK3X
 	  This driver can also be built as a module. If so, the module will
 	  be called i2c-rk3x.
 
-config HAVE_S3C2410_I2C
-	bool
-	help
-	  This will include I2C support for Samsung SoCs. If you want to
-	  include I2C support for any machine, kindly select this in the
-	  respective Kconfig file.
-
 config I2C_S3C2410
 	tristate "S3C/Exynos I2C Driver"
-	depends on HAVE_S3C2410_I2C || COMPILE_TEST
+	depends on ARCH_EXYNOS || ARCH_S3C24XX || ARCH_S3C64XX || \
+		   ARCH_S5PV210 || COMPILE_TEST
 	help
 	  Say Y here to include support for I2C controller in the
 	  Samsung SoCs (S3C, S5Pv210, Exynos).
-- 
2.30.2

