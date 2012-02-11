From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 00/11] ARM: EXYNOS: add suppport for EXYNOS5250 SoC
Date: Sun, 12 Feb 2012 02:34:34 +0900
Message-ID: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:33537 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753713Ab2BKRfL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Feb 2012 12:35:11 -0500
Received: by pbcun15 with SMTP id un15so3340620pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Feb 2012 09:35:11 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

This patch adds support EXYNOS5250 SoC which has two A15 cores
can be used on mobile / tablet devices.

Changes since v1:
- address comments from mailing list
- update the option accordingly common.[ch]
- update clock part
- get rid of static mapping for uart
- add device tree enabled board file(mach-exynos5-dt.c)
- add initial dts file for EXYNOS5250(SoC), SMDK5250(Board)

[PATCH v2 01/11] ARM: EXYNOS: to declare static for mach-exynos/common.c
[PATCH v2 02/11] ARM: EXYNOS: use exynos_init_uarts() instead of exynos4_init_uarts()
[PATCH v2 03/11] ARM: EXYNOS: add clock part for EXYNOS5250 SoC
[PATCH v2 04/11] ARM: EXYNOS: add interrupt definitions for EXYNOS5250
[PATCH v2 05/11] ARM: EXYNOS: add initial setup-i2c0 for EXYNOS5
[PATCH v2 06/11] ARM: EXYNOS: add support uart for EXYNOS4 and EXYNOS5
[PATCH v2 07/11] ARM: EXYNOS: add support get_core_count() for EXYNOS5250
[PATCH v2 08/11] ARM: EXYNOS: add support for ARCH_EXYNOS5 and EXYNOS5250
[PATCH v2 09/11] ARM: EXYNOS: add support device tree enabled board file for EXYNOS5
[PATCH v2 10/11] ARM: dts: add initial dts file for EXYNOS5250, SMDK5250
[PATCH v2 11/11] ARM: EXYNOS: temporary add board file for SMDK5250
