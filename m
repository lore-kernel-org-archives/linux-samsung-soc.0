From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] Documentation: ARM: EXYNOS: Update bootloader interface on
 Exynos542x
Date: Fri, 23 Oct 2015 13:19:17 +0900
Message-ID: <1445573957-28933-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Update the documentation about:
1. Usage of PMU_SPARE2 register.
   Bootloaders on Exynos542x-based boards often use the register
   PMU_SPARE2 (0x908) in the same way as on Exynos3250: as a indicator
   the secondary CPU was booted on. The bootloader will set this value
   to non-zero, after sucessfull power up of secondary CPU. In the same
   time this booted CPU will stuck (spin) waiting for software reset.
2. Exynos542x entry address for secondary CPU boot up after system
   suspend (with MCPM enabled and in non-secure mode).

See arch/arm/mach-exynos/mcpm-exynos.c for source code.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/arm/Samsung/Bootloader-interface.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/arm/Samsung/Bootloader-interface.txt b/Documentation/arm/Samsung/Bootloader-interface.txt
index df8d4fb85939..ed494ac0beb2 100644
--- a/Documentation/arm/Samsung/Bootloader-interface.txt
+++ b/Documentation/arm/Samsung/Bootloader-interface.txt
@@ -19,7 +19,7 @@ executing kernel.
 Address:      sysram_ns_base_addr
 Offset        Value                                        Purpose
 =============================================================================
-0x08          exynos_cpu_resume_ns                         System suspend
+0x08          exynos_cpu_resume_ns, mcpm_entry_point       System suspend
 0x0c          0x00000bad (Magic cookie)                    System suspend
 0x1c          exynos4_secondary_startup                    Secondary CPU boot
 0x1c + 4*cpu  exynos4_secondary_startup (Exynos4412)       Secondary CPU boot
@@ -56,7 +56,8 @@ Offset        Value                                        Purpose
 Address:      pmu_base_addr
 Offset        Value                           Purpose
 =============================================================================
-0x0908        Non-zero (only Exynos3250)      Secondary CPU boot up indicator
+0x0908        Non-zero                        Secondary CPU boot up indicator
+                                              on Exynos3250 and Exynos542x
 
 
 4. Glossary
-- 
1.9.1
