From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/5] clk/exynos5420: add clocks for hdmi subsystem
Date: Tue, 18 Jun 2013 20:03:13 +0530
Message-ID: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51123 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932855Ab3FROJo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 10:09:44 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOL00175E07N890@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Jun 2013 23:09:43 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add clock changes for hdmi subsystem for exynos5250 SoC. These
include addition of new clocks like mout_hdmi and smmu_tv, associating
ID to clk_hdmiphy and some essential corrections.

This set is based on kukjin's for-next branch at
http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.

This set dependents on the following patches which add support for Exynos5420
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg19264.html

Rahul Sharma (5):
  clk/exynos5420: add sclk_hdmiphy to the list of special clocks
  clk/exynos5420: add gate clock for tv sysmmu
  clk/exynos5420: fix the order of parents of hdmi mux
  clk/exynos5420: add hdmi mux to change parents in hdmi driver
  clk/exynos5420: assign sclk_pixel id to pixel clock divider

 .../devicetree/bindings/clock/exynos5420-clock.txt   |    7 +++++++
 drivers/clk/samsung/clk-exynos5420.c                 |   18 +++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

-- 
1.7.10.4
