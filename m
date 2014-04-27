From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v3 PATCH 05/16] drm/panel: add CPU mode timings structure
Date: Sun, 27 Apr 2014 10:50:01 +0900
Message-ID: <1398563412-21781-6-git-send-email-yj44.cho@samsung.com>
References: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

To support MIPI DSI command mode interface, the display controller
requires the CPU mode timings which is the panel specific data.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 include/drm/drm_panel.h |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index c2ab77a..67e6871 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -46,6 +46,24 @@ struct drm_panel {
 	struct list_head list;
 };
 
+/**
+ * struct drm_panel_cpu_mode_timings - describe cpu mode timing settings
+ * @cs_setup: clock cycles for the active period of address signal is enabled
+ *	until chip select is enabled in CPU mode interface
+ * @wr_setup: clock cycles for the active period of CS signal is enabled until
+ *	write signal is enabled in CPU mode interface
+ * @wr_actve: clock cycles for the active period of CS is enabled in CPU mode
+ *	interface
+ * @wr_hold: clock cycles for the active period of CS is disabled until write
+ *	signal is disabled in CPU mode interface
+ */
+struct drm_panel_cpu_mode_timings {
+	unsigned int cs_setup;
+	unsigned int wr_setup;
+	unsigned int wr_active;
+	unsigned int wr_hold;
+};
+
 static inline int drm_panel_disable(struct drm_panel *panel)
 {
 	if (panel && panel->funcs && panel->funcs->disable)
-- 
1.7.9.5
