From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Add device tree enabled Exynos4 machine
Date: Mon,  1 Aug 2011 17:20:35 +0100
Message-ID: <1312215637-716-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:63059 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752857Ab1HAQUs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Aug 2011 12:20:48 -0400
Received: by wwe5 with SMTP id 5so5812256wwe.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Aug 2011 09:20:47 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

This patchset adds a basic device tree enabled machine for Samsung's Exynos4
processor. This enables further development of device tree coverge for
Exynos4. A basic device tree source file for Exynos4 processor and the
smdkv310 board is also included.

The device tree enabled machine has been boot tested till serial console.
The watchdog driver is probed with information from dtb.

Notes:
A. The interrupt controller device tree bindings are not documented yet. That
   is because, it will be replaced with a new irq_domain support soon.

Thomas Abraham (2):
  arm: exynos4: Add a new Exynos4 device tree enabled machine
  arm: dt: Add device tree source file for Exynos4 and let boards include it

 Documentation/devicetree/bindings/arm/samsung.txt |    8 ++
 arch/arm/boot/dts/exynos4-smdkv310.dts            |   31 ++++++
 arch/arm/boot/dts/exynos4.dtsi                    |   44 ++++++++
 arch/arm/mach-exynos4/Kconfig                     |   10 ++
 arch/arm/mach-exynos4/Makefile                    |    1 +
 arch/arm/mach-exynos4/mach-exynos4-dt.c           |  118 +++++++++++++++++++++
 6 files changed, 212 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung.txt
 create mode 100644 arch/arm/boot/dts/exynos4-smdkv310.dts
 create mode 100644 arch/arm/boot/dts/exynos4.dtsi
 create mode 100644 arch/arm/mach-exynos4/mach-exynos4-dt.c
