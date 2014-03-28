From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 00/12] Add DSI display support for Exynos based boards
Date: Fri, 28 Mar 2014 12:52:35 +0100
Message-ID: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
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
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patchset adds drivers and bindings to the following devices:
- Exynos DSI master,
- S6E8AA0 DSI panel,

It adds also display support in DTS files for the following boards:
- Exynos4210/Trats,
- Exynos4412/Trats2.

The patchset is based on exynos_drm_next branch.

It is the 3rd iteration of the patches, main changes:
- based on exynos_drm_next branch,
- added video interface bindings between DSI host and slave,
  it seems to me to be redundand, and I hope when video interface bindings
  will be stabilized it can become optional,
- GPIOs implemented using gpiod framework,
- removed controversial stuff (toshiba bridge implementation and arndale support),
  it will be send in another set of patches

Other changes are described in individual patches.

Regards
Andrzej


Andrzej Hajda (12):
  drm/mipi_dsi: add flags to DSI messages
  drm/mipi_dsi: create dsi devices only for nodes with reg property
  drm/exynos: disallow fbdev initialization if no device is connected
  exynos/dsim: add DT bindings
  drm/exynos: add DSIM driver
  panel/s6e8aa0: add DT bindings
  drm/panel: add S6E8AA0 driver
  ARM: dts: exynos4: add MIPI DSI Master node
  ARM: dts: exynos4210-trats: add panel node
  ARM: dts: exynos4412-trats2: add panel node
  ARM: dts: exynos4210-trats: enable exynos/fimd node
  ARM: dts: exynos4412-trats2: enable exynos/fimd node

 .../devicetree/bindings/panel/samsung,s6e8aa0.txt  |   56 +
 .../devicetree/bindings/video/exynos_dsim.txt      |   80 +
 arch/arm/boot/dts/exynos4.dtsi                     |   14 +
 arch/arm/boot/dts/exynos4210-trats.dts             |   61 +
 arch/arm/boot/dts/exynos4412-trats2.dts            |   70 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |    6 +-
 drivers/gpu/drm/exynos/Kconfig                     |    9 +
 drivers/gpu/drm/exynos/Makefile                    |    1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   15 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 1525 ++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   21 +
 drivers/gpu/drm/panel/Kconfig                      |    7 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-s6e8aa0.c              | 1069 ++++++++++++++
 include/drm/drm_mipi_dsi.h                         |    6 +
 16 files changed, 2941 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt
 create mode 100644 Documentation/devicetree/bindings/video/exynos_dsim.txt
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_dsi.c
 create mode 100644 drivers/gpu/drm/panel/panel-s6e8aa0.c

-- 
1.8.3.2
