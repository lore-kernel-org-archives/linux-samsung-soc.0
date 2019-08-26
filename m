From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/2] Exynos SoCs: enable support for ARM Architected Timers
Date: Mon, 26 Aug 2019 12:31:40 +0200
Message-ID: <20190826103142.3477-2-m.szyprowski@samsung.com>
References: <20190826103142.3477-1-m.szyprowski@samsung.com>
 <CGME20190826103202eucas1p123d075e3da50b5aa1574ae46aa6aa946@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190826103142.3477-1-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Dear All,

ARM Architected Timers are present in all CortexA7/A15 based Samsung
Exynos SoCs. So far they were not enabled, because there were some issues
related to their initialization. Samsung Exynos SoCs used custom timer
hardware - Exynos MultiCore Timer. It turned out that enabling MCT it is
also needed to get ARM Architected Timers working, because they both
share some common hardware blocks (global system counter).

This patchset enables support for ARM Architected Timer driver together
with a standard Exynos MultiCore Timer driver, which is kept as a default
timer source on ARM 32bit platforms. Support for ARM architected timers
is essential for enabling proper KVM support on those platforms.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changelog:

v2:
- dropped MCT patches (merged to v5.1)
- dropped timer priority change patch (merged to v5.3)

v1: https://patchwork.kernel.org/cover/10814913/
- initial version, covers some MCT patches previously sent as a timer
  rework for Exynos5433


Patch summary:

Marek Szyprowski (2):
  ARM: dts: exynos: Add support ARM architected timers
  ARM: exynos: Enable support for ARM architected timers

 arch/arm/boot/dts/exynos3250.dtsi | 10 ++++++++++
 arch/arm/boot/dts/exynos5250.dtsi |  1 +
 arch/arm/boot/dts/exynos54xx.dtsi | 10 ++++++++++
 arch/arm/mach-exynos/Kconfig      |  1 +
 4 files changed, 22 insertions(+)

-- 
2.17.1
