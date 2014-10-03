From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RFC 0/4] drm/core: restore suspend/resume calbacks in KMS drm
 drivers
Date: Fri, 03 Oct 2014 10:24:09 +0200
Message-ID: <1412324653-30677-1-git-send-email-a.hajda@samsung.com>
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
Cc: Kukjin Kim <kgene.kim@samsung.com>, "open list:INTEL DRM DRIVERS..." <intel-gfx@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The main intent of this patchset is to allow use of suspend/resume drm driver
callbacks in KMS drivers, as these callbacks seems to me the best place
to implement suspend/resume functionality in drm driver.
Implementing this functionality in master component driver PM ops is problematic
as those callbacks can be called asynchronously regardless of state/existence of
drm device, thus it would require additional synchronization mechanism.

Callbacks re-enabling requires small changes in i915 and exynos driver.
The patchset contains also fix of exynos resume callback.

Regards
Andrzej


Andrzej Hajda (4):
  drm/i915: set PM callbacks only if modeset is turned off
  drm/core: re-enable suspend/resume callbacks for KMS drivers
  drm/exynos: remove master component PM callbacks
  drm/exynos: correct connector->dpms field before resuming

 drivers/gpu/drm/drm_sysfs.c             |  2 --
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 37 ++++++---------------------------
 drivers/gpu/drm/i915/i915_drv.c         |  6 ++----
 3 files changed, 8 insertions(+), 37 deletions(-)

-- 
1.9.1
