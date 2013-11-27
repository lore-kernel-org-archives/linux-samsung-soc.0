From: panchaxari <panchaxari.prasannamurthy@linaro.org>
Subject: [PATCH] ARM:EXYNOS:Enable ARM_PATCH_PHYS_VIRT and AUTO_ZRELADDR by default
Date: Wed, 27 Nov 2013 09:58:05 +0530
Message-ID: <1385526485-23758-2-git-send-email-panchaxari.prasannamurthy@linaro.org>
References: <1385526485-23758-1-git-send-email-panchaxari.prasannamurthy@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:43526 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752620Ab3K0E2h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Nov 2013 23:28:37 -0500
Received: by mail-pd0-f177.google.com with SMTP id q10so9095356pdj.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Nov 2013 20:28:37 -0800 (PST)
In-Reply-To: <1385526485-23758-1-git-send-email-panchaxari.prasannamurthy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: nataraja.km@lge.com
Cc: panchaxari.prasannamurthy@linaro.org, linaro-kernel@lists.linaro.org, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

ARM_PATCH_PHYS_VIRT and AUTO_ZRELADDR is enabled by default for Exynos
platforms.

Introduction of this config as default will enable phy-to-virt and
virt-to-phy translation function at boot and module loading time
and enforce dynamic reallocation of memory.

This config is mutually exclusive to XIP_KERNEL, which is used in
systems with NOR flash devices

Requesting Exynos maintainers to evaluate the changes on the
board and comment, as I dont have the board for testing
I am seeking an ACK from Exynos maintainers.

Signed-off-by: panchaxari <panchaxari.prasannamurthy@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 214b698..28d84f3 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -807,6 +807,8 @@ config ARCH_EXYNOS
 	select ARCH_REQUIRE_GPIOLIB
 	select ARCH_SPARSEMEM_ENABLE
 	select ARM_GIC
+	select ARM_PATCH_PHYS_VIRT
+	select AUTO_ZRELADDR
 	select COMMON_CLK
 	select CPU_V7
 	select GENERIC_CLOCKEVENTS
-- 
1.7.10.4
