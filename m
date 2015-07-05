From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH] Documentation: ARM: EXYNOS: Extend boot loader interface
 documentation
Date: Sun,  5 Jul 2015 11:56:51 +0900
Message-ID: <1436065011-6999-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Extend the kernel-bootloader interface documentation with usage of
register INFORM1 (0x0804) and different CPU resume address on Exynos542x
family (with Multi-Cluster Power Management enabled).

Additionally add glossary and reformat section titles.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 Documentation/arm/Samsung/Bootloader-interface.txt | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/arm/Samsung/Bootloader-interface.txt b/Documentation/arm/Samsung/Bootloader-interface.txt
index b96ead9a6919..df8d4fb85939 100644
--- a/Documentation/arm/Samsung/Bootloader-interface.txt
+++ b/Documentation/arm/Samsung/Bootloader-interface.txt
@@ -15,6 +15,7 @@ executing kernel.
 
 
 1. Non-Secure mode
+
 Address:      sysram_ns_base_addr
 Offset        Value                                        Purpose
 =============================================================================
@@ -28,6 +29,7 @@ Offset        Value                                        Purpose
 
 
 2. Secure mode
+
 Address:      sysram_base_addr
 Offset        Value                                        Purpose
 =============================================================================
@@ -40,14 +42,25 @@ Offset        Value                                        Purpose
 Address:      pmu_base_addr
 Offset        Value                                        Purpose
 =============================================================================
-0x0800        exynos_cpu_resume                            AFTR
+0x0800        exynos_cpu_resume                            AFTR, suspend
+0x0800        mcpm_entry_point (Exynos542x with MCPM)      AFTR, suspend
+0x0804        0xfcba0d10 (Magic cookie)                    AFTR
+0x0804        0x00000bad (Magic cookie)                    System suspend
 0x0814        exynos4_secondary_startup (Exynos4210 r1.1)  Secondary CPU boot
 0x0818        0xfcba0d10 (Magic cookie, Exynos4210 r1.1)   AFTR
 0x081C        exynos_cpu_resume (Exynos4210 r1.1)          AFTR
 
 
 3. Other (regardless of secure/non-secure mode)
+
 Address:      pmu_base_addr
 Offset        Value                           Purpose
 =============================================================================
 0x0908        Non-zero (only Exynos3250)      Secondary CPU boot up indicator
+
+
+4. Glossary
+
+AFTR - ARM Off Top Running, a low power mode, Cortex cores and many other
+modules are power gated, except the TOP modules
+MCPM - Multi-Cluster Power Management
-- 
2.1.4
