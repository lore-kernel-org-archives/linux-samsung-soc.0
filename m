From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 00/17] drm/exynos/ipp: image post processing fixes and
 improvements, part four
Date: Thu, 28 Aug 2014 11:07:24 +0200
Message-ID: <1409216861-12452-1-git-send-email-a.hajda@samsung.com>
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

This set of patches contains various improvement and fixes
for exynos_drm ipp framework.
The patchset is based on exynos-drm-next branch.

IPP framework was tested for regressions on exynos4210-trats target.

In the 2nd version of the series I have included changes proposed by Joonyoung Shim.
I have decided to resend whole series because the changes caused merge conflicts and
two separate patches have been added to the series.
Changes are described in comit messages.

Regards
Andrzej


Andrzej Hajda (17):
  drm/exynos/ipp: remove fake pm callbacks
  drm/exynos/ipp: cancel works before command node clean
  drm/exynos/ipp: move file reference from memory to command node
  drm/exynos/ipp: remove only related commands on file close
  drm/exynos/ipp: remove unused field in command node
  drm/exynos/ipp: free partially allocated resources on error
  drm/exynos/ipp: move nodes cleaning to separate function
  drm/exynos/ipp: clean memory nodes on command node cleaning
  drm/exynos/ipp: replace work_struct casting with better constructs
  drm/exynos/ipp: stop hardware before freeing memory
  drm/exynos/ipp: remove events during command cleaning
  drm/exynos/fimc: avoid clearing overflow bits
  drm/exynos/fimc: do not enable fimc twice
  drm/exynos/fimc: simplify buffer queuing
  drm/exynos/fimc: fix source buffer registers
  drm/exynos/ipp: remove file argument from node related functions
  drm/exynos/ipp: add file checks for ioctls

 drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  90 ++-----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     | 397 ++++++++++++----------------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h     |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |   3 +-
 5 files changed, 195 insertions(+), 302 deletions(-)

-- 
1.9.1
