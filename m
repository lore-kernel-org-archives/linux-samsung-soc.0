From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 1/6] include/drm: color_mgmt: Add enum labels
Date: Fri, 14 Dec 2018 13:10:16 +0100
Message-ID: <1544789421-5265-2-git-send-email-c.manszewski@samsung.com>
References: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
 <CGME20181214121032eucas1p24af580721ebd6f86a4f9ddf701957ab6@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Christoph Manszewski <c.manszewski@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Range setting makes sense for YCbCr and RGB buffers. Current
drm_color_range enum labels suggest use with YCbCr buffers.
Create enum labels without colorspace specification.

Signed-off-by: Christoph Manszewski <c.manszewski@samsung.com>
---
 include/drm/drm_color_mgmt.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 90ef9996d9a4..52f6d5221a0d 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -62,6 +62,8 @@ enum drm_color_range {
 	DRM_COLOR_YCBCR_LIMITED_RANGE,
 	DRM_COLOR_YCBCR_FULL_RANGE,
 	DRM_COLOR_RANGE_MAX,
+	DRM_COLOR_LIMITED_RANGE = DRM_COLOR_YCBCR_LIMITED_RANGE,
+	DRM_COLOR_FULL_RANGE = DRM_COLOR_YCBCR_FULL_RANGE,
 };
 
 int drm_plane_create_color_properties(struct drm_plane *plane,
-- 
2.7.4
