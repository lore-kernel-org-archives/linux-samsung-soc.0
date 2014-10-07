From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/4] drm/exynos/dsi: remove global display variable
Date: Tue, 07 Oct 2014 14:01:07 +0200
Message-ID: <1412683271-15835-1-git-send-email-a.hajda@samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Inki,

Many Exynos DRM drivers uses global variables to represent associated devices
in Exynos DRM internal framework. It is quite confusing, it adds data duplication
and finally it does not allow to handle more than one device in system.
It seems better to embed such structures in private context of the device.

The patchset is based on exynos_drm_next plus my patch [1]:
'drm/exynos: remove explicit encoder/connector de-initialization'.

If the patchset is OK for you I can prepare similar patches for other Exynos DRM components.

[1]: https://lkml.org/lkml/2014/9/22/148

Regards
Andrzej


Andrzej Hajda (4):
  drm/exynos/dsi: remove global variable exynos_dsi_display
  drm/exynos/dsi: simplify device pointer evaluation
  drm/exynos/dsi: remove redundant encoder field
  drm/exynos/dsi: stop using display->ctx pointer

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 96 ++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 49 deletions(-)

-- 
1.9.1
