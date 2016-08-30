From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 3/4] arm64: dts: exynos: DeviceTree ARM64 for v4.9
Date: Tue, 30 Aug 2016 11:18:58 +0200
Message-ID: <1472548739-20050-4-git-send-email-k.kozlowski@samsung.com>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This is an old one. It was ready for v4.8 but then Marc Zynger posted
some conflicting change so I postponed it. Marc's patch didn't get in,
so there is no reason to wait.

No conflict expected yet, but if you apply Marc's "arm64: dts: Fix
broken architected timer interrupt trigger" then proper resolution would be:

arch/arm64/boot/dts/exynos/exynos7.dtsi:

+                       interrupts = <GIC_PPI 13
+                                       (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+                                    <GIC_PPI 14
+                                       (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+                                    <GIC_PPI 11
+                                       (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+                                    <GIC_PPI 10
+                                       (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;


Best regards,
Krzysztof

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.9

for you to fetch changes up to 36d1c9cd07cd6a065f1dde3cbbfe3a9867d693a4:

  arm64: dts: exynos: Use human-friendly symbols for timer interrupt flags (2016-08-10 11:09:46 +0200)

----------------------------------------------------------------
Samsung DeviceTree ARM64 update for v4.9:
1. Use human-friendly symbols for interrupt flags.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: exynos: Use human-friendly symbols for timer interrupt flags

 arch/arm64/boot/dts/exynos/exynos7.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
