Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D708C07E98
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Jul 2021 07:25:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C958613E1
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Jul 2021 07:25:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhGCH1n (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 3 Jul 2021 03:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhGCH1n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 3 Jul 2021 03:27:43 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03599C061762;
        Sat,  3 Jul 2021 00:25:09 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q91so7957931pjk.3;
        Sat, 03 Jul 2021 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MIgwSNCLuBQs+cwAtmi0/COfPG7Xp5I02ys9HkOg0tY=;
        b=Zbsf3AQlfTFHr5ZjD1TkVnN2R1+5bZKeKX75HGW6KGEM05jlF/mb9uh+0CE46Ge5Ak
         UxGnEAz8Uy644cIRI/Mhg+HlXYsO6Th6qzK6jJOivOIqELSi/ARAVQq8ubftdSQyvWZV
         BbaRxZX+6/H94ncKjkU6v9HfUP3fUJRu4eykRVWL/XoNaCCdlB+Br5CmKtEvJhHlk9IB
         hxZhQQG99HVXjY1kzMe/TMWSZi2sUOY+vIuj0yNl0tJxSMSCRyNLl7dkb2x53Kwiqmvg
         EE9h0w4wZ9fLGvCb2AnZtsQN9GPuhs77ciktEQlP946kDTp/h2QNqhkKA4q3aAktTwrb
         3DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MIgwSNCLuBQs+cwAtmi0/COfPG7Xp5I02ys9HkOg0tY=;
        b=BFKsAP/RmUMwhI26pNynxPA/IJCvn0RM2KRk9o56bYdlKGViE8d+3RoF7EwAIJlSxs
         9ommPKbIJEk8ayTynvV0z3IvFOjKDK/dBCk4Rt8wJPjPfeNW7zK4YKxuwv0+IYDPNpjF
         RBw6bIqU2RF1Fo0D6lwuVfqgdHsokGi7Mj6Sc0B6FacE+BJbEZiajL9u2flRxdHT8A9p
         tlyc1XPv1ACWtW/d8+SlG2xM+la2MX+3lnER6BWWECIWg/7PUbtMvzQ5bZA5YM/wHR7A
         KvZt5sZyhe+wYN99JkJ60AITsAHkFQhvQ7A5IIPtkNBrdWJj4UQ6+qRbHMD0kakkDyWc
         OOCg==
X-Gm-Message-State: AOAM531t8HyGkUhkPJfLO9G6YWikNxOdeIpeKI9z1w0eXAOQ4mQueg16
        1VCBUPYjnAkFD1Bgyym9/mA=
X-Google-Smtp-Source: ABdhPJwPF63ZZ1EbelrVHjC8zLNNOkAxEYxRNj2Gf18dQ+jrkBcIz+PrFaQ9AvLMMSH31i1CHkRL9Q==
X-Received: by 2002:a17:90a:9308:: with SMTP id p8mr3467470pjo.119.1625297109313;
        Sat, 03 Jul 2021 00:25:09 -0700 (PDT)
Received: from ubuntu.localdomain ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id cp11sm1221152pjb.16.2021.07.03.00.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 00:25:08 -0700 (PDT)
From:   gushengxian <gushengxian507419@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        yuq825@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        lima@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        gushengxian <gushengxian@yulong.com>
Subject: [PATCH] include/uapi/drm: fix spelling mistakes in header files
Date:   Sat,  3 Jul 2021 00:25:02 -0700
Message-Id: <20210703072502.646239-1-gushengxian507419@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: gushengxian <gushengxian@yulong.com>

Fix some spelling mistakes in comments found by "codespell":
cordinate ==> coordinate
vertial ==> vertical
horizonta ==> horizontal
tranformation ==> transformation
performend ==> performed
synhronisation ==> synchronisation
absulute ==> absolute
successfuly ==> successfully
privlege ==> privilege
suface ==> surface
automaticaly ==> automatically

Signed-off-by: gushengxian <gushengxian@yulong.com>
---
 include/uapi/drm/drm_mode.h    | 8 ++++----
 include/uapi/drm/exynos_drm.h  | 6 +++---
 include/uapi/drm/i915_drm.h    | 4 ++--
 include/uapi/drm/lima_drm.h    | 2 +-
 include/uapi/drm/nouveau_drm.h | 2 +-
 include/uapi/drm/vc4_drm.h     | 2 +-
 include/uapi/drm/vmwgfx_drm.h  | 4 ++--
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 9b6722d45f36..8619c7dbb50d 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -757,8 +757,8 @@ struct hdr_metadata_infoframe {
 	 * These are coded as unsigned 16-bit values in units of
 	 * 0.00002, where 0x0000 represents zero and 0xC350
 	 * represents 1.0000.
-	 * @display_primaries.x: X cordinate of color primary.
-	 * @display_primaries.y: Y cordinate of color primary.
+	 * @display_primaries.x: X coordinate of color primary.
+	 * @display_primaries.y: Y coordinate of color primary.
 	 */
 	struct {
 		__u16 x, y;
@@ -768,8 +768,8 @@ struct hdr_metadata_infoframe {
 	 * These are coded as unsigned 16-bit values in units of
 	 * 0.00002, where 0x0000 represents zero and 0xC350
 	 * represents 1.0000.
-	 * @white_point.x: X cordinate of whitepoint of color primary.
-	 * @white_point.y: Y cordinate of whitepoint of color primary.
+	 * @white_point.x: X coordinate of whitepoint of color primary.
+	 * @white_point.y: Y coordinate of whitepoint of color primary.
 	 */
 	struct {
 		__u16 x, y;
diff --git a/include/uapi/drm/exynos_drm.h b/include/uapi/drm/exynos_drm.h
index a51aa1c618c1..27daea06a78e 100644
--- a/include/uapi/drm/exynos_drm.h
+++ b/include/uapi/drm/exynos_drm.h
@@ -187,9 +187,9 @@ struct drm_exynos_ioctl_ipp_get_caps {
 };
 
 enum drm_exynos_ipp_limit_type {
-	/* size (horizontal/vertial) limits, in pixels (min, max, alignment) */
+	/* size (horizontal/vertical) limits, in pixels (min, max, alignment) */
 	DRM_EXYNOS_IPP_LIMIT_TYPE_SIZE		= 0x0001,
-	/* scale ratio (horizonta/vertial), 16.16 fixed point (min, max) */
+	/* scale ratio (horizontal/vertical), 16.16 fixed point (min, max) */
 	DRM_EXYNOS_IPP_LIMIT_TYPE_SCALE		= 0x0002,
 
 	/* image buffer area */
@@ -295,7 +295,7 @@ struct drm_exynos_ipp_task_rect {
 };
 
 /**
- * Image tranformation description.
+ * Image transformation description.
  *
  * @id: must be DRM_EXYNOS_IPP_TASK_TRANSFORM
  * @rotation: DRM_MODE_ROTATE_* and DRM_MODE_REFLECT_* values
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index c2c7759b7d2e..1ad8c1998693 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -995,7 +995,7 @@ struct drm_i915_gem_exec_object {
 struct drm_i915_gem_execbuffer {
 	/**
 	 * List of buffers to be validated with their relocations to be
-	 * performend on them.
+	 * performed on them.
 	 *
 	 * This is a pointer to an array of struct drm_i915_gem_validate_entry.
 	 *
@@ -1067,7 +1067,7 @@ struct drm_i915_gem_exec_object2 {
  * used by the GPU - this flag only disables the synchronisation prior to
  * rendering with this object in this execbuf.
  *
- * Opting out of implicit synhronisation requires the user to do its own
+ * Opting out of implicit synchronisation requires the user to do its own
  * explicit tracking to avoid rendering corruption. See, for example,
  * I915_PARAM_HAS_EXEC_FENCE to order execbufs and execute them asynchronously.
  */
diff --git a/include/uapi/drm/lima_drm.h b/include/uapi/drm/lima_drm.h
index 1ec58d652a5a..4a38ac3442c8 100644
--- a/include/uapi/drm/lima_drm.h
+++ b/include/uapi/drm/lima_drm.h
@@ -134,7 +134,7 @@ struct drm_lima_gem_submit {
 struct drm_lima_gem_wait {
 	__u32 handle;      /* in, GEM buffer handle */
 	__u32 op;          /* in, CPU want to read/write this buffer */
-	__s64 timeout_ns;  /* in, wait timeout in absulute time */
+	__s64 timeout_ns;  /* in, wait timeout in absolute time */
 };
 
 /**
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 853a327433d3..1fab2431df49 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -178,7 +178,7 @@ struct drm_nouveau_svm_bind {
 
 /*
  * NOUVEAU_BIND_COMMAND__MIGRATE: synchronous migrate to target memory.
- * result: number of page successfuly migrate to the target memory.
+ * result: number of page successfully migrate to the target memory.
  */
 #define NOUVEAU_SVM_BIND_COMMAND__MIGRATE               0
 
diff --git a/include/uapi/drm/vc4_drm.h b/include/uapi/drm/vc4_drm.h
index 2cac6277a1d7..8de7a98ca6ec 100644
--- a/include/uapi/drm/vc4_drm.h
+++ b/include/uapi/drm/vc4_drm.h
@@ -261,7 +261,7 @@ struct drm_vc4_mmap_bo {
  * shader BOs.
  *
  * Since allowing a shader to be overwritten while it's also being
- * executed from would allow privlege escalation, shaders must be
+ * executed from would allow privilege escalation, shaders must be
  * created using this ioctl, and they can't be mmapped later.
  */
 struct drm_vc4_create_shader_bo {
diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm.h
index 02e917507479..a46ba95f4e5a 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -165,7 +165,7 @@ struct drm_vmw_context_arg {
 
 /*************************************************************************/
 /**
- * DRM_VMW_CREATE_SURFACE - Create a host suface.
+ * DRM_VMW_CREATE_SURFACE - Create a host surface.
  *
  * Allocates a device unique surface id, and queues a create surface command
  * for the host. Does not wait for host completion. The surface ID can be
@@ -442,7 +442,7 @@ union drm_vmw_alloc_bo_arg {
  *
  * This IOCTL controls the overlay units of the svga device.
  * The SVGA overlay units does not work like regular hardware units in
- * that they do not automaticaly read back the contents of the given dma
+ * that they do not automatically read back the contents of the given dma
  * buffer. But instead only read back for each call to this ioctl, and
  * at any point between this call being made and a following call that
  * either changes the buffer or disables the stream.
-- 
2.25.1

