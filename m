From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/8] watchdog: s3c2410: Fixes and improvements
Date: Fri, 24 Feb 2017 17:11:14 +0200
Message-ID: <20170224151122.12142-1-krzk@kernel.org>
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
To: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Minor cleanup and some fixes for the watchdog used on all
Samsung SoCs.

The patches are independent of each other - DTS will go through
separate (my) tree.


Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  watchdog: s3c2410: Remove confusing CONFIG prefix from local defines
  watchdog: s3c2410: Fix infinite interrupt in soft mode
  ARM: dts: exynos: Fix watchdog reset on Exynos4412
  ARM: dts: s3c64xx: Enable watchdog on all S3C64xx boards
  ARM: dts: exynos: Enable watchdog on all Exynos4 boards
  ARM: dts: exynos: Fix infinite interrupt in soft mode on Exynos5440
  ARM: dts: s3c64xx: Fix infinite interrupt in soft mode
  ARM: dts: s5pv210: Fix infinite interrupt in soft mode

 .../devicetree/bindings/watchdog/samsung-wdt.txt   |  9 +++---
 arch/arm/boot/dts/exynos4.dtsi                     |  9 ------
 arch/arm/boot/dts/exynos4210-origen.dts            |  4 ---
 arch/arm/boot/dts/exynos4210.dtsi                  |  8 +++++
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi    |  4 ---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |  4 ---
 arch/arm/boot/dts/exynos4412-origen.dts            |  4 ---
 arch/arm/boot/dts/exynos4412.dtsi                  |  9 ++++++
 arch/arm/boot/dts/exynos5440.dtsi                  |  2 +-
 arch/arm/boot/dts/s3c64xx.dtsi                     |  3 +-
 arch/arm/boot/dts/s5pv210.dtsi                     |  2 +-
 drivers/watchdog/s3c2410_wdt.c                     | 37 +++++++++++++++-------
 12 files changed, 51 insertions(+), 44 deletions(-)

-- 
2.9.3
