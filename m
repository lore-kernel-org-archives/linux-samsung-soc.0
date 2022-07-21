Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE76C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jul 2022 14:18:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiGUOSL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Jul 2022 10:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiGUOSL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 10:18:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583DB8048A
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2022 07:18:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E73DE61E41
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2022 14:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC4BC341C0;
        Thu, 21 Jul 2022 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658413089;
        bh=uyREqICAA5M/4JR/uUUB2dI6MeJkWxbgGPHly85bO1g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UCIECntjrYyuvx6nutw9pJgptkLEZEBmXKZCuexwkClVQjXd9Wx2ubtQGbvCvbAZO
         yT6t4WVwI1DuHHPRdsM0Wfo4ZZ8XBj/d1zxkt9xzB3DDw+f09dsFSp2IU/JpoiOtZk
         VDzHZ4WdlxQUOHRa6eLOwdnWn44upmFPiWovhNEcUNEbRahWRRbaDeHuW3IWNfJsET
         glfAXn4WQ3gnWvNJXgI3gzoffJsdP1SAJzle1NGO6eb9i2LXuSwEq5zJmiAG/27kur
         m0khddKplHAGyUCRhFptdZUrjVaq27ImjGlGE5GUy/q61G6PYem0AECxwCzt/j8DZx
         3AkNJ9Pl9Pstg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 11/13] ARM: s3c: mark most board files as unused
Date:   Thu, 21 Jul 2022 16:17:20 +0200
Message-Id: <20220721141722.2414719-12-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220721141722.2414719-1-arnd@kernel.org>
References: <20220721141722.2414719-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The s3c24xx platform is already scheduled for removal in early 2023,
with s3c64xx meeting the same fate a year later.

Most of the s3c64xx board files appear to be unused, as the better
maintained ones already got converted to DT. The main exception is
the Wolfson Cragganmore board, which remains in use as the reference
design for Wolfson/Cirrus devices. As the other boards get removed,
this one stays around along with the DT based machines.

The s3c6400_defconfig file now disables the unused boards, while the
s3c24xx defconfig files all turn on CONFIG_UNUSED_BOARD_FILES to
remain usable.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/mini2440_defconfig   |  1 +
 arch/arm/configs/s3c2410_defconfig    |  1 +
 arch/arm/configs/s3c6400_defconfig    |  9 ---------
 arch/arm/configs/tct_hammer_defconfig |  1 +
 arch/arm/mach-s3c/Kconfig.s3c24xx     |  2 +-
 arch/arm/mach-s3c/Kconfig.s3c64xx     | 20 ++++++++++----------
 6 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/arm/configs/mini2440_defconfig b/arch/arm/configs/mini2440_defconfig
index 5b4ab5bf5c5f..86e00f684e16 100644
--- a/arch/arm/configs/mini2440_defconfig
+++ b/arch/arm/configs/mini2440_defconfig
@@ -11,6 +11,7 @@ CONFIG_S3C_ADC=y
 CONFIG_CPU_S3C2440=y
 CONFIG_MACH_MINI2440=y
 CONFIG_AEABI=y
+CONFIG_UNUSED_BOARD_FILES=y
 CONFIG_KEXEC=y
 CONFIG_CPU_IDLE=y
 CONFIG_APM_EMULATION=y
diff --git a/arch/arm/configs/s3c2410_defconfig b/arch/arm/configs/s3c2410_defconfig
index 2789e96e4ef6..41b40863a78e 100644
--- a/arch/arm/configs/s3c2410_defconfig
+++ b/arch/arm/configs/s3c2410_defconfig
@@ -37,6 +37,7 @@ CONFIG_ARCH_S3C2440=y
 CONFIG_MACH_NEO1973_GTA02=y
 CONFIG_MACH_RX1950=y
 CONFIG_MACH_SMDK2443=y
+CONFIG_UNUSED_BOARD_FILES=y
 CONFIG_CMDLINE="root=/dev/hda1 ro init=/bin/bash console=ttySAC0"
 CONFIG_FPE_NWFPE=y
 CONFIG_FPE_NWFPE_XP=y
diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index 300f5a7febf0..4f04f583c738 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -5,15 +5,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_ARCH_MULTI_V6=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_S3C64XX=y
-CONFIG_MACH_SMDK6400=y
-CONFIG_MACH_ANW6410=y
-CONFIG_MACH_MINI6410=y
-CONFIG_MACH_REAL6410=y
-CONFIG_MACH_SMDK6410=y
-CONFIG_MACH_NCP=y
-CONFIG_MACH_HMT=y
-CONFIG_MACH_SMARTQ5=y
-CONFIG_MACH_SMARTQ7=y
 CONFIG_MACH_WLF_CRAGG_6410=y
 CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc initrd=0x51000000,6M ramdisk_size=6144"
 CONFIG_VFP=y
