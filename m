From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 0/5] clk/exynos5420: add clocks for hdmi subsystem
Date: Mon, 26 Aug 2013 14:42:58 +0530
Message-ID: <1377508383-15185-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25337 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756674Ab3HZIvK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 04:51:10 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MS40051NR8RM4X0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Aug 2013 17:51:08 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add clock changes for hdmi subsystem for exynos5250 SoC. These
include addition of new clocks like mout_hdmi and smmu_tv, associating
ID to clk_hdmiphy and some essential corrections.

V3:
1) Assign new ID to divider clock keeping sclk_pixel gate same.

V2:
1) Rebase to Mike's Tree.
2) Change smmu_tv to smmu_mixer.

This set is based on Mike's clk-next branch at
https://git.linaro.org/gitweb?p=people/mturquette/linux.git

Rahul Sharma (5):
  clk/exynos5420: add sclk_hdmiphy to the list of special clocks
  clk/exynos5420: add gate clock for mixer sysmmu
  clk/exynos5420: fix the order of parents of hdmi mux
  clk/exynos5420: add hdmi mux to change parents in hdmi driver
  clk/exynos5420: assign dout_pixel id to pixel clock divider

 .../devicetree/bindings/clock/exynos5420-clock.txt  |   12 ++++++++++++
 drivers/clk/samsung/clk-exynos5420.c                |   19 +++++++++++++------
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
1.7.10.4
