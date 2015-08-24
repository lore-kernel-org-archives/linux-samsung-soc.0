From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 0/4] Improvements on exynos7 clock
Date: Mon, 24 Aug 2015 16:35:52 +0530
Message-ID: <1440414356-1805-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46591 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751475AbbHXLPR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 07:15:17 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTL00P6938P1070@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Aug 2015 20:14:49 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com

This patch series are minor improvement over the current
exynos7 clock file. This fix some bugs and update the clock
bits as per latest user manual.

This serise is tested on exynos7-espresso board.

Alim Akhtar (4):
  clk: samsung: exynos7: Update CMU TOPC block clock
  clk: samsung: exynos7: Update CMU TOP1 block
  clk: samsung: exynos7: Correct nr_clk_ids for fsys0
  clk: samsung: exynos7: correct nr_clk_ids for fsys1

 drivers/clk/samsung/clk-exynos7.c |   49 +++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 21 deletions(-)

-- 
1.7.10.4
