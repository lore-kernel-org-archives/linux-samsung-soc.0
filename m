From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH 0/9] Exynos DSI master and S6E8AA0 panel drivers
Date: Wed, 22 Jan 2014 15:35:26 +0100
Message-ID: <1390401336-22915-1-git-send-email-a.hajda@samsung.com>
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
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patch set adds bindings and drivers to Exynos MIPI-DSI host and S6E8AA0 panel.
Both devices are present in Trats and Trats2 targets which are present
in mainline kernel and currently have no display support.
Patchset contains also patches adding corresponding DTS nodes to both devices.

Both drivers are based on patches posted by Tomasz [2].

Drivers have been successfully tested on both devices.

Exynos DSI driver supports only video mode, command mode will be added later.

Patchset contains two additional patches:
- 1st patch corrects porch calculation in function introduced by refactoring
  patches [1],
- 2nd patch delays fbdev initialization to allow fbdev work with devices

Patches are based on branch next-20131211 plus exynos refactoring patches
by Sean Paul [1] plus resolving many merge conflicts.
I have also cherry-picked patches adding drm_panel and drm_mipi_dsi support which
were not merged at this time. I hope Sean's patches will be merged soon,
so I could rebase this patchset in saner way.

[1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/94358
[2]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/15684

Regards
Andrzej

Andrzej Hajda (9):
  drm/exynos: correct timing porch conversion
  drm/exynos: delay fbdev initialization until an output is connected
  exynos/dsim: add DT bindings
  drm/exynos: add DSIM driver
  panel/s6e8aa0: add DT bindings
  drm/panel: add s6e8aa0 driver
  ARM: dts: exynos4: add MIPI DSI Master node
  ARM: dts: exynos4210-trats: add panel node
  ARM: dts: exynos4412-trats2: add panel node

 .../devicetree/bindings/panel/samsung-s6e8aa0.txt  |   53 +
 .../devicetree/bindings/video/exynos_dsim.txt      |   48 +
 arch/arm/boot/dts/exynos4.dtsi                     |   14 +
 arch/arm/boot/dts/exynos4210-trats.dts             |   36 +
 arch/arm/boot/dts/exynos4412-trats2.dts            |   45 +
 drivers/gpu/drm/exynos/Kconfig                     |    9 +
 drivers/gpu/drm/exynos/Makefile                    |    1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   26 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 1393 ++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |    3 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |    4 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   11 +-
 drivers/gpu/drm/panel/Kconfig                      |    7 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-s6e8aa0.c              | 1046 +++++++++++++++
 16 files changed, 2678 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung-s6e8aa0.txt
 create mode 100644 Documentation/devicetree/bindings/video/exynos_dsim.txt
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_dsi.c
 create mode 100644 drivers/gpu/drm/panel/panel-s6e8aa0.c

-- 
1.8.3.2
