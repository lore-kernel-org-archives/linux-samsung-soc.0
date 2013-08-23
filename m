From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 0/5] clk/exynos5420: add clocks for hdmi subsystem
Date: Fri, 23 Aug 2013 12:27:53 +0530
Message-ID: <1377241078-11808-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45438 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754634Ab3HWGgK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Aug 2013 02:36:10 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRZ00KEO1046R90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Aug 2013 15:36:08 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add clock changes for hdmi subsystem for exynos5250 SoC. These
include addition of new clocks like mout_hdmi and smmu_tv, associating
ID to clk_hdmiphy and some essential corrections.

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
  clk/exynos5420: assign sclk_pixel id to pixel clock divider

 .../devicetree/bindings/clock/exynos5420-clock.txt   |    7 +++++++
 drivers/clk/samsung/clk-exynos5420.c                 |   18 +++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

-- 
1.7.10.4
