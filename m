From: Jonghwa Lee <jonghwa3.lee@samsung.com>
Subject: [PATCH 0/2] ARM: EXYNOS3250: Add support EXYNOS3250 suspend/resume.
Date: Fri, 26 Sep 2014 16:23:20 +0900
Message-ID: <1411716202-31644-1-git-send-email-jonghwa3.lee@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, cw00.choi@samsung.com, vikas.sajjan@samsung.com, Jonghwa Lee <jonghwa3.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patches adds and modifies exynos suspend driver to support exynos3250's
suspend/resume. To work suspend/resume, it also needs a work at pmu driver.
It'll be supported after refactoring job on pmu driver is done.

Jonghwa Lee (2):
  ARM: EXYNOS: suspend: Make restoring registers into selectable
    option.
  ARM: EXYNOS3250: Add initial support EXYNOS3250 suspend/resume.

 arch/arm/mach-exynos/regs-pmu.h |    4 +++
 arch/arm/mach-exynos/suspend.c  |   70 +++++++++++++++++++++++++++++----------
 2 files changed, 56 insertions(+), 18 deletions(-)

-- 
1.7.9.5
