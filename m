From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 0/4] Improvements on exynos7 clock
Date: Wed, 26 Aug 2015 09:00:40 +0530
Message-ID: <1440559844-12572-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41546 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816AbbHZDjb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 23:39:31 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTO00P197HHNX90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Aug 2015 12:39:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com

This patch series are minor improvement over the current
exynos7 clock file. This fix some bugs and update the clock
bits as per user manual.

Changes from v1:
* Fix review comments by Krzysztof [1].
* Added Padmavathi's Singed-of-by for patch# 3 and 4, 
  as I see [2] which are similar, looks like these never merged.

[1]-> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg46082.html
[2]-> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/311648.html

This serise is tested on exynos7-espresso board.

Alim Akhtar (4):
  clk: samsung: exynos7: Fix CMU TOPC block clock
  clk: samsung: exynos7: Fix CMU TOP1 block
  clk: samsung: exynos7: Correct nr_clk_ids for fsys0
  clk: samsung: exynos7: Correct nr_clk_ids for fsys1

 drivers/clk/samsung/clk-exynos7.c |   46 +++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

-- 
1.7.10.4
