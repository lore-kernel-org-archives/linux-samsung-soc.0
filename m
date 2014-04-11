From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RFC 0/2] drm/exynos: refactoring drm device init/deinit
Date: Fri, 11 Apr 2014 16:11:26 +0200
Message-ID: <1397225488-6634-1-git-send-email-a.hajda@samsung.com>
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
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Inki,

This patchset refactors drm device initialization. Details are described
in respective patches. It is an alternative to DT supernode concept.

The first patch uses linker sections to get rid of ifdef macros, it is not
essential for 2nd patch but it makes code more readable. Similar approach
is used by irqchip, clks and clk_sources.

The patchset is based on exynos-drm-next branch.

Regards
Andrzej


Andrzej Hajda (2):
  drm/exynos: refactor drm drivers registration code
  drm/exynos: initialize drm master only when all exynos drm devices are
    ready

 drivers/gpu/drm/exynos/Makefile             |   2 +
 drivers/gpu/drm/exynos/exynos_dp_core.c     |  37 ++--
 drivers/gpu/drm/exynos/exynos_drm.lds.S     |   9 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c     | 279 +++++++++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |  20 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  42 +++--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  35 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  38 ++--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     |  17 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |  30 +--
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     |  18 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |  27 ++-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  18 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c        |  53 ++++--
 drivers/gpu/drm/exynos/exynos_mixer.c       |  14 +-
 15 files changed, 360 insertions(+), 279 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm.lds.S

-- 
1.8.3.2
