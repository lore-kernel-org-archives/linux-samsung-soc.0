From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/9] drm/exynos: ipp: remove duplicated setting
Date: Mon, 26 May 2014 10:17:16 +0200
Message-ID: <1401092243-25568-3-git-send-email-a.hajda@samsung.com>
References: <1401092243-25568-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1401092243-25568-1-git-send-email-a.hajda@samsung.com>
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
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: YoungJun Cho <yj44.cho@samsung.com>

This patch removes duplicated setting.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Seong-Woo Kim <sw0312.cho@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Tested-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index c8cfa24..0968777 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -1090,12 +1090,12 @@ int exynos_drm_ipp_cmd_ctrl(struct drm_device *drm_dev, void *data,
 	case IPP_CTRL_PLAY:
 		if (pm_runtime_suspended(ippdrv->dev))
 			pm_runtime_get_sync(ippdrv->dev);
+
 		c_node->state = IPP_STATE_START;
 
 		cmd_work = c_node->start_work;
 		cmd_work->ctrl = cmd_ctrl->ctrl;
 		ipp_handle_cmd_work(dev, ippdrv, cmd_work, c_node);
-		c_node->state = IPP_STATE_START;
 		break;
 	case IPP_CTRL_STOP:
 		cmd_work = c_node->stop_work;
-- 
1.9.1
