From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [RFC V3 0/4] dw_mmc platform specific private data and SMU init
Date: Wed, 28 Aug 2013 17:38:47 +0530
Message-ID: <1377691731-7226-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:42305 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752791Ab3H1MJK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 08:09:10 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cjb@laptop.org, jh80.chung@samsung.com, tgih.jun@samsung.com
Cc: ks.giri@samsung.com, t.figa@samsung.com, alim.akhtar@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

changes from V2:
	1.dropped the bypass-smu quirk 
		mmc: dw_mmc: exynos: configure SMU in exynos5420.
	2.Changed the subject line for this patch
	  add a quirk for SMU -> configure SMU in exynos5420
	
	mmc: dw_mmc: exynos: configure SMU in exynos5420 
	was earlier 
	mmc: dw_mmc: exynos: add a quirk for SMU.

changes from V1:
	1.Added a new RFC patch 
		mmc: dw_mmc: socfpga: move socfpga private init
	2.Avoid code duplication in
		mmc: dw_mmc: exynos: add a quirk for SMU.

Yuvaraj Kumar C D (4):
  mmc: dw_mmc: exynos: move the exynos private init
  mmc: dw_mmc: socfpga: move socfpga private init
  mmc: dw_mmc: move the platform specific init call
  mmc: dw_mmc: exynos: configure SMU in exynos5420.

 drivers/mmc/host/dw_mmc-exynos.c  |   56 +++++++++++++++++++++++++++----------
 drivers/mmc/host/dw_mmc-pltfm.c   |    7 -----
 drivers/mmc/host/dw_mmc-socfpga.c |   29 ++++++++++---------
 drivers/mmc/host/dw_mmc.c         |    9 ++++++
 4 files changed, 65 insertions(+), 36 deletions(-)

-- 
1.7.9.5
