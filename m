From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 0/5] clk/exynos5250: add clocks for hdmi subsystem
Date: Wed, 24 Jul 2013 19:43:30 +0530
Message-ID: <1374675215-27862-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33300 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751035Ab3GXNvG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 09:51:06 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQG0011914X8360@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 22:51:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add clock changes for hdmi subsystem for exynos5250 SoC. These
include addition of new clocks like mout_hdmi and smmu_tv, associating
ID to clk_hdmiphy and some essential corrections.

This set is based on kukjin's for-next branch at
http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.

V3:
1) Rebase to kgene for-next based on 3.11-rc1.
2) Added Tushar's patch in the series.

V2:
1) Dropped "clk/exynos5250: Fix HDMI clock number in documentation" as
it already get merged.

Rahul Sharma (4):
  clk/exynos5250: add mout_hdmi mux clock for hdmi
  clk/exynos5250: add sclk_hdmiphy in the list of special clocks
  clk/exynos5250: add clock for mixer sysmmu
  clk/exynos5250: change parent to aclk200_disp1 for hdmi subsystem

Tushar Behera (1):
  Documentation: exynos5250-clock: Add div_i2s1 and div_i2s2

 .../devicetree/bindings/clock/exynos5250-clock.txt |   12 ++++++++++++
 drivers/clk/samsung/clk-exynos5250.c               |   20 ++++++++++++++------
 2 files changed, 26 insertions(+), 6 deletions(-)

-- 
1.7.10.4
