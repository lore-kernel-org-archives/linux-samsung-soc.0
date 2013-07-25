From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 0/6] clk/exynos5250: add clocks for hdmi subsystem
Date: Thu, 25 Jul 2013 10:37:31 +0530
Message-ID: <1374728857-4208-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53576 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106Ab3GYEow (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 00:44:52 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQH00K8H6IGIMK0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Jul 2013 13:44:51 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add clock changes for hdmi subsystem for exynos5250 SoC. These
include addition of new clocks like mout_hdmi and smmu_tv, associating
ID to clk_hdmiphy and some essential corrections.

This set is based on kukjin's for-next branch at
http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.

V4:
1) Added Arun's patch hdmi clock number correction in this series.
2) Corrected clock number for smmu_mixer

V3:
1) Rebase to kgene for-next based on 3.11-rc1.
2) Added Tushar's patch in the series.

V2:
1) Dropped "clk/exynos5250: Fix HDMI clock number in documentation" as
it already get merged.

Arun Kumar K (1):
  clk/exynos5250: Fix HDMI clock number in documentation

Rahul Sharma (4):
  clk/exynos5250: add mout_hdmi mux clock for hdmi
  clk/exynos5250: add sclk_hdmiphy in the list of special clocks
  clk/exynos5250: add clock for mixer sysmmu
  clk/exynos5250: change parent to aclk200_disp1 for hdmi subsystem

Tushar Behera (1):
  Documentation: exynos5250-clock: Add div_i2s1 and div_i2s2

 .../devicetree/bindings/clock/exynos5250-clock.txt |   14 +++++++++++++-
 drivers/clk/samsung/clk-exynos5250.c               |   20 ++++++++++++++------
 2 files changed, 27 insertions(+), 7 deletions(-)

-- 
1.7.10.4
