From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/11] ARM: EXYNOS4: Change ARCH name, ARCH_EXYNOS4 from ARCH_S5PV310
Date: Mon, 14 Feb 2011 17:22:56 +0900
Message-ID: <1297671787-10571-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36637 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752172Ab1BNItk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Feb 2011 03:49:40 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch set changes to ARCH_EXYNOS4 from ARCH_S5PV310 for supporting Samsung's
new brand name EXYNOS. Samsung officially announced about the brand name of EXYNOS
at MWC 2011 and The EXYNOS4 integrates a ARM Cortex A9 microporcessor with several
other peripherals to support features such as multimedai, storage, graphics and gaming.
Especially, the EXYNOS4210 CPU which is one of EXYNOS4 SoC series can be used in
products such as Mobile devices.

This patch set consists of the following patches.

[PATCH 01/11] ARM: EXYNOS4: Add EXYNOS4 CPU initialization support
[PATCH 02/11] ARM: EXYNOS4: Update Clock part
[PATCH 03/11] ARM: EXYNOS4: Update IRQ part
[PATCH 04/11] ARM: EXYNOS4: Update Timer part
[PATCH 05/11] ARM: EXYNOS4: Update device support
[PATCH 06/11] ARM: EXYNOS4: Moved board support files
[PATCH 07/11] ARM: EXYNOS4: Update Kconfig and Makefile for the new ARCH_EXYNOS4
[PATCH 08/11] ARM: exynos4_defconfig: Add defconfig for EXYNOS4
[PATCH 09/11] mtd: OneNAND: Change dependency of ARCH_EXYNOS4
[PATCH 10/11] ASoC: Change dependency of ARCH_EXYNOS4
[PATCH 11/11] tty: Change dependency of ARCH_EXYNOS4
