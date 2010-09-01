From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 00/13] ARM: S5P64X0: Add new S5P6450 Support
Date: Wed,  1 Sep 2010 16:09:07 +0900
Message-ID: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:42008 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751199Ab0IAHZe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 03:25:34 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patches add basic support for Samsung S5P6450 SoC.

Basically this patch moves mach-s5p6440 (ARCH_S5P6440) to mach-s5p64x0
(ARCH_S5P64X0) to support Samsung's new S5P6450 SoC. The ARCH_S5P64X0
can support S5P6440 and S5P6450 with one kernel image. It is tested on
SMDK6440(S5P6440) and SMDK6450(S5P6450) with s5p64x0_defconfig. And
this patch changes s5p6440_defconfig to s5p64x0_defconfig for S5P64X0.

[PATCH 01/13] ARM: S5P: Moves initial map for merging S5P64X0
[PATCH 02/13] ARM: S5P64X0: Update Kconfig and Makefile
[PATCH 03/13] ARM: S5P64X0: Add S5P64X0(S5P6440 and S5P6450) initialization support
[PATCH 04/13] ARM: S5P64X0: Update Clock for S5P6440 and S5P6450
[PATCH 05/13] ARM: S5P64X0: Update IRQ support
[PATCH 06/13] ARM: S5P64X0: Update Timer support
[PATCH 07/13] ARM: S5P64X0: Update Audio support
[PATCH 08/13] ARM: S5P64X0: Move DMA support for S5P64X0
[PATCH 09/13] ARM: S5P64X0: Add S5P6450 I2C support
[PATCH 10/13] ARM: S5P64X0: Move GPIO support files for merge S5P64X0
[PATCH 11/13] ARM: S5P64X0: Move SMDK6440 board file and Add SMDK6450 board file
[PATCH 12/13] ARM: S5P64X0: Add UART serial support for S5P6450
[PATCH 13/13] ARM: s5p64x0_defconfig: Update for support S5P6440 and S5P6450
