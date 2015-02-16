From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/3] thermal: exynos: Fix NULL pointer error and bug of
 PD_DET_EN of Exynos7
Date: Mon, 16 Feb 2015 23:20:11 +0900
Message-ID: <1424096414-4327-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22853 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755706AbbBPOUV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Feb 2015 09:20:21 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com
Cc: kgene@kernel.org, b.zolnierkie@samsung.com, kyungmin.park@samsung.com, amit.daniel@samsung.com, l.majewski@samsung.com, a.kesavan@samsung.com, inki.dae@samsung.com, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>

This patch-set fix NULL pointer error during kernel booting and the bug of
PD_DET_EN bit field of Exynos7 TMU. And the clean-up the exynos compatible
table by making oneline entry.

Chanwoo Choi (3):
  thermal: exynos: Fix NULL pointer exception during kernel booting
  thermal: exynos: Fix wrong control of power down detection mode for Exynos7
  thermal: exynos: Clean-up code to use oneline entry for exynos compatible table

 drivers/thermal/samsung/exynos_tmu.c | 51 ++++++++++++------------------------
 1 file changed, 17 insertions(+), 34 deletions(-)

-- 
1.8.5.5
