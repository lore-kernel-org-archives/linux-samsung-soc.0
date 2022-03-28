Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092F8C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 28 Mar 2022 08:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233702AbiC1I3t (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 28 Mar 2022 04:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239437AbiC1I2o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Mar 2022 04:28:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66D5BF5B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Mar 2022 01:27:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nYki7-00051U-JU; Mon, 28 Mar 2022 10:26:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nYki2-003YEr-Hq; Mon, 28 Mar 2022 10:26:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nYki4-00CK49-BV; Mon, 28 Mar 2022 10:26:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] ARM: s3c: Drop config symbol S3C24XX_PWM
Date:   Mon, 28 Mar 2022 10:26:38 +0200
Message-Id: <20220328082638.112185-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3095; h=from:subject; bh=07Pt8rKFtWI+brNh/Fk7/cslruuj217Z8pcU25R0XIE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiQXE6lJdihjK+5Zw1f8bD8ouYwHPZtX5AqkCdUSve nmDGXliJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYkFxOgAKCRDB/BR4rcrsCbCaB/ 0dGO2ov3y3YGzZismla6bAhq8NLNaoKHFBvTFkg6OK3F65va5s4fa074V/sAYX6r4k/f4h1Hna/rJ9 UcTV9BT1XS5K5Un2OXF8hzcKAXAttQcHUrO0mkILuxtbPXOQwwIfmh1I2FLL63Aa6//cpGaojD+UEC 2JySII+OnWi1oNzSJI+1AQfflIcnqik7M5wuCb+HBcomhe1LpeoaTiBbrppN5bXwCbYwI28oL8/MO9 eRyvmrt7/+tufg5uN5PPxyuOsX13A3JDXzOh+abA0EbV1g8mfimDhPX3wnUB/8TqIdozfAllYGlawH +1P63KoiEFB+79Q0KMBsHujbmw0eae
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The only effect of this symbol is to select PWM_SAMSUNG. Drop it and fix
the affected defconfigs to still keep PWM_SAMSUNG=y. Developers using
MACH_NEO1973_GTA02 and/or MACH_RX1950 now have to manually select PWM and
PWM_SAMSUNG (and get the freedom to select is as a module or not at all).
A side effect of this change is that allmodconfig now contains
PWM_SAMSUNG=m (which was =y before).

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/configs/mini2440_defconfig | 3 ++-
 arch/arm/configs/s3c2410_defconfig  | 2 ++
 arch/arm/mach-s3c/Kconfig           | 8 --------
 arch/arm/mach-s3c/Kconfig.s3c24xx   | 2 --
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/arm/configs/mini2440_defconfig b/arch/arm/configs/mini2440_defconfig
index 898490aaa39e..c7741289f213 100644
--- a/arch/arm/configs/mini2440_defconfig
+++ b/arch/arm/configs/mini2440_defconfig
@@ -6,7 +6,6 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_ARCH_S3C24XX=y
 CONFIG_S3C_ADC=y
-CONFIG_S3C24XX_PWM=y
 # CONFIG_CPU_S3C2410 is not set
 CONFIG_CPU_S3C2440=y
 CONFIG_MACH_MINI2440=y
@@ -228,6 +227,8 @@ CONFIG_RTC_INTF_DEV_UIE_EMUL=y
 CONFIG_RTC_DRV_S3C=y
 CONFIG_DMADEVICES=y
 CONFIG_S3C24XX_DMAC=y
+CONFIG_PWM=y
+CONFIG_PWM_SAMSUNG=y
 CONFIG_EXT2_FS=m
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
diff --git a/arch/arm/configs/s3c2410_defconfig b/arch/arm/configs/s3c2410_defconfig
index 153009130dab..0ec00aec2e8a 100644
--- a/arch/arm/configs/s3c2410_defconfig
+++ b/arch/arm/configs/s3c2410_defconfig
@@ -358,6 +358,8 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_S3C=y
 CONFIG_DMADEVICES=y
 CONFIG_S3C24XX_DMAC=y
+CONFIG_PWM=y
+CONFIG_PWM_SAMSUNG=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
diff --git a/arch/arm/mach-s3c/Kconfig b/arch/arm/mach-s3c/Kconfig
index 1899fc3f44fd..54548c051402 100644
--- a/arch/arm/mach-s3c/Kconfig
+++ b/arch/arm/mach-s3c/Kconfig
@@ -207,14 +207,6 @@ config SAMSUNG_DEV_PWM
 	help
 	  Compile in platform device definition for PWM Timer
 
-config S3C24XX_PWM
-	bool "PWM device support"
-	select PWM
-	select PWM_SAMSUNG
-	help
-	  Support for exporting the PWM timer blocks via the pwm device
-	  system
-
 config GPIO_SAMSUNG
 	def_bool y
 
diff --git a/arch/arm/mach-s3c/Kconfig.s3c24xx b/arch/arm/mach-s3c/Kconfig.s3c24xx
index 000e3e234f71..ee4b79ac3755 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c24xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c24xx
@@ -532,7 +532,6 @@ config MACH_NEO1973_GTA02
 	select MFD_PCF50633
 	select PCF50633_GPIO
 	select POWER_SUPPLY
-	select S3C24XX_PWM
 	select S3C_DEV_USB_HOST
 	help
 	   Say Y here if you are using the Openmoko GTA02 / Freerunner GSM Phone
@@ -544,7 +543,6 @@ config MACH_RX1950
 	select S3C2410_COMMON_DCLK
 	select S3C2410_IOTIMING if ARM_S3C2440_CPUFREQ
 	select S3C2440_XTAL_16934400
-	select S3C24XX_PWM
 	select S3C_DEV_NAND
 	help
 	   Say Y here if you're using HP iPAQ rx1950

base-commit: ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
-- 
2.35.1

