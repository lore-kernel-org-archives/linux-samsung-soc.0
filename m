From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RFC 0/3] drm/exynos: refactoring drm initialization/cleanup
 code
Date: Thu, 17 Apr 2014 13:28:47 +0200
Message-ID: <1397734130-21019-1-git-send-email-a.hajda@samsung.com>
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
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

The patchset presents alternative approach to superdevice DT node
and components framework. It also refactors Exynos DRM device initialization.

The first patch uses linker sections to get rid of ifdef macros, it is not
essential for the rest of patchset but it makes code more readable.
Similar approach is used by irqchip, clks and clk_sources.
Any comments are welcome, especially regarding linker script usage in drivers.

The second patch proposes pending_components framework - lightweight alternative
for componentized devices.
Details are described in the patch description. But as it is an alternative for
component framework I would like to show differences:
- it is simpler and more straightforward,
- it requires only minimal changes to component drivers,
- only one callback to implement,
- no unwinding, component framework in case of error removes all already added
  components and unbinds all already bound components,
- it is instantiated per superdevice, component framework uses global list,
  the disadvantage is that we create dependency between components and
  the superdevice, but in case of Exynos DRM the dependency is present already,
- no two stage component initialization: probe, bind,
- it is more lightweight,
- it clearly separates device probing order issue from registering interfaces
  provided by the device.

The third patch implements pending_components framework in Exynos DRM.
Details are in patch description.

The patchset is based on exynos-drm-next branch.

Regards
Andrzej


Andrzej Hajda (3):
  drm/exynos: refactor drm drivers registration code
  drivers/base: provide lightweight framework for componentized devices
  drm/exynos: use pending_components for components tracking

 drivers/base/Kconfig                        |   3 +
 drivers/base/Makefile                       |   1 +
 drivers/base/pending_components.c           |  93 +++++++++++
 drivers/gpu/drm/exynos/Kconfig              |   1 +
 drivers/gpu/drm/exynos/Makefile             |   2 +
 drivers/gpu/drm/exynos/exynos_dp_core.c     |  38 +++--
 drivers/gpu/drm/exynos/exynos_drm.lds.S     |   9 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c     | 250 ++++++++++------------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |  33 ++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  43 +++--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  36 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  39 +++--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     |  19 ++-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |  32 ++--
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     |  20 ++-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |  29 +++-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  18 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c        |  55 ++++--
 drivers/gpu/drm/exynos/exynos_mixer.c       |  15 +-
 include/linux/pending_components.h          |  30 ++++
 20 files changed, 466 insertions(+), 300 deletions(-)
 create mode 100644 drivers/base/pending_components.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm.lds.S
 create mode 100644 include/linux/pending_components.h

-- 
1.8.3.2
