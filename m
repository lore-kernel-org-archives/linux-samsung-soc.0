From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 14/14] exynos/fimg2d: remove g2d_context from public header
Date: Mon, 24 Aug 2015 16:34:28 +0200
Message-ID: <1440426868-10082-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50260 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753713AbbHXOea (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 10:34:30 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

All functions from the public API only operation on
struct g2d_context*, so this shouldn't break too much.

Make the context private since we don't want the
user to modify its content directly. Also remove
the defines that were only used for fields of
g2d_context.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 15 +++++++++++++++
 exynos/exynos_fimg2d.h | 14 +-------------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 91df441..00019e9 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -44,6 +44,21 @@
 
 #define MSG_PREFIX "exynos/fimg2d: "
 
+#define G2D_MAX_CMD_NR		64
+#define G2D_MAX_GEM_CMD_NR	64
+#define G2D_MAX_CMD_LIST_NR	64
+
+struct g2d_context {
+	int				fd;
+	unsigned int			major;
+	unsigned int			minor;
+	struct drm_exynos_g2d_cmd	cmd[G2D_MAX_CMD_NR];
+	struct drm_exynos_g2d_cmd	cmd_buf[G2D_MAX_GEM_CMD_NR];
+	unsigned int			cmd_nr;
+	unsigned int			cmd_buf_nr;
+	unsigned int			cmdlist_nr;
+};
+
 enum g2d_base_addr_reg {
 	g2d_dst = 0,
 	g2d_src
diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
index 9db0c88..4aa1568 100644
--- a/exynos/exynos_fimg2d.h
+++ b/exynos/exynos_fimg2d.h
@@ -13,9 +13,6 @@
 #ifndef _FIMG2D_H_
 #define _FIMG2D_H_
 
-#define G2D_MAX_CMD_NR		64
-#define G2D_MAX_GEM_CMD_NR	64
-#define G2D_MAX_CMD_LIST_NR	64
 #define G2D_PLANE_MAX_NR	2
 
 enum e_g2d_color_mode {
@@ -289,16 +286,7 @@ struct g2d_image {
 	void				*mapped_ptr[G2D_PLANE_MAX_NR];
 };
 
-struct g2d_context {
-	int				fd;
-	unsigned int			major;
-	unsigned int			minor;
-	struct drm_exynos_g2d_cmd	cmd[G2D_MAX_CMD_NR];
-	struct drm_exynos_g2d_cmd	cmd_buf[G2D_MAX_GEM_CMD_NR];
-	unsigned int			cmd_nr;
-	unsigned int			cmd_buf_nr;
-	unsigned int			cmdlist_nr;
-};
+struct g2d_context;
 
 struct g2d_context *g2d_init(int fd);
 void g2d_fini(struct g2d_context *ctx);
-- 
2.0.5
