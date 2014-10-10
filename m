From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/4] drm/exynos: misc fixes
Date: Fri, 10 Oct 2014 14:31:52 +0200
Message-ID: <1412944316-27737-1-git-send-email-a.hajda@samsung.com>
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
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Inki,

These four independent patches fixes few problems I have encountered recently.

1st patch is a trivial fix.

2nd patch(kms poll init) fixes old issue, which became more visible after my patch
'drm/exynos: init vblank with real number of crtcs' - driver tried to handle HPD
events even if it was not fully initialized, it caused WARNs and app locks.

Vblank patch is slightly different version of the one proposed in [1]. The only
difference is that it enables vblank after dpms on, it is neccessary because
drm_crtc_vblank_on can call drm_vblank_enable which can call exynos_drm_crtc_enable_vblank
and exynos_drm_crtc_enable_vblank will return error if exynos_crtc->dpms != DRM_MODE_DPMS_ON.

DPMS patch was previously sent as a part of other series, but as the series have been dropped
I have resend it in this patchset.

The patchset is based on exynos-drm-next branch plus following patches:
    drm/exynos: remove explicit encoder/connector de-initialization
    drm/exynos: init vblank with real number of crtcs
    drm/exynos: remove ifdeferry from initialization code


It has been tested on trats board.

[1]: https://lkml.org/lkml/2014/10/2/154

Regards
Andrzej


Andrzej Hajda (4):
  drm/exynos: propagate plane initialization errors
  drm/exynos: init kms poll at the end of initialization
  drm/exynos: enable vblank after DPMS on
  drm/exynos: correct connector->dpms field before resuming

 drivers/gpu/drm/exynos/exynos_drm_crtc.c |  5 ++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.c  | 27 +++++++++++++++++----------
 2 files changed, 21 insertions(+), 11 deletions(-)

-- 
1.9.1
