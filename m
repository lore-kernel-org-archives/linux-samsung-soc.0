From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 0/2] drm/exynos: use drm generic mmap interface
Date: Wed, 17 Sep 2014 22:48:44 +0900
Message-ID: <1410961726-2533-1-git-send-email-inki.dae@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch set removes unnecessary DRM_EXYNOS_GEM_MAP_OFFSET interface
which isn't used anymore and also uses drm generic mmap interface
instead of a mmap interface specific to Exynos drm. So this patch set
removes a existing mmap interface and relevant codes specific to Exynos
drm.

Inki Dae (2):
  drm/exynos: remove DRM_EXYNOS_GEM_MAP_OFFSET ioctl
  drm/exynos: use drm generic mmap interface

 drivers/gpu/drm/exynos/exynos_drm_drv.c |   28 ---------
 drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 -
 drivers/gpu/drm/exynos/exynos_drm_gem.c |  101 +++++--------------------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |   14 -----
 include/uapi/drm/exynos_drm.h           |   40 ------------
 5 files changed, 14 insertions(+), 170 deletions(-)

-- 
1.7.9.5
