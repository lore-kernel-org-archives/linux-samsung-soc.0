From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/5] ARM: EXYNOS: Add secure firmware support
Date: Thu, 13 Sep 2012 10:13:33 +0200
Message-ID: <1347524018-19301-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12903 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751416Ab2IMIOE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Sep 2012 04:14:04 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAA00L2C46GO2V0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 17:14:02 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAA00F0A477MEF1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 17:14:01 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, t.figa@samsung.com

Some Exynos-based boards are running with secure firmware running in
TrustZone secure world, which changes the way some things have to be
initialized.

This series adds support for specifying firmware operations, implements
some firmware operations for Exynos secure firmware and adds a method of
enabling secure firmware operations on Exynos-based boards through board
file and device tree.

This is a continuation of the patch series by Kyungmin Park:
[PATCH v5 1/2] ARM: Make a compile firmware conditionally
http://thread.gmane.org/gmane.linux.ports.arm.kernel/183607
[PATCH v5 2/2] ARM: EXYNOS: SMC instruction (aka firmware) support
http://thread.gmane.org/gmane.linux.ports.arm.kernel/183608/focus=184109

Tomasz Figa (5):
  ARM: EXYNOS: Add IO mapping for non-secure SYSRAM.
  ARM: Add interface for registering and calling firmware-specific
    operations
  ARM: EXYNOS: Add support for secure monitor calls
  ARM: EXYNOS: Add support for Exynos secure firmware
  ARM: EXYNOS: Add secure firmware support to secondary CPU bring-up

 .../devicetree/bindings/arm/samsung-boards.txt     |  8 ++++
 arch/arm/common/Makefile                           |  2 +
 arch/arm/common/firmware.c                         | 18 ++++++++
 arch/arm/include/asm/firmware.h                    | 30 +++++++++++++
 arch/arm/mach-exynos/Makefile                      |  6 +++
 arch/arm/mach-exynos/common.c                      | 34 ++++++++++++++
 arch/arm/mach-exynos/common.h                      |  2 +
 arch/arm/mach-exynos/exynos-smc.S                  | 22 +++++++++
 arch/arm/mach-exynos/firmware.c                    | 52 ++++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h            |  3 ++
 arch/arm/mach-exynos/mach-exynos4-dt.c             |  1 +
 arch/arm/mach-exynos/platsmp.c                     |  8 ++++
 arch/arm/mach-exynos/smc.h                         | 31 +++++++++++++
 arch/arm/plat-samsung/include/plat/map-s5p.h       |  1 +
 14 files changed, 218 insertions(+)
 create mode 100644 arch/arm/common/firmware.c
 create mode 100644 arch/arm/include/asm/firmware.h
 create mode 100644 arch/arm/mach-exynos/exynos-smc.S
 create mode 100644 arch/arm/mach-exynos/firmware.c
 create mode 100644 arch/arm/mach-exynos/smc.h

-- 
1.7.12
