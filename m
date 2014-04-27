From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v3 PATCH 00/16] drm/exynos: support MIPI DSI command mode display
Date: Sun, 27 Apr 2014 10:49:56 +0900
Message-ID: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch series includes the followings:
- FIMD I80 interface
- DSI command mode interface for Exynos5420 SoC
- S6E3FA0 command mode type panel driver

This patch series is based on exynos-drm-next branch.

Previous patch set,
RFC v1: http://www.spinics.net/lists/dri-devel/msg57513.html
RFC v2: http://www.spinics.net/lists/dri-devel/msg57945.html

Changelog v2:
- Moves panel delays and size DT properties to panel probe routine.
- Moves CPU timings relevant DT properties from FIMD to panel DT.

Changelog v3:
- Splits core and driver patchset.
- Renames CPU timings to CPU mode timings.
- Enhances panel code readability.

Thank you.
Best regards YJ

YoungJun Cho (16):
  drm/exynos: dsi: move the Eot packets configuration point
  drm/exynos: use wait_event_timeout() for safety usage
  ARM: dts: sysreg: add exynos5 compatible to DT bindings
  ARM: dts: samsung-fimd: add I80 specific properties
  drm/panel: add CPU mode timings structure
  drm/exynos: add TE handler to support MIPI DSI command mode interface
  drm/exynos: dsi: add TE handler to support command mode interface
  drm/exynos: fimd: support I80 interface
  ARM: dts: exynos_dsim: add exynos5420 compatible to DT bindings
  drm/exynos: dsi: add driver data to support Exynos5420
  ARM: dts: s6e3fa0: add DT bindings
  drm/panel: add S6E3FA0 driver
  ARM: dts: exynos4: add system register node
  ARM: dts: exynos5: add system register support
  ARM: dts: exynos5420: add mipi-phy node
  ARM: dts: exynos5420: add dsi node

 .../devicetree/bindings/arm/samsung/sysreg.txt     |    1 +
 .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   68 +++
 .../devicetree/bindings/video/exynos_dsim.txt      |    4 +-
 .../devicetree/bindings/video/samsung-fimd.txt     |    2 +
 arch/arm/boot/dts/exynos4.dtsi                     |    1 +
 arch/arm/boot/dts/exynos5.dtsi                     |    6 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   21 +
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |   16 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h           |    7 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    3 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  172 +++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  280 +++++++--
 drivers/gpu/drm/panel/Kconfig                      |    7 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-s6e3fa0.c              |  595 ++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |    8 +
 include/drm/drm_panel.h                            |   18 +
 include/video/samsung_fimd.h                       |    3 +-
 19 files changed, 1143 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
 create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c

-- 
1.7.9.5
