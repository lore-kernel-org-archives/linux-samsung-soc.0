From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [RFC PATCH 7/7] ARM: dts: Add dts file for S3C6410-based Mini6410 board
Date: Thu, 10 Jan 2013 00:41:49 +0100
Message-ID: <1357774909-29938-8-git-send-email-tomasz.figa@gmail.com>
References: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f181.google.com ([209.85.215.181]:38054 "EHLO
	mail-ea0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932206Ab3AIXmL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 18:42:11 -0500
Received: by mail-ea0-f181.google.com with SMTP id k14so889603eaa.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jan 2013 15:42:10 -0800 (PST)
In-Reply-To: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Tomasz Figa <tomasz.figa@gmail.com>

This patch adds basic device tree sources for FriendlyARM Mini6410 board
based on Samsung S3C6410 SoC.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/boot/dts/Makefile             |  1 +
 arch/arm/boot/dts/s3c6410-mini6410.dts | 44 ++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 arch/arm/boot/dts/s3c6410-mini6410.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e44da40..9ca30ea 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -120,6 +120,7 @@ dtb-$(CONFIG_ARCH_U8500) += snowball.dtb \
 	hrefprev60.dtb \
 	hrefv60plus.dtb \
 	ccu9540.dtb
+dtb-$(CONFIG_ARCH_S3C64XX) += s3c6410-mini6410.dtb
 dtb-$(CONFIG_ARCH_SHMOBILE) += emev2-kzm9d.dtb \
 	r8a7740-armadillo800eva.dtb \
 	sh73a0-kzm9g.dtb \
diff --git a/arch/arm/boot/dts/s3c6410-mini6410.dts b/arch/arm/boot/dts/s3c6410-mini6410.dts
new file mode 100644
index 0000000..a5ceade
--- /dev/null
+++ b/arch/arm/boot/dts/s3c6410-mini6410.dts
@@ -0,0 +1,44 @@
+/*
+ * Samsung's S3C6410 based Mini6410 board device tree source
+ *
+ * Copyright (c) 2012 Tomasz Figa <tomasz.figa@gmail.com>
+ *
+ * Device tree source file for FriendlyARM Mini6410 board which is based on
+ * Samsung's S3C6410 SoC.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/dts-v1/;
+/include/ "s3c6410.dtsi"
+
+/ {
+	model = "FriendlyARM Mini6410 board based on S3C6410";
+	compatible = "friendlyarm,mini6410", "samsung,s3c6410";
+
+	memory {
+		reg = <0x50000000 0x10000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttySAC0,115200n8 earlyprintk";
+	};
+
+	serial@7f005000 {
+		status = "okay";
+	};
+
+	serial@7f005400 {
+		status = "okay";
+	};
+
+	serial@7f005800 {
+		status = "okay";
+	};
+
+	serial@7f005c00 {
+		status = "okay";
+	};
+};
-- 
1.8.1
