From: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Subject: [PATCH v2 0/5] ARM: S5PV210: move to common clk framework
Date: Wed, 28 Aug 2013 15:34:27 +0200
Message-ID: <1377696872-32069-1-git-send-email-m.krawczuk@partner.samsung.com>
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
To: kyungmin.park@samsung.com
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, kgene.kim@samsung.com, mturquette@linaro.org, Mateusz Krawczuk <m.krawczuk@partner.samsung.com>, thomas.abraham@linaro.org, linux-media@vger.kernel.org, t.stanislaws@samsung.com, devicetree@vger.kernel.org, ian.campbell@citrix.com, pawel.moll@arm.com, swarren@wwwdotorg.org, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, rob@landley.net, m.chehab@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch series is the new s5pv210 clock implementation
(using common clk framework).

This implementation is compatible with device tree definition and board files.

This patch series is based on linux-next and has been tested on goni and aquila 
boards using board file.

This patch series require adding new registration method
for PLL45xx and PLL46xx, which is included in this patch series:
clk: samsung: pll: Use new registration method for PLL46xx
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg21653.html
clk: samsung: pll: Use new registration method for PLL45xx
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg21652.html
clk: samsung: exynos4: Rename exynos4_plls to exynos4x12_plls
http://www.spinics.net/lists/arm-kernel/msg268486.html

Mateusz Krawczuk (5):
  media: s5p-tv: Restore vpll clock rate
  media: s5p-tv: Fix sdo driver to work with CCF
  media: s5p-tv: Fix mixer driver to work with CCF
  clk: samsung: Add clock driver for s5pc110/s5pv210
  ARM: s5pv210: Migrate clock handling to Common Clock Framework

 .../bindings/clock/samsung,s5pv210-clock.txt       |  72 ++
 arch/arm/mach-s5pv210/Kconfig                      |   9 +
 arch/arm/mach-s5pv210/Makefile                     |   4 +-
 arch/arm/mach-s5pv210/common.c                     |  17 +
 arch/arm/mach-s5pv210/common.h                     |  13 +
 arch/arm/mach-s5pv210/mach-aquila.c                |   1 +
 arch/arm/mach-s5pv210/mach-goni.c                  |   3 +-
 arch/arm/mach-s5pv210/mach-smdkc110.c              |   1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c              |   1 +
 arch/arm/mach-s5pv210/mach-torbreck.c              |   1 +
 arch/arm/plat-samsung/Kconfig                      |   2 +-
 arch/arm/plat-samsung/init.c                       |   2 -
 drivers/clk/samsung/Makefile                       |   3 +
 drivers/clk/samsung/clk-s5pv210.c                  | 733 +++++++++++++++++++++
 drivers/media/platform/s5p-tv/mixer_drv.c          |  35 +-
 drivers/media/platform/s5p-tv/sdo_drv.c            |  45 +-
 include/dt-bindings/clock/samsung,s5pv210-clock.h  | 221 +++++++
 17 files changed, 1140 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt
 create mode 100644 drivers/clk/samsung/clk-s5pv210.c
 create mode 100644 include/dt-bindings/clock/samsung,s5pv210-clock.h

-- 
1.8.1.2
