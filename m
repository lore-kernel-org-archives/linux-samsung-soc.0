From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/8] drm/exynos/ipp: image post processing improvements
Date: Mon, 19 May 2014 12:54:02 +0200
Message-ID: <1400496850-23860-1-git-send-email-a.hajda@samsung.com>
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
To: open list <linux-kernel@vger.kernel.org>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This set of independent patches contains various improvement and fixes
for exynos_drm ipp framework and drivers.
The patchset is based on drm-exynos/exynos-drm-next branch.

Regards
Andrzej


Andrzej Hajda (8):
  drm/exynos/ipp: fix get_property IOCTL
  drm/exynos/ipp: correct ipp_id field initialization
  drm/exynos/ipp: simplify property list allocation
  drm/exynos/fimc: simplify pre-scaler ratio calculation
  drm/exynos/fimc: simplify irq masking function
  drm/exynos/fimc: replace hw access macros with functions
  drm/exynos/fimc: replace mutex by spinlock
  drm/exynos/fimc: simplify and rename fimc_dst_get_buf_seq

 drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 427 ++++++++++++----------------
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |  10 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     |  16 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.h     |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |   8 +-
 5 files changed, 196 insertions(+), 268 deletions(-)

-- 
1.9.1
