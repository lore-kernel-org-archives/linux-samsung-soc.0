From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/3]  clk: samsung: Use samsung_cmu_register_one() to simplify
 code
Date: Tue, 23 Dec 2014 16:40:20 +0900
Message-ID: <1419320423-19228-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58515 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751976AbaLWHk2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Dec 2014 02:40:28 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This patch-set uses the samsung_cmu_register_one() function to simplify the
clock driver for Exynos3250/Exynos4415 SoC and change return value of
samsung_cmu_register_one() because some clock driver may need the instance
of samsung_clk_provider structure.

Chanwoo Choi (3):
  clk: samsung: Changes the return value of samsung_cmu_register_one()
  clk: samsung: exynos3250: Use samsung_cmu_register_one() to simplify code
  clk: samsung: exynos4415: Use samsung_cmu_register_one() to simplify code

 drivers/clk/samsung/clk-exynos3250.c | 217 ++++++++---------------------------
 drivers/clk/samsung/clk-exynos4415.c | 216 ++++++++--------------------------
 drivers/clk/samsung/clk.c            |  13 ++-
 drivers/clk/samsung/clk.h            |   3 +-
 4 files changed, 107 insertions(+), 342 deletions(-)

-- 
1.8.5.5
