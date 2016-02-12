From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/4] drm/exynos: use arch independent types in uapi header
Date: Fri, 12 Feb 2016 13:13:59 +0100
Message-ID: <1455279239-13609-5-git-send-email-a.hajda@samsung.com>
References: <1455279239-13609-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:33490 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752327AbcBLMPP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 07:15:15 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2F0056WOPC7900@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Feb 2016 12:15:12 +0000 (GMT)
In-reply-to: <1455279239-13609-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, emil.l.velikov@gmail.com

User API structs should not use types which size/alignment/padding depends
on architecture. The patch fixes it for all structures except
drm_exynos_g2d_userptr, as g2d related stuff seems to be more complicated
and will be reviewed/adjusted later.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 include/uapi/drm/exynos_drm.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/uapi/drm/exynos_drm.h b/include/uapi/drm/exynos_drm.h
index 312c67d..d2a5bb1 100644
--- a/include/uapi/drm/exynos_drm.h
+++ b/include/uapi/drm/exynos_drm.h
@@ -28,8 +28,8 @@
  */
 struct drm_exynos_gem_create {
 	__u64 size;
-	unsigned int flags;
-	unsigned int handle;
+	__u32 flags;
+	__u32 handle;
 };
 
 /**
@@ -42,8 +42,8 @@ struct drm_exynos_gem_create {
  *	be set by driver.
  */
 struct drm_exynos_gem_info {
-	unsigned int handle;
-	unsigned int flags;
+	__u32 handle;
+	__u32 flags;
 	__u64 size;
 };
 
@@ -56,8 +56,8 @@ struct drm_exynos_gem_info {
  * @edid: the edid data pointer from user side.
  */
 struct drm_exynos_vidi_connection {
-	unsigned int connection;
-	unsigned int extensions;
+	__u32 connection;
+	__u32 extensions;
 	__u64 edid;
 };
 
@@ -206,9 +206,9 @@ struct drm_exynos_ipp_prop_list {
  * @pos: property of image position(src-cropped,dst-scaler).
  */
 struct drm_exynos_ipp_config {
-	enum drm_exynos_ops_id ops_id;
-	enum drm_exynos_flip	flip;
-	enum drm_exynos_degree	degree;
+	__u32 ops_id;
+	__u32 flip;
+	__u32 degree;
 	__u32	fmt;
 	struct drm_exynos_sz	sz;
 	struct drm_exynos_pos	pos;
@@ -233,7 +233,7 @@ enum drm_exynos_ipp_cmd {
  */
 struct drm_exynos_ipp_property {
 	struct drm_exynos_ipp_config config[EXYNOS_DRM_OPS_MAX];
-	enum drm_exynos_ipp_cmd	cmd;
+	__u32	cmd;
 	__u32	ipp_id;
 	__u32	prop_id;
 	__u32	refresh_rate;
@@ -255,8 +255,8 @@ enum drm_exynos_ipp_buf_type {
  * @user_data: user data.
  */
 struct drm_exynos_ipp_queue_buf {
-	enum drm_exynos_ops_id	ops_id;
-	enum drm_exynos_ipp_buf_type	buf_type;
+	__u32	ops_id;
+	__u32	buf_type;
 	__u32	prop_id;
 	__u32	buf_id;
 	__u32	handle[EXYNOS_DRM_PLANAR_MAX];
@@ -280,7 +280,7 @@ enum drm_exynos_ipp_ctrl {
  */
 struct drm_exynos_ipp_cmd_ctrl {
 	__u32	prop_id;
-	enum drm_exynos_ipp_ctrl	ctrl;
+	__u32	ctrl;
 };
 
 #define DRM_EXYNOS_GEM_CREATE		0x00
-- 
1.9.1
