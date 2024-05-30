Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE8A18396D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 May 2024 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717063348; cv=none; b=NaXRxdvZS2gHcrBxbrL42TQOC2e1BPrh52i9TxA2vgw+NLzteYeeFch2QO7B2u0PRvOIuHdOqlehiONLA5uFzcq6Q2rWulkldWebMVj2dMlAszmE55hqTU/qvYOH1zhpiUQTK1XPdM4kzBR0JMM9LZHZmeeVErRU4Qy8rWWTYro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717063348; c=relaxed/simple;
	bh=TV8L7SOfK4ik4ni0oilI243+kNblJd3tywN/0cG5/qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CP6A29stqHECvuO7YFmadSf5c9Kef5apR8ibFim765o6653q1AERiumluKpnDm4I1kTlxGlk1i3zSYRKceFzrUpfAqI0GqT5KWh0kRaislNHmVPvGWaTHhABMv3df5TfQzncsYvZNwFwU78eiACKt6A4MceAuGoARHZED9/NWx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eG28fZYp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eG28fZYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717063347; x=1748599347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TV8L7SOfK4ik4ni0oilI243+kNblJd3tywN/0cG5/qk=;
  b=eG28fZYphVzyT0Yv8rIz1O9XK6QDUtKHVczYikyM0oFCXj4fsjx2nART
   vm3yyAIfsDLiT5nEq5noRhuksR0mFO1V4lB6l1cer3KvA6S0RhKpM/O5W
   9yo+A3Ff5DQxdAHEmq3wMnh5QjBCOhZPy7LWaDAGWohsM+6THjszaf9Dk
   +Sp0TC0SLcCse3qu7ZEYZqYaD47kVxp2MN6cGT4A2R0PqYoTR12oeDZd5
   ME5OVHBXHklMyuZSitnEOUP6vVmQmrK0ppW34iF8bf2Nm2FJlym9kF+2V
   g1OaUcdS67+Gufheu4tHEMtI3xZhlDCAMCNt7Wfp4Czcj0huLqDQs/Ept
   g==;
X-CSE-ConnectionGUID: PzGG6FlgQ2yL/Yd02KRCvw==
X-CSE-MsgGUID: yYHTjr6lRoyuC5cSkkTEiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24942841"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="24942841"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:02:27 -0700
X-CSE-ConnectionGUID: r/VNIMo/QmWVkH1yT9iFTg==
X-CSE-MsgGUID: preaaPqTSQ2aCTnQMxZ0pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="40235192"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.132])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:02:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 3/4] drm/exynos/vidi: simplify fake edid handling
Date: Thu, 30 May 2024 13:01:53 +0300
Message-Id: <20240530100154.317683-3-jani.nikula@intel.com>
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

Avoid assigning fake_edid_info to ctx->raw_edid. Always keep
ctx->raw_edid either an allocated pointer or NULL. Defer fake_edid_info
handling to .get_modes().

This should be functionally equivalent but slightly easier to follow.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 40 +++++++-----------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index f613df719a02..d93801ace79a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -195,12 +195,11 @@ static ssize_t vidi_store_connection(struct device *dev,
 	if (ctx->connected > 1)
 		return -EINVAL;
 
-	/* use fake edid data for test. */
-	if (!ctx->raw_edid)
-		ctx->raw_edid = (struct edid *)fake_edid_info;
-
-	/* if raw_edid isn't same as fake data then it can't be tested. */
-	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
+	/*
+	 * Use fake edid data for test. If raw_edid is set then it can't be
+	 * tested.
+	 */
+	if (ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(dev, "edid data is not fake data.\n");
 		return -EINVAL;
 	}
@@ -261,15 +260,9 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 			return -ENOMEM;
 		}
 	} else {
-		/*
-		 * with connection = 0, free raw_edid
-		 * only if raw edid data isn't same as fake data.
-		 */
-		if (ctx->raw_edid && ctx->raw_edid !=
-				(struct edid *)fake_edid_info) {
-			kfree(ctx->raw_edid);
-			ctx->raw_edid = NULL;
-		}
+		/* with connection = 0, free raw_edid */
+		kfree(ctx->raw_edid);
+		ctx->raw_edid = NULL;
 	}
 
 	ctx->connected = vidi->connection;
@@ -310,16 +303,7 @@ static int vidi_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int count;
 
-	/*
-	 * the edid data comes from user side and it would be set
-	 * to ctx->raw_edid through specific ioctl.
-	 */
-	if (!ctx->raw_edid) {
-		DRM_DEV_DEBUG_KMS(ctx->dev, "raw_edid is null.\n");
-		return 0;
-	}
-
-	edid = drm_edid_duplicate(ctx->raw_edid);
+	edid = drm_edid_duplicate(ctx->raw_edid ?: fake_edid_info);
 	if (!edid)
 		return 0;
 
@@ -467,10 +451,8 @@ static void vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
-	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
-		kfree(ctx->raw_edid);
-		ctx->raw_edid = NULL;
-	}
+	kfree(ctx->raw_edid);
+	ctx->raw_edid = NULL;
 
 	component_del(&pdev->dev, &vidi_component_ops);
 }
-- 
2.39.2

