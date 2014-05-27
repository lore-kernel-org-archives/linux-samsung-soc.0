From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 0/2] drm/exynos: consider deferred probe case
Date: Tue, 27 May 2014 21:42:41 +0900
Message-ID: <1401194563-803-1-git-send-email-inki.dae@samsung.com>
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
Cc: a.hajda@samsung.com, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk
List-Id: linux-samsung-soc@vger.kernel.org

This patch series includes the following two patches.

One makes sure that exynos drm framework handles deferred probe
case of sub drivers, and other makes sure that mipi dsi driver
considers deferred probe incurred by panel driver.

Inki Dae (2):
  drm/exynos: consider deferred probe feature
  drm/exynos: mipi-dsi: consider panel driver-deferred probe

 drivers/gpu/drm/exynos/exynos_dp_core.c  |   16 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.c  |   28 ++++++------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |    7 +--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  |   69 +++++++++++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   49 +++++++++++++++------
 drivers/gpu/drm/exynos/exynos_hdmi.c     |   62 +++++++++++++++++++--------
 drivers/gpu/drm/exynos/exynos_mixer.c    |   16 ++++++-
 7 files changed, 170 insertions(+), 77 deletions(-)

-- 
1.7.9.5
