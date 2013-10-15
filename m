From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/7] clk: samsung: Exynos 5250 clock clean-up
Date: Tue, 15 Oct 2013 19:41:14 +0200
Message-ID: <1381858881-25611-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:11010 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933145Ab3JORle (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 13:41:34 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUQ004ZM159ZO90@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Oct 2013 18:41:33 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This is a clean-up series for the Exynos 5250 clock driver. It consists
mostly of stylistical fixes and also changes making the clock tree defined
by the driver represent more closely the real clock tree of the SoC.

On Exynos 5250 based Arndale board:
Tested-by: Tomasz Figa <t.figa@samsung.com>

Tomasz Figa (7):
  clk: samsung: exynos5250: Sort definitions by registers and bitfield
  clk: samsung: exynos5250: Make names of mux and div clocks consistent
  clk: samsung: exynos5250: Fix parents of gate clocks from GSCL domain
  clk: samsung: exynos5250: Fix parent of gate clocks from DISP1 domain
  clk: samsung: exynos5250: Add missing unpopulated mux parents
  clk: samsung: exynos5250: Correct parent list of audio muxes
  clk: samsung: exynos5250: Fix parents of gate clocks from MFC domain

 drivers/clk/samsung/clk-exynos5250.c | 404 ++++++++++++++++++++++-------------
 1 file changed, 256 insertions(+), 148 deletions(-)

-- 
1.8.3.2