diff --git a/arch/arm/configs/tct_hammer_defconfig b/arch/arm/configs/tct_hammer_defconfig
index ce95cc97dcac..3b29ae1fb750 100644
--- a/arch/arm/configs/tct_hammer_defconfig
+++ b/arch/arm/configs/tct_hammer_defconfig
@@ -13,6 +13,7 @@ CONFIG_ARCH_MULTI_V4T=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_S3C24XX=y
 CONFIG_MACH_TCT_HAMMER=y
+CONFIG_UNUSED_BOARD_FILES=y
 CONFIG_CMDLINE="mem=64M root=/dev/ram0 init=/linuxrc rw"
 CONFIG_FPE_NWFPE=y
 CONFIG_MODULES=y
diff --git a/arch/arm/mach-s3c/Kconfig.s3c24xx b/arch/arm/mach-s3c/Kconfig.s3c24xx
index 88a5a333312a..c28e75424947 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c24xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c24xx
@@ -8,7 +8,7 @@ menuconfig ARCH_S3C24XX
 	bool "Samsung S3C24XX SoCs (deprecated, see help)"
 	depends on ARCH_MULTI_V4T || ARCH_MULTI_V5
 	depends on CPU_LITTLE_ENDIAN
-	depends on ATAGS
+	depends on ATAGS && UNUSED_BOARD_FILES
 	select CLKSRC_SAMSUNG_PWM
 	select GPIO_SAMSUNG
 	select GPIOLIB
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index 2b27bff4d928..46f4fd795de5 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -114,8 +114,8 @@ config S3C64XX_SETUP_USB_PHY
 # S36400 Macchine support
 
 config MACH_SMDK6400
-       bool "SMDK6400"
-	depends on ATAGS
+	bool "SMDK6400"
+	depends on ATAGS && UNUSED_BOARD_FILES
 	select CPU_S3C6400
 	select S3C64XX_SETUP_SDHCI
 	select S3C_DEV_HSMMC1
@@ -126,7 +126,7 @@ config MACH_SMDK6400
 
 config MACH_ANW6410
 	bool "A&W6410"
-	depends on ATAGS
+	depends on ATAGS && UNUSED_BOARD_FILES
 	select CPU_S3C6410
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C_DEV_FB
@@ -135,7 +135,7 @@ config MACH_ANW6410
 
 config MACH_MINI6410
 	bool "MINI6410"
-	depends on ATAGS
+	depends on ATAGS && UNUSED_BOARD_FILES
 	select CPU_S3C6410
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_SDHCI
@@ -151,7 +151,7 @@ config MACH_MINI6410
 
 config MACH_REAL6410
 	bool "REAL6410"
-	depends on ATAGS
+	depends on ATAGS && UNUSED_BOARD_FILES
 	select CPU_S3C6410
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_SDHCI
@@ -167,7 +167,7 @@ config MACH_REAL6410
 
 config MACH_SMDK6410
 	bool "SMDK6410"
-	depends on ATAGS
+	depends on ATAGS && UNUSED_BOARD_FILES
 	select CPU_S3C6410
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_I2C1
@@ -254,7 +254,7 @@ config SMDK6410_WM1192_EV1
 
 config MACH_NCP
 	bool "NCP"
-	depends on ATAGS
+	depends on ATAGS && UNUSED_BOARD_FILES
 	select CPU_S3C6410
 	select S3C64XX_SETUP_I2C1
 	select S3C_DEV_HSMMC1
@@ -264,7 +264,7 @@ config MACH_NCP
 
 config MACH_HMT
 	bool "Airgoo HMT"
-	depends on ATAGS
+	depends on ATAGS && UNUSED_BOARD_FILES
 	select CPU_S3C6410
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C_DEV_FB
@@ -296,14 +296,14 @@ config MACH_SMARTQ
 
 config MACH_SMARTQ5
 	bool "SmartQ 5"
-	depends on ATAGS
+	depends on ATAGS && UNUSED_BOARD_FILES
 	select MACH_SMARTQ
 	help
 	    Machine support for the SmartQ 5
 
 config MACH_SMARTQ7
 	bool "SmartQ 7"
-	depends on ATAGS
+	depends on ATAGS && UNUSED_BOARD_FILES
 	select MACH_SMARTQ
 	help
 	    Machine support for the SmartQ 7
-- 
2.29.2

