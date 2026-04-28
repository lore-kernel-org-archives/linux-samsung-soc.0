Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CD12D97A6;
	Tue, 28 Apr 2026 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393684; cv=none; b=QpHmlh9v4ieVWdS7fQweITalHTmKMUHofrhgUhN4vJT4vXNmFIXaD7Pnm4kskj+urxB3lPWRkEPsK7OZZ7woPQXq/wZKlwmwznBRQcXStoPKTfdx1PVj/BeKeOpANhRMjcdw6jeTAf1L4bXuxOv/95C+oCeXTLqo5wVpnNvSvuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393684; c=relaxed/simple;
	bh=olhgGBJthCl0/RuH4VBtKTPTAtlW3mfULTs2uM3D5/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FbhcBxd64tYfHAQSlZX8K0rgkAgSuEjy/wcB55nAzG3V2SagsClQrpchU4xME7fn8Sas2xav6CYIBSdt+sJQnVk1q8fTl8TJveOTeKWORFMeZ+xBr/OMDD9lYRZyfzZksi1aMlCniz1+NtBeakj3MiwCTMBIpzAJqExpJeiiPrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbnadGdO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbnadGdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEC6C2BCC9;
	Tue, 28 Apr 2026 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777393684;
	bh=olhgGBJthCl0/RuH4VBtKTPTAtlW3mfULTs2uM3D5/c=;
	h=From:To:Cc:Subject:Date:From;
	b=FbnadGdO5BWSHNJwAvwgGku0aAUwyUHTIUbabxyMGpHU4sFL5Ur+EDzx1iwdv9ByF
	 FmnfqLZ3sFDclwk+C4ZtPIEOjdL75kwi07AT+lnudJlJtWovJgTpm8YuTt03E60FSb
	 QrlKHxf+lFZWHEBlte1ur0668dc9eKP2UnLRuIvgFoVc7A0MSyX/JZDr9zRXDFCYSD
	 YZfn3Wi2JSEyPwpVPIM+XpmuNPSdl3RboEFX2Op1V2hyxrfCAGgwfv5CBkPc+g0Vrp
	 L3YKqr+yPSQXaUwFX724ieiIdh28qI3scqKFfMhcZAp5lK8UcZqxWE/F4G+M/Q0M9d
	 Pf0SKvDvOUP5Q==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@lists.linux.dev,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] ARM: select legacy gpiolib interfaces where used
Date: Tue, 28 Apr 2026 18:27:30 +0200
Message-Id: <20260428162757.540823-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A few old machines have not been converted away from the old-style
gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
symbol so the code still works where it is needed but can be left
out otherwise.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-mv78xx0/Kconfig     | 1 +
 arch/arm/mach-orion5x/Kconfig     | 1 +
 arch/arm/mach-pxa/Kconfig         | 1 +
 arch/arm/mach-s3c/Kconfig.s3c64xx | 1 +
 arch/arm/mach-sa1100/Kconfig      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm/mach-mv78xx0/Kconfig b/arch/arm/mach-mv78xx0/Kconfig
index 9de3bbc09c3a..670e6587827e 100644
--- a/arch/arm/mach-mv78xx0/Kconfig
+++ b/arch/arm/mach-mv78xx0/Kconfig
@@ -6,6 +6,7 @@ menuconfig ARCH_MV78XX0
 	depends on ATAGS
 	select CPU_FEROCEON
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MVEBU_MBUS
 	select FORCE_PCI
 	select PLAT_ORION_LEGACY
diff --git a/arch/arm/mach-orion5x/Kconfig b/arch/arm/mach-orion5x/Kconfig
index ee449ca032d2..cef19bea6164 100644
--- a/arch/arm/mach-orion5x/Kconfig
+++ b/arch/arm/mach-orion5x/Kconfig
@@ -5,6 +5,7 @@ menuconfig ARCH_ORION5X
 	depends on CPU_LITTLE_ENDIAN
 	select CPU_FEROCEON
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MVEBU_MBUS
 	select FORCE_PCI
 	select PCI_QUIRKS
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 10e472f4fa43..66e26990e2c8 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -10,6 +10,7 @@ menuconfig ARCH_PXA
 	select CPU_XSCALE if !CPU_XSC3
 	select GPIO_PXA
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select PLAT_PXA
 	help
 	  Support for Intel/Marvell's PXA2xx/PXA3xx processor line.
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index 8f40af063ad6..3f97fba8e4f5 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -101,6 +101,7 @@ config MACH_WLF_CRAGG_6410
 	depends on ATAGS
 	depends on I2C=y
 	select CPU_S3C6410
+	select GPIOLIB_LEGACY
 	select LEDS_GPIO_REGISTER
 	select S3C64XX_DEV_SPI0
 	select S3C64XX_SETUP_FB_24BPP
diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
index 0fb4c24cfad5..e23700e0d6c8 100644
--- a/arch/arm/mach-sa1100/Kconfig
+++ b/arch/arm/mach-sa1100/Kconfig
@@ -13,6 +13,7 @@ menuconfig ARCH_SA1100
 	select CPU_FREQ
 	select CPU_SA1100
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select IRQ_DOMAIN
 	select ISA
 	select NEED_MACH_MEMORY_H
-- 
2.39.5

