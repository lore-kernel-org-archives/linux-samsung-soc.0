From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V4 0/2] Add FIMD DT support for Exynos5 DT Machines
Date: Fri, 22 Mar 2013 03:14:37 -0400
Message-ID: <1363936479-4905-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24502 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932836Ab3CVGyq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Mar 2013 02:54:46 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK100KRMV76VS80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Mar 2013 15:54:42 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com

This patch series adds support for FIMD DT for Exynos5 DT Machines
Adds display timing node for smdk5250 board.

changes since V3:
	- changed the clock names "sclk_fimd1" and "fimd1" to "sclk_fimd" and "fimd"
	  in the exynos5250.dtsi file

changes since V2:
	- added interrupt-names = "fifo", "vsync", "lcd_sys"
	- removed the patch "ARM: Exynos5: add FIMD AUXDATA entry for exynos5 DT",
          as migration to Common Clock Framework will NOT need this.

changes since v1:
        - modified compatible string for exynos5 fimd as "exynos5250-fimd"

This series is rebased on branch
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=shortlog;h=refs/heads/for-next

This series depends on 
https://patchwork.kernel.org/patch/2306391/

Leela Krishna Amudala (2):
  ARM: dts: Add FIMD node to exynos5
  ARM: dts: Add display timing node to exynos5250-smdk5250.dts

 arch/arm/boot/dts/exynos5250-smdk5250.dts | 16 ++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         | 10 ++++++++++
 2 files changed, 26 insertions(+)

-- 
1.8.0
