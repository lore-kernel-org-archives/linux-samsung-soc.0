From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 2/6] drm: color_mgmt: Split create_color_properties function
Date: Fri, 14 Dec 2018 13:10:17 +0100
Message-ID: <1544789421-5265-3-git-send-email-c.manszewski@samsung.com>
References: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
 <CGME20181214121034eucas1p14b05676ff59998f760296f9ed33ba3dc@eucas1p1.samsung.com>
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

Split drm_plane_create_color_properties into two separate functions.
This allows to create range and encoding property independently.

Signed-off-by: Christoph Manszewski <c.manszewski@samsung.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 93 +++++++++++++++++++++++++++++++---------
 include/drm/drm_color_mgmt.h     |  8 ++++
 2 files changed, 81 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 581cc3788223..416cc9c8560b 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -396,29 +396,24 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 }
 
 /**
- * drm_plane_create_color_properties - color encoding related plane properties
+ * drm_plane_create_encoding_property - color encoding related plane property
  * @plane: plane object
  * @supported_encodings: bitfield indicating supported color encodings
- * @supported_ranges: bitfileld indicating supported color ranges
  * @default_encoding: default color encoding
- * @default_range: default color range
  *
- * Create and attach plane specific COLOR_ENCODING and COLOR_RANGE
- * properties to @plane. The supported encodings and ranges should
- * be provided in supported_encodings and supported_ranges bitmasks.
- * Each bit set in the bitmask indicates that its number as enum
- * value is supported.
+ * Create and attach plane specific COLOR_ENCODING property to @plane.
+ * The supported encodings be provided in supported_encodings bitmask.
+ * Each bit set in the bitmask indicates that its number as enum value
+ * is supported.
  */
-int drm_plane_create_color_properties(struct drm_plane *plane,
-				      u32 supported_encodings,
-				      u32 supported_ranges,
-				      enum drm_color_encoding default_encoding,
-				      enum drm_color_range default_range)
+
+int drm_plane_create_encoding_property(struct drm_plane *plane,
+				       u32 supported_encodings,
+				       enum drm_color_encoding default_encoding)
 {
 	struct drm_device *dev = plane->dev;
 	struct drm_property *prop;
-	struct drm_prop_enum_list enum_list[max_t(int, DRM_COLOR_ENCODING_MAX,
-						       DRM_COLOR_RANGE_MAX)];
+	struct drm_prop_enum_list enum_list[DRM_COLOR_ENCODING_MAX];
 	int i, len;
 
 	if (WARN_ON(supported_encodings == 0 ||
@@ -426,11 +421,6 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 		    (supported_encodings & BIT(default_encoding)) == 0))
 		return -EINVAL;
 
-	if (WARN_ON(supported_ranges == 0 ||
-		    (supported_ranges & -BIT(DRM_COLOR_RANGE_MAX)) != 0 ||
-		    (supported_ranges & BIT(default_range)) == 0))
-		return -EINVAL;
-
 	len = 0;
 	for (i = 0; i < DRM_COLOR_ENCODING_MAX; i++) {
 		if ((supported_encodings & BIT(i)) == 0)
@@ -450,6 +440,36 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 	if (plane->state)
 		plane->state->color_encoding = default_encoding;
 
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_encoding_property);
+
+/**
+ * drm_plane_create_range_property - color range related plane property
+ * @plane: plane object
+ * @supported_ranges: bitfileld indicating supported color ranges
+ * @default_range: default color range
+ *
+ * Create and attach plane specific COLOR_RANGE property to @plane.
+ * The supported ranges should be provided in supported_ranges bitmask.
+ * Each bit set in the bitmask indicates that its number as enum value
+ * is supported.
+ */
+
+int drm_plane_create_range_property(struct drm_plane *plane,
+				    u32 supported_ranges,
+				    enum drm_color_range default_range)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_property *prop;
+	struct drm_prop_enum_list enum_list[DRM_COLOR_RANGE_MAX];
+	int i, len;
+
+	if (WARN_ON(supported_ranges == 0 ||
+		    (supported_ranges & -BIT(DRM_COLOR_RANGE_MAX)) != 0 ||
+		    (supported_ranges & BIT(default_range)) == 0))
+		return -EINVAL;
+
 	len = 0;
 	for (i = 0; i < DRM_COLOR_RANGE_MAX; i++) {
 		if ((supported_ranges & BIT(i)) == 0)
@@ -471,4 +491,37 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_plane_create_range_property);
+
+/**
+ * drm_plane_create_color_properties - color encoding related plane properties
+ * @plane: plane object
+ * @supported_encodings: bitfield indicating supported color encodings
+ * @supported_ranges: bitfileld indicating supported color ranges
+ * @default_encoding: default color encoding
+ * @default_range: default color range
+ *
+ * Create and attach plane specific COLOR_ENCODING and COLOR_RANGE
+ * properties to @plane. The supported encodings and ranges should
+ * be provided in supported_encodings and supported_ranges bitmasks.
+ * Each bit set in the bitmask indicates that its number as enum
+ * value is supported.
+ */
+
+int drm_plane_create_color_properties(struct drm_plane *plane,
+				      u32 supported_encodings,
+				      u32 supported_ranges,
+				      enum drm_color_encoding default_encoding,
+				      enum drm_color_range default_range)
+{
+	int ret;
+
+	ret = drm_plane_create_encoding_property(plane, supported_encodings,
+						 default_encoding);
+	if (ret)
+		return ret;
+
+	return drm_plane_create_range_property(plane, supported_ranges,
+					       default_range);
+}
 EXPORT_SYMBOL(drm_plane_create_color_properties);
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 52f6d5221a0d..fca8d3fabcd9 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -66,6 +66,14 @@ enum drm_color_range {
 	DRM_COLOR_FULL_RANGE = DRM_COLOR_YCBCR_FULL_RANGE,
 };
 
+int drm_plane_create_encoding_property(struct drm_plane *plane,
+				       u32 supported_encodings,
+				       enum drm_color_encoding default_encoding);
+
+int drm_plane_create_range_property(struct drm_plane *plane,
+				    u32 supported_ranges,
+				    enum drm_color_range default_range);
+
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,
-- 
2.7.4
