From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 0/2] drm/mipi-dsi: support LPM (Low Power Mode) transfer
Date: Fri, 18 Jul 2014 19:56:02 +0900
Message-ID: <1405680964-6869-1-git-send-email-inki.dae@samsung.com>
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
Cc: a.hajda@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch series adds LPM tranfer support for video and command data.

For this, this patch adds two flags, and makes MIPI DSI host to send
commands to LCD Panel device with LPM if mode_flags of LCD Panel driver
includes LPM flag.

And also it applies this feature to Exynos MIPI DSI driver.

Inki Dae (2):
  drm/mipi-dsi: add (LPM) Low Power Mode transfer support
  drm/exynos: dsi: add LPM (Low Power Mode) transfer support

 drivers/gpu/drm/drm_mipi_dsi.c          |    3 +++
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |   22 ++++++++++++++++++++--
 include/drm/drm_mipi_dsi.h              |    4 ++++
 3 files changed, 27 insertions(+), 2 deletions(-)

-- 
1.7.9.5
