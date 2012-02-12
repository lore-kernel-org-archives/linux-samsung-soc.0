From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Subject: [PATCH] ARM: s3c2440:  fix undefined reference to `s3c2440_restart' for machine gta02
Date: Sun, 12 Feb 2012 14:05:29 +0100
Message-ID: <1329051929-8303-1-git-send-email-GNUtoo@no-log.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp203.alice.it ([82.57.200.99]:37329 "EHLO smtp203.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753415Ab2BLNFf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Feb 2012 08:05:35 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Without that fix we have(when compiling for the gta02 machine):
    LD      .tmp_vmlinux1
  arch/arm/mach-s3c2440/built-in.o:(.arch.info.init+0x3c): undefined reference to `s3c2440_restart'
  make: *** [.tmp_vmlinux1] Error 1

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 arch/arm/mach-s3c2440/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2440/Kconfig b/arch/arm/mach-s3c2440/Kconfig
index 914e620..d8c8ad7 100644
--- a/arch/arm/mach-s3c2440/Kconfig
+++ b/arch/arm/mach-s3c2440/Kconfig
@@ -89,6 +89,7 @@ config MACH_ANUBIS
 config MACH_NEO1973_GTA02
 	bool "Openmoko GTA02 / Freerunner phone"
 	select CPU_S3C2442
+	select CPU_S3C2440
 	select MFD_PCF50633
 	select PCF50633_GPIO
 	select I2C
-- 
1.7.4.1
