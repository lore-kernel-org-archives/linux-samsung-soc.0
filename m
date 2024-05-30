Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75D6F2E8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 May 2024 10:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717063350; cv=none; b=D8ANyu/OjjtNpiPmO5Pvvk+nXiaPSl2eJi4vbtQPnk49IH5MOJ3VdLQYjH8eMJpn5AF1ipZQ1akMu9HhUesDcD1XbylOa5ZeeWaQQq2UtHt3iqlzv50V6RumniSBXwNwwcN5cYhL39qAiEvEo2nliI+rvi8sv/BJWselzBPj9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717063350; c=relaxed/simple;
	bh=bdC56qRyRLu0SFAStyq2sOD2Am7JE6h4a5f09loTAGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hLEl+0BB/Lttv8e3xuAzSRAQcMaW8e2nUc6KPYrlwJWa/uwXmP1cTN6xGjqA48e3GD6xFgFoSGYvyQzPqQLqEtwg1peLDjw7ecf+5qlVkqDOkijRFBJV2vPsIIwlMuqGNVDCwQtj3vWgbmLa6I2zfxpj9mcCeAwcIENzb8NIm74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+5q5biq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+5q5biq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717063349; x=1748599349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bdC56qRyRLu0SFAStyq2sOD2Am7JE6h4a5f09loTAGI=;
  b=F+5q5biqDeRNcE98PRUvoNFfYJszF0FlagiR/Ubjq5uWH3TVI4nylgHA
   3HkZbsJtAjs2mhh7Me9g5x/vHWAydHMUq6JqtUeV865mEvdBM5lfZfXz9
   0+0fTVMdNw/NReEXRwzc5/CKQjhOjr04zxDWkIxHY+Ij9F/5doT59K1tc
   PEfnu8/ZRbphHZggubYKwxvUhpT4XDCwd+PeHDCpWexS78gR883gUtB9v
   vc7Hfb+tD1gP2tETLKZ97hY59biR1VD6SMdI2kSWcpRnpvQsALoz9buBH
   rhySopYbpxFHXiOaQ+m75XsfemGs6oCmirHGkzqKYeolnd9ph0fK6OUq+
   A==;
X-CSE-ConnectionGUID: gKXqrFa4SjyU0kDDKjbYCw==
X-CSE-MsgGUID: 2iOH/gasS7SgBv77LzL75Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24942846"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="24942846"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:02:27 -0700
X-CSE-ConnectionGUID: USdyqaMBRqC2tVPOYJnXLA==
X-CSE-MsgGUID: aose0NSlSGSwexDzzAfp3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="40235289"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.132])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:02:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 4/4] drm/exynos/vidi: convert to struct drm_edid
Date: Thu, 30 May 2024 13:01:54 +0300
Message-Id: <20240530100154.317683-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240530100154.317683-1-jani.nikula@intel.com>
References: <20240530100154.317683-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Prefer the struct drm_edid based functions for storing the EDID and
updating the connector.

It would be better if the vidi connection ioctl passed in the EDID size
separately instead of relying on the extension count specified in the
EDID, but that's what we have to rely on.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 44 ++++++++++++++----------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index d93801ace79a..6de0cced6c9d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -41,7 +41,7 @@ struct vidi_context {
 	struct exynos_drm_crtc		*crtc;
 	struct drm_connector		connector;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
-	struct edid			*raw_edid;
+	const struct drm_edid		*raw_edid;
 	unsigned int			clkdiv;
 	unsigned int			connected;
 	bool				suspended;
@@ -245,23 +245,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 	}
 
 	if (vidi->connection) {
-		struct edid *raw_edid;
+		const struct drm_edid *drm_edid;
+		const struct edid *raw_edid;
+		size_t size;
 
-		raw_edid = (struct edid *)(unsigned long)vidi->edid;
-		if (!drm_edid_is_valid(raw_edid)) {
+		raw_edid = (const struct edid *)(unsigned long)vidi->edid;
+		size = (raw_edid->extensions + 1) * EDID_LENGTH;
+
+		drm_edid = drm_edid_alloc(raw_edid, size);
+		if (!drm_edid)
+			return -ENOMEM;
+
+		if (!drm_edid_valid(drm_edid)) {
+			drm_edid_free(drm_edid);
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
-		ctx->raw_edid = drm_edid_duplicate(raw_edid);
-		if (!ctx->raw_edid) {
-			DRM_DEV_DEBUG_KMS(ctx->dev,
-					  "failed to allocate raw_edid.\n");
-			return -ENOMEM;
-		}
+		ctx->raw_edid = drm_edid;
 	} else {
 		/* with connection = 0, free raw_edid */
-		kfree(ctx->raw_edid);
+		drm_edid_free(ctx->raw_edid);
 		ctx->raw_edid = NULL;
 	}
 
@@ -300,18 +304,22 @@ static const struct drm_connector_funcs vidi_connector_funcs = {
 static int vidi_get_modes(struct drm_connector *connector)
 {
 	struct vidi_context *ctx = ctx_from_connector(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int count;
 
-	edid = drm_edid_duplicate(ctx->raw_edid ?: fake_edid_info);
-	if (!edid)
+	if (ctx->raw_edid)
+		drm_edid = drm_edid_dup(ctx->raw_edid);
+	else
+		drm_edid = drm_edid_alloc(fake_edid_info, sizeof(fake_edid_info));
+
+	if (!drm_edid)
 		return 0;
 
-	drm_connector_update_edid_property(connector, edid);
+	drm_edid_connector_update(connector, drm_edid);
 
-	count = drm_add_edid_modes(connector, edid);
+	count = drm_edid_connector_add_modes(connector);
 
-	kfree(edid);
+	drm_edid_free(drm_edid);
 
 	return count;
 }
@@ -451,7 +459,7 @@ static void vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
-	kfree(ctx->raw_edid);
+	drm_edid_free(ctx->raw_edid);
 	ctx->raw_edid = NULL;
 
 	component_del(&pdev->dev, &vidi_component_ops);
-- 
2.39.2

