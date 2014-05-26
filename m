From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/9] drm/exynos/ipp: image post processing improvements,
 part deux
Date: Mon, 26 May 2014 10:17:14 +0200
Message-ID: <1401092243-25568-1-git-send-email-a.hajda@samsung.com>
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
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is the next part of ipp improvement patches, this time made
by YoungJun Cho, I am posting them as he is on leave.

The patchset is based on drm-exynos/exynos-drm-next branch.

Regards
Andrzej


Andrzej Hajda (1):
  drm/exynos: ipp: remove description of non-existing field

YoungJun Cho (8):
  drm/exynos: ipp: remove usless list_empty() functions
  drm/exynos: ipp: remove duplicated setting
  drm/exynos: ipp: rename cmd_lock to lock
  drm/exynos: ipp: add cmd_lock for cmd_list
  drm/exynos: ipp: add ipp_remove_id()
  drm/exynos: ipp: rearrange c_node->mem_lock using routines
  drm/exynos: ipp: rearrange c_node->event_lock using routine
  drm/exynos: ipp: update comment for struct drm_ipp_buf_info

 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 242 ++++++++++++++++----------------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h |   9 +-
 2 files changed, 129 insertions(+), 122 deletions(-)

-- 
1.9.1
