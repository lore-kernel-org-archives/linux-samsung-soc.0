Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5C48612E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 May 2024 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715691355; cv=none; b=JwAuJLNXNxwIHcemIvZGRyoxgBvPi1KsVtXrdJyMFy6lvLDLhbN0xWrr8JdHx7GLV3ZJOP6pxyFvChiaiTA3mOD6PFai9DPQhVvjarDUOKlmgqYeqVI3AH6dkMwbvfuRCCExz4S9Zorqkts3pufiiqq+aJlEeZpJN8KuZJ05cUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715691355; c=relaxed/simple;
	bh=rufPGwYsfmgJJZF8O5nQY4lb0oTkh06RDRE/RlmnRhI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fs+wCyUBXWW+ZPdqHWBgcXhDizj95IA+XefNOoai5pq/5SfE/Av1PLRuobJlejfD1zoGImzGekZqpo3ExPLodpJO44S7GDYtnzAFkbunzdmtsw9fiExztKsfnZakp13vhkGADqrSJYl11qNGDhGFWxcjw9a8dxKuaU3B/RLEMjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3Crfp+4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3Crfp+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715691354; x=1747227354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rufPGwYsfmgJJZF8O5nQY4lb0oTkh06RDRE/RlmnRhI=;
  b=f3Crfp+4sAUKcnVGdffebF6er8O7CGv7iWosVJa09KhI1PljzwaUNJ9X
   0WUOvgfVOFgOb3QDlwIJ0WBNz2J8nERofQnDo88SFf81ipM/+zjYzXDQU
   GQIyncyzIhZS105LWAV1YTYwOTMmp7+4/8NwvxkLshFOpsHRKiYlLun8v
   vp/zzseSBevmWBbizwSdwRPvJCXZtfapNsoYv/NKycHGkFgdO63jKqXXh
   g7FPeyIEw1Ors3zj4egl3bCdrnlZ388ES0yyvtG3dd9SK/pAxbtsN/G9t
   rigv18cz4YnLBI69Tioy78FLsQuN0oK2j8Vuk2XKIC2L9tNhbc1F04yL0
   A==;
X-CSE-ConnectionGUID: SnZjENZlQeC/0lECjWFhhw==
X-CSE-MsgGUID: enxYZDSETHKl0HKtt9ARew==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15458729"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="15458729"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 05:55:53 -0700
X-CSE-ConnectionGUID: v/dEKlCiRICdmy1xrzI0Jg==
X-CSE-MsgGUID: AU+6hwDjRImNasTMPzmKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30507475"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.91])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 05:55:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 04/11] drm/exynos: hdmi: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:10 +0300
Message-Id: <2fe0b4deb4f2ab255735cd6e1a657a17e0d45784.1715691257.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715691257.git.jani.nikula@intel.com>
References: <cover.1715691257.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Prefer the struct drm_edid based functions for reading the EDID and
updating the connector.

The functional change is that the CEC physical address gets invalidated
when the EDID could not be read.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index e968824a4c72..9033e8b66816 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -883,27 +883,30 @@ static const struct drm_connector_funcs hdmi_connector_funcs = {
 static int hdmi_get_modes(struct drm_connector *connector)
 {
 	struct hdmi_context *hdata = connector_to_hdmi(connector);
-	struct edid *edid;
+	const struct drm_display_info *info = &connector->display_info;
+	const struct drm_edid *drm_edid;
 	int ret;
 
 	if (!hdata->ddc_adpt)
 		return 0;
 
-	edid = drm_get_edid(connector, hdata->ddc_adpt);
-	if (!edid)
+	drm_edid = drm_edid_read_ddc(connector, hdata->ddc_adpt);
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	cec_notifier_set_phys_addr(hdata->notifier, info->source_physical_address);
+
+	if (!drm_edid)
 		return 0;
 
-	hdata->dvi_mode = !connector->display_info.is_hdmi;
+	hdata->dvi_mode = !info->is_hdmi;
 	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
 			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
-			  edid->width_cm, edid->height_cm);
-
-	drm_connector_update_edid_property(connector, edid);
-	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
+			  info->width_mm / 10, info->height_mm / 10);
 
-	ret = drm_add_edid_modes(connector, edid);
+	ret = drm_edid_connector_add_modes(connector);
 
-	kfree(edid);
+	drm_edid_free(drm_edid);
 
 	return ret;
 }
-- 
2.39.2

