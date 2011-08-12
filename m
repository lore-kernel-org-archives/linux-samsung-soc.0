From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 0/2] Fixes for S5PV210 PM
Date: Fri, 12 Aug 2011 15:56:12 +0530
Message-ID: <1313144774-30607-1-git-send-email-a.kesavan@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17822 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753041Ab1HLKZS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:25:18 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPT002J48Y4MVS0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:17 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.92])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPT00BTU8Y1SP@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

This patchset fixes a compilation warning and removes an unwanted
Kconfig symbol.

Abhilash Kesavan (2):
  ARM: S5PV210: Fix build warning
  ARM: S5PV210: Remove unncessary symbol for PM

 arch/arm/mach-s5pv210/Kconfig  |    6 ------
 arch/arm/mach-s5pv210/Makefile |    2 +-
 arch/arm/mach-s5pv210/pm.c     |    2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

--
1.7.4.1
