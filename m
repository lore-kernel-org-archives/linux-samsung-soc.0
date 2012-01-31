From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH 0/2] EXYNOS4_DT fixes for 3.3-rc1+ kernels
Date: Tue, 31 Jan 2012 11:36:31 +0100
Message-ID: <1328006193-13902-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thomas.abraham@linaro.org
Cc: m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Device Tree-based Exynos4 machine prepared by Thomas Abraham and
included in 3.3-rc1 hasn't been adjusted to changes that have happened
to mach-exynos during 3.3 merge window.

Following patch series fixes one build and one boot error making it
possible to boot system with SMP disabled.

SMP support is still broken for unknown reason, though.

[ To use it it's also required to cherry-pick "ARM: EXYNOS: fix
  non-SMP builds for EXYNOS4" already found in kgene's
  linux-samsung.git (branch v3.3-samsung-fixes-2) ]


Karol Lewandowski (2):
  ARM: Exynos4: Make exynos4-dt compile again
  ARM: Exynos4: Convert exynos4-dt to CONFIG_MULTI_IRQ_HANDLER

 arch/arm/mach-exynos/mach-exynos4-dt.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)
-- 
1.7.8.3
