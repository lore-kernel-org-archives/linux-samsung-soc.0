From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/9] ARM: EXYNOS: add support EXYNOS5 SoC
Date: Wed,  1 Feb 2012 00:39:05 +0900
Message-ID: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:36808 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753685Ab2AaPje (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 10:39:34 -0500
Received: by dadp15 with SMTP id p15so45719dad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 07:39:33 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

This patch adds support EXYNOS5250 SoC which has two A15 cores
can be used on mobile devices.

This patches are including temporary commits which are about
regarding map, interrupt and get_core_count() and they will be
fixed next time.

And the EXYNOS5 can support single zImage with EXYNOS4 SoCs
when EXYNOS5 DT is supported.

NOTE:
- This patches depend on following
  ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs
  ARM: SAMSUNG: allow the configuration of KERNEL HZ in plat-samsung
  serial: samsung: Add support for EXYNOS4212 and EXYNOS4412

- EXYNOS5 DT will be supported together next time.

[PATCH 1/9] ARM: EXYNOS: use exynos_init_uarts() instead of
[PATCH 2/9] ARM: EXYNOS: add clock part for EXYNOS5250 SoC
[PATCH 3/9] ARM: EXYNOS: add initial setup-i2c0 for EXYNOS5
[PATCH 4/9] ARM: EXYNOS: add support for ARCH_EXYNOS5 and EXYNOS5250
[PATCH 5/9] ARM: EXYNOS: add board file for SMDK5250
[PATCH 6/9] serial: samsung: Add support for EXYNOS5250
[PATCH 7/9] ARM: EXYNOS: temporary add interrupt definitions
[PATCH 8/9] ARM: EXYNOS: temporary add map definitions for uart
[PATCH 9/9] ARM: EXYNOS: temporary fixup regarding get_core_count()
