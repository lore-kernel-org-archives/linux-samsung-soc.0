From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH 0/4] drm/exynos/mixer: small cleanups
Date: Sun,  4 May 2014 23:26:17 +0800
Message-ID: <1399217181-26442-1-git-send-email-djkurtz@chromium.org>
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
To: Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, marcheu@chromium.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

I don't actually have a way of testing the video processor changes, but they
seem correct from looking at the code.  Hopefully someone has a way of testing
them.

Daniel Kurtz (4):
  drm/exynos/mixer: move format definitions to regs-mixer
  drm/exynos/mixer: use MXR_GRP_SXY_SY
  drm/exynos/mixer: planes are not disabled by setting dma_addr to zero
  drm/exynos/mixer: add support for NV21

 drivers/gpu/drm/exynos/exynos_drm_plane.c |  1 +
 drivers/gpu/drm/exynos/exynos_mixer.c     | 54 +++++++++++--------------------
 drivers/gpu/drm/exynos/regs-mixer.h       |  4 +++
 3 files changed, 23 insertions(+), 36 deletions(-)

-- 
1.9.1.423.g4596e3a
