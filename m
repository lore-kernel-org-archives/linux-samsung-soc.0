From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 0/2] drm/mipi-dsi: support lpm (low power mode) transfer
Date: Mon, 28 Jul 2014 11:00:55 +0900
Message-ID: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
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
Cc: a.hajda@samsung.com, treding@nvidia.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch series adds lpm tranfer support for video and command data.

for this, this patch adds two flags, and makes mipi dsi host to send
commands to lcd panel device with lpm if mode_flags of lcd panel driver
includes lpm flag.

and also it applies this feature to exynos mipi dsi driver.

Changelog v2:
- Add more describtions.
- Enable High Speed clock only in case of stand by request.

Inki Dae (2):
  drm/mipi-dsi: add (LPM) Low Power Mode transfer support
  drm/exynos: dsi: add LPM (Low Power Mode) transfer support

 drivers/gpu/drm/drm_mipi_dsi.c          |    3 +++
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |   22 ++++++++++++++++++++--
 include/drm/drm_mipi_dsi.h              |    4 ++++
 3 files changed, 27 insertions(+), 2 deletions(-)

-- 
1.7.9.5
