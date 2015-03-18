From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] clk: samsung: exynos5433: Fix wrong offset and remove
 specific CONFIG_ARCH_EXYNOS5433
Date: Wed, 18 Mar 2015 09:42:30 +0900
Message-ID: <1426639352-6255-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes the wrong offset of PCLK_MSCL_SECURE_SMMU_JPEG in CMU_MSCL
domain and removes the specific CONFIG_ARCH_EXYNOS5433 instead use the
CONFIG_ARCH_EXYNOS. Because Arnd Bergmann gave me a comment[1] that don't add
specific CONFIG_ARCH_EXYNOS5433 for ARM-64bit SoC. So, I send the Exynos5433
devicetree patch-set[2] without adding CONFIG_ARCH_EXYNOS5433.

[1] https://lkml.org/lkml/2015/2/24/85
[2] [PATCH v7 0/9] arm64: Add the support for new Exynos5433 SoC
    - https://lkml.org/lkml/2015/3/17/843

Chanwoo Choi (1):
  clk: samsung: Use CONFIG_ARCH_EXYNOS instead of CONFIG_ARCH_EXYNOS5433

Jonghwa Lee (1):
  clk: samsung: exynos5433: Fix wrong offset of PCLK_MSCL_SECURE_SMMU_JPEG

 drivers/clk/samsung/Makefile         | 2 +-
 drivers/clk/samsung/clk-exynos5433.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
