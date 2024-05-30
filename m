Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946CA18396D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 May 2024 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717063335; cv=none; b=GHj3odukO9dHJDQ3r4ZrPu8VA2ack6CufhxSNbUJZPJWbEUHP4jIyIt6OwosXJ1YLXVG0JMPF3tN+h7uG4aRv4NhDBeB0UoLf+fPGL++k3qlwMw+hPUxeacdyz4aEC5fg2kFfaJR7k5uB6Xv9zMmc1zATsCrQpm+ki7ay434/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717063335; c=relaxed/simple;
	bh=m5WISLEMqfoNeM122Roua0nYgI5s4y5ndZ/g5kaDfME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ejaj13VxOGg2eFfMu/limGSUctOv9gzpgWJY1spIl8cvI1id8wAx0etpeie9uCmrJl7MVh853lu/0PbExmzdjuNWmTnel46GX/GXaeyy7G6A2/PvQliWkasMiDVug7XC69Y1cpf0Zyd+LE+k9PpxTWFZIY7dBxM1bkNxEZEK0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5H0jgET; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5H0jgET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717063334; x=1748599334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m5WISLEMqfoNeM122Roua0nYgI5s4y5ndZ/g5kaDfME=;
  b=P5H0jgETax2iQqjafADarzSYf7ev2eC2GqP6R0/Smvdg5R2iL0HL0MYx
   bZe/lCOEpE1UJDiLs1CBgekFZ78uPzkSCklm6Z9urC+V5GT1MUQx21L5R
   SfEbADxh4JADpMjKJgKHBn/Aj9htSKSmcMAL7HPW5O9nh2xqAac7LB2Xw
   REFBqmg2L60NmJNDRnEcoMAu8mS2UbrahE5nPRgisBgJ1KoEvCn6/CyLd
   TQc88cry7/BdDzIY83a/IEj2F06aQN2fiy0aplnr8fSghefbqaTvX5AvZ
   4/LpgCT/L58wCq9FTBGChvRQyXc1q1JEND/HFNS30xi5Objx2mS8cMZzM
   w==;
X-CSE-ConnectionGUID: Ut+rQZ6fRGGhXtaezSe3xA==
X-CSE-MsgGUID: cMzisG5MShaZ1Xx8BYHT2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24942815"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="24942815"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:02:13 -0700
X-CSE-ConnectionGUID: lxyK9rz0Q7+v/HD2lNqHwg==
X-CSE-MsgGUID: +zGJSRRWTcuPnOqn7+gXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="40235103"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.132])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:02:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 2/4] drm/exynos/vidi: use drm_edid_duplicate()
Date: Thu, 30 May 2024 13:01:52 +0300
Message-Id: <20240530100154.317683-2-jani.nikula@intel.com>
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

Don't open code drm_edid_duplicate(). While at it, drop the error
message on allocation failure.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 11a720fef32b..f613df719a02 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -308,7 +308,6 @@ static int vidi_get_modes(struct drm_connector *connector)
 {
 	struct vidi_context *ctx = ctx_from_connector(connector);
 	struct edid *edid;
-	int edid_len;
 	int count;
 
 	/*
@@ -320,12 +319,9 @@ static int vidi_get_modes(struct drm_connector *connector)
 		return 0;
 	}
 
-	edid_len = (1 + ctx->raw_edid->extensions) * EDID_LENGTH;
-	edid = kmemdup(ctx->raw_edid, edid_len, GFP_KERNEL);
-	if (!edid) {
-		DRM_DEV_DEBUG_KMS(ctx->dev, "failed to allocate edid\n");
+	edid = drm_edid_duplicate(ctx->raw_edid);
+	if (!edid)
 		return 0;
-	}
 
 	drm_connector_update_edid_property(connector, edid);
 
-- 
2.39.2

