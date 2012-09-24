From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 0/6] ARM: EXYNOS: Add secure firmware support
Date: Mon, 24 Sep 2012 16:28:27 +0200
Message-ID: <1348496913-25422-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25355 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752252Ab2IXO2q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Sep 2012 10:28:46 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAU00LMGYVTDP10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Sep 2012 23:28:44 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAU0018OYVOXC80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Sep 2012 23:28:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, t.figa@samsung.com

Some Exynos-based boards are running with secure firmware running in
TrustZone secure world, which changes the way some things have to be
initialized.

This series adds support for specifying firmware operations, implements
some firmware operations for Exynos secure firmware and adds a method of
enabling secure firmware operations on Exynos-based boards through board
file and device tree.

Changes since v1
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/12583/focus=12820
  - Changed return types of all operations to int
  - Defined all operations to return 0 on success, -ENOSYS when not
    implemented or appropriate error code on error

Tomasz Figa (6):
  ARM: Add interface for registering and calling firmware-specific
    operations
  ARM: EXYNOS: Add support for secure monitor calls
  ARM: EXYNOS: Add support for secondary CPU bring-up on Exynos4412
  ARM: EXYNOS: Add IO mapping for non-secure SYSRAM.
  ARM: EXYNOS: Add support for Exynos secure firmware
  ARM: EXYNOS: Add secure firmware support to secondary CPU bring-up

 .../devicetree/bindings/arm/samsung-boards.txt     |  8 ++++
 arch/arm/common/Makefile                           |  2 +
 arch/arm/common/firmware.c                         | 18 ++++++++
 arch/arm/include/asm/firmware.h                    | 31 +++++++++++++
 arch/arm/mach-exynos/Makefile                      |  6 +++
 arch/arm/mach-exynos/common.c                      | 34 ++++++++++++++
 arch/arm/mach-exynos/common.h                      |  2 +
 arch/arm/mach-exynos/exynos-smc.S                  | 22 +++++++++
 arch/arm/mach-exynos/firmware.c                    | 54 ++++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h            |  3 ++
 arch/arm/mach-exynos/mach-exynos4-dt.c             |  1 +
 arch/arm/mach-exynos/platsmp.c                     | 36 ++++++++++++---
 arch/arm/mach-exynos/smc.h                         | 31 +++++++++++++
 arch/arm/plat-samsung/include/plat/map-s5p.h       |  1 +
 14 files changed, 243 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/common/firmware.c
 create mode 100644 arch/arm/include/asm/firmware.h
 create mode 100644 arch/arm/mach-exynos/exynos-smc.S
 create mode 100644 arch/arm/mach-exynos/firmware.c
 create mode 100644 arch/arm/mach-exynos/smc.h

-- 
1.7.12
