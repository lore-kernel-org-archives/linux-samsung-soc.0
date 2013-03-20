From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V3 0/2] Add FIMD DT support for Exynos5 DT Machines
Date: Wed, 20 Mar 2013 06:22:33 -0400
Message-ID: <1363774955-22784-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8558 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185Ab3CTKCj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Mar 2013 06:02:39 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJY00ELBEJH4CD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Mar 2013 19:02:37 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MJY00DPMEK4HJ70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Mar 2013 19:02:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com

This patch series adds support for FIMD DT for Exynos5 DT Machines
Adds display timing node for smdk5250 board.

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
