From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 02/15] drm/dsi: Constify mipi_dsi_msg
Date: Mon, 13 Oct 2014 12:16:22 +0200
Message-ID: <1413195395-3355-2-git-send-email-thierry.reding@gmail.com>
References: <1413195395-3355-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1413195395-3355-1-git-send-email-thierry.reding@gmail.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

struct mipi_dsi_msg is a read-only structure, drivers should never need
to modify it. Make this explicit by making all references to the struct
const.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 include/drm/drm_mipi_dsi.h              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 24741d8758e8..c5f3c76bfac3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1236,7 +1236,7 @@ static bool exynos_dsi_is_short_dsi_type(u8 type)
 }
 
 static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
-				       struct mipi_dsi_msg *msg)
+				        const struct mipi_dsi_msg *msg)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct exynos_dsi_transfer xfer;
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index ccc3869e137b..836cc2b677d0 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -56,7 +56,7 @@ struct mipi_dsi_host_ops {
 	int (*detach)(struct mipi_dsi_host *host,
 		      struct mipi_dsi_device *dsi);
 	ssize_t (*transfer)(struct mipi_dsi_host *host,
-			    struct mipi_dsi_msg *msg);
+			    const struct mipi_dsi_msg *msg);
 };
 
 /**
-- 
2.1.2
