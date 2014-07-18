From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer support
Date: Fri, 18 Jul 2014 19:56:03 +0900
Message-ID: <1405680964-6869-2-git-send-email-inki.dae@samsung.com>
References: <1405680964-6869-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1405680964-6869-1-git-send-email-inki.dae@samsung.com>
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

This patch adds below two flags for LPM transfer, and it attaches LPM flags
to a msg in accordance with master's mode_flags set by LCD Panel driver.

MIPI_DSI_MODE_CMD_LPM: low power command transfer
MIPI_DSI_MODE_VIDEO_LPM: low power video transfer

MIPI DSI spec says,
     "the host processor controls the desired mode of clock operation.
      Host protocol and applications control Clock Lane operating mode
      (High Speed or Low Power mode). System designers are responsible
      for understanding the clock requirements for peripherals attached
      to DSI and controlling clock behavior in accordance with those
      requirements."

Some LCD Panel devices, nt35502a, would need LPM transfer support
because they should receive some initial commands with LPM by default
hardware setting.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c |    3 +++
 include/drm/drm_mipi_dsi.h     |    4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index e633df2..6b2bbda 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -232,6 +232,9 @@ int mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, unsigned int channel,
 		break;
 	}
 
+	if (dsi->mode_flags & MIPI_DSI_MODE_CMD_LPM)
+		msg.flags = MIPI_DSI_MSG_USE_LPM;
+
 	return ops->transfer(dsi->host, &msg);
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_write);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 944f33f..1c41e49 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -94,6 +94,10 @@ void mipi_dsi_host_unregister(struct mipi_dsi_host *host);
 #define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
 /* disable EoT packets in HS mode */
 #define MIPI_DSI_MODE_EOT_PACKET	BIT(9)
+/* command low power mode */
+#define MIPI_DSI_MODE_CMD_LPM		BIT(10)
+/* video low power mode */
+#define MIPI_DSI_MODE_VIDEO_LPM		BIT(11)
 
 enum mipi_dsi_pixel_format {
 	MIPI_DSI_FMT_RGB888,
-- 
1.7.9.5
