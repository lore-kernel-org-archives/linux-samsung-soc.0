From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH 0/2] Add device tree and clock support for Gscaler.
Date: Fri, 06 Jul 2012 18:15:00 +0530
Message-ID: <1341578702-10263-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13224 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914Ab2GFMbV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jul 2012 08:31:21 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Q00I31O3JC320@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Jul 2012 21:31:20 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Q003Y0O3Z1X20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Jul 2012 21:31:19 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, olofj@google.com, prashanth.g@samsung.com, joshi@samsung.com, ameersk@gmail.com, thomas.ab@samsung.com

This patch series adds clock support for Gscaler and device node
 entries for Gscaler on exynos5.

This patch is based Kukjin Kim's for-next branch.
 https://github.com/kgene/linux-samsung.git

Shaik Ameer Basha (2):
  ARM: EXYNOS5: Add clock support for Gscaler
  ARM: EXYNOS5: Add gscalar device from DT

 arch/arm/boot/dts/exynos5250.dtsi      |   31 ++++++++++++
 arch/arm/mach-exynos/clock-exynos5.c   |   79 ++++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/mach-exynos5-dt.c |    8 +++
 3 files changed, 118 insertions(+), 0 deletions(-)
