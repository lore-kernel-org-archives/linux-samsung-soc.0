From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v4 00/14] drm/exynos: support LCD I80 interface display
Date: Thu, 05 Jun 2014 15:19:40 +0900
Message-ID: <1401949194-20092-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This series adds LCD I80 interface display support for Exynos DRM driver.
The FIMD(display controller) specification describes it as "LCD I80 interface"
and the DSI specification describes it as "Command mode interface".

This is based on exynos-drm-next branch.

The previous patches,
RFC: http://www.spinics.net/lists/dri-devel/msg58898.html
V1: http://www.spinics.net/lists/dri-devel/msg59291.html
V2: http://www.spinics.net/lists/dri-devel/msg59867.html
V3: http://www.spinics.net/lists/dri-devel/msg60708.html

Changelog v2:
- Fixes typo and removes unnecessary error log (commented by Andrzej Hazda)
- Adds missed pendlig_flip flag clear points (commented by Daniel Kurtz)

Changelog v3:
- Removes generic command mode and command mode display timing interface.
- Moves I80 interface timings from panel DT to the FIMD(display controller) DT.

Changelog v4:
- Removes exynos5 sysreg(syscon) DT bindings and node from dtsi because
  it was already updated by linux-samsung-soc (commented by Vivek Gautam)

Patches 1 and 2 fix trivial bugs.

Patches 3, 4, 5 and 6 implement FIMD(display controller) I80 interface.
The MIPI DSI command mode based panel generates Tearing Effect synchronization
signal between MCU and FB to display video image, and FIMD should trigger to
transfer video image at this signal.
So the panel should receive the TE IRQ and call TE handler chains to notify
it to the FIMD.

Patches 7 and 8 implement to use Exynos5420 SoC DSI driver which is different
from previous Exynos4 SoCs for some registers control.

Patches 9 and 10 introduce MIPI DSI command mode based Samsung S6E3FA0 AMOLED
5.7" LCD drm panel driver.

The ohters add DT property nodes to support MIPI DSI command mode.

I welcome any comments.

Thank you.
Best regards YJ

YoungJun Cho (14):
  drm/exynos: dsi: move the EoT packets configuration point
  drm/exynos: use wait_event_timeout() for safety usage
  ARM: dts: samsung-fimd: add LCD I80 interface specific properties
  drm/exynos: add TE handler to support LCD I80 interface
  drm/exynos: dsi: add TE handler to support LCD I80 interface
  drm/exynos: fimd: support LCD I80 interface
  ARM: dts: exynos_dsim: add exynos5420 compatible to DT bindings
  drm/exynos: dsi: add driver data to support Exynos5420
  ARM: dts: s6e3fa0: add DT bindings
  drm/panel: add S6E3FA0 driver
  ARM: dts: exynos4: add system register property
  ARM: dts: exynos5: add system register property
  ARM: dts: exynos5420: add mipi-phy node
  ARM: dts: exynos5420: add dsi node

 .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   46 ++
 .../devicetree/bindings/video/exynos_dsim.txt      |    4 +-
 .../devicetree/bindings/video/samsung-fimd.txt     |   28 +
 arch/arm/boot/dts/exynos4.dtsi                     |    1 +
 arch/arm/boot/dts/exynos5.dtsi                     |    1 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   20 +
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |   18 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h           |    7 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    3 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  175 +++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  287 ++++++++--
 drivers/gpu/drm/panel/Kconfig                      |    7 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-s6e3fa0.c              |  568 ++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |    8 +
 include/video/samsung_fimd.h                       |    3 +-
 17 files changed, 1107 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
 create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c

-- 
1.7.9.5
