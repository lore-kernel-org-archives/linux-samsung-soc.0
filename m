From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/5] clk/exynos5250: add clocks for hdmi subsystem
Date: Mon, 10 Jun 2013 16:30:57 +0530
Message-ID: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39428 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753113Ab3FJKiT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Jun 2013 06:38:19 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO60036YAVTXDP0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Jun 2013 19:38:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, arun.kk@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add clock changes for hdmi subsystem for exynos5250 SoC. These
include addition of new clocks like mout_hdmi and smmu_tv, associating
ID to clk_hdmiphy and some essential corrections.

This set is based on kukjin's for-next branch at
http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.

Arun Kumar K (1):
  clk/exynos5250: Fix HDMI clock number in documentation

Rahul Sharma (4):
  clk/exynos5250: add mout_hdmi mux clock for hdmi
  clk/exynos5250: add sclk_hdmiphy in the list of special clocks
  clk/exynos5250: add clock for tv sysmmu
  clk/exynos5250: change parent to aclk200_disp1 for hdmi subsystem

 .../devicetree/bindings/clock/exynos5250-clock.txt   |   12 +++++++++++-
 drivers/clk/samsung/clk-exynos5250.c                 |   18 +++++++++++++-----
 2 files changed, 24 insertions(+), 6 deletions(-)

-- 
1.7.10.4
