From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/2] ARM: dts: Fix the number of DMA channels for Exynos3250/4
Date: Wed, 12 Nov 2014 11:41:06 +0900
Message-ID: <1415760068-765-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: ben-linux@fluff.org, kyungmin.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch fix minor issuse to correct the number of DMA channels for
Exynos3250 and Exynos4 series. The PL330 DMA of Exynos3250/Exynos4 support
16 channels simultaneously but, PL330 DMA driver don't use 'dma-channels'
property directly. This patchset fix the correct information
of Exynos3250/Exynos4's PL330 DMA simply.

Chanwoo Choi (2):
  ARM: dts: Fix the number of DMA channels for Exynos3250
  ARM: dts: Fix the number of DMA channels for Exynos4

 arch/arm/boot/dts/exynos3250.dtsi | 4 ++--
 arch/arm/boot/dts/exynos4.dtsi    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.5.5
