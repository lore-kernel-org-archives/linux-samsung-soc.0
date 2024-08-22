Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EE31CEAC8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348604; cv=none; b=kGEC0e/7zah5DM3SY5kijBmWrlhwwQffAEy0ATdDoBaH3aIqk1T1GFDNGt6jQELvpFymnd4Ezc7Az/Q40M0jZpgLz0GV8oVgMPEgrdmFz9SNcciyfJHFRSC2y5L4SBt5RqZjKeTtoVD6eve1m0AiofWp1jYIWZc9j+nc87Xerx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348604; c=relaxed/simple;
	bh=lq2ZDp6MTf10HE4gqxlSJaCI0iEPX29iqODst1YOJcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iH60WL7mt3dN/AVISPl6i+YLPbJ2cw9HcphMldpWY1ms3pEgN5lkpdH4+PI8LyGF1ku7QXWwgwgwSyn52ia4K2J5wjBWYULz1xmKukVI6CFWGAubOHC8rCPeWmqxku586VrduiSu8ysPCD+qCyT8ZsKw/b8Ov8zJNKL4P0r1Q3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAT7EyIv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAT7EyIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724348603; x=1755884603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lq2ZDp6MTf10HE4gqxlSJaCI0iEPX29iqODst1YOJcc=;
  b=jAT7EyIvOLjTgai631CeDUcMN1tzFHC/oE/L26NRh3KQHATHbuOXev4T
   D88AJaqA6mgPhnAq7dSsMwSGuWoFfGdw5cDV2KlS/tQi4kGlhNLMXMbJd
   D+AMFHDuvuHpKIjEWDyNri3fOjShiDHHeAt8EO7ic0a6hhRXyrycWbRHY
   aDyrBbdQ3H8T0CxCZ4hiFakA8UXYTUnNFrz/s4e7Lgxt9ijsCv5XqPNbD
   lpzl4EiY51UxTXkPwStzGklhBd3+nP36+bppC5C1sm7rzjrjoHCGQco+m
   wlk2uADaBTX8iHA2WYChhdaPkxmTaE8dlZ4a8DkzHICajvZ7YY+Sut3Ky
   w==;
X-CSE-ConnectionGUID: hK86RsD9S4i6kTP8Mby6hw==
X-CSE-MsgGUID: oOyh1VWESBei1+0YD9O0EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22955395"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22955395"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:43:21 -0700
X-CSE-ConnectionGUID: 4rHKlYFvQ3KDlZAtBi6X3w==
X-CSE-MsgGUID: ZiejBel7QECrwpTufup+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="65862367"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.121])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:43:17 -0700
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
Subject: [PATCH 3/6] drm/exynos: hdmi: convert to struct drm_edid
Date: Thu, 22 Aug 2024 20:42:49 +0300
Message-Id: <be15dce66a5373a7aed797a4ef63b0ba90b231e9.1724348429.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724348429.git.jani.nikula@intel.com>
References: <cover.1724348429.git.jani.nikula@intel.com>
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

v2:
- display info usage was split to a separate patch
- check drm_edid_connector_update() return value

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
 drivers/gpu/drm/exynos/exynos_hdmi.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 25d508b25921..c9d4b9146df9 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -884,14 +884,21 @@ static int hdmi_get_modes(struct drm_connector *connector)
 {
 	struct hdmi_context *hdata = connector_to_hdmi(connector);
 	const struct drm_display_info *info = &connector->display_info;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
 	if (!hdata->ddc_adpt)
 		goto no_edid;
 
-	edid = drm_get_edid(connector, hdata->ddc_adpt);
-	if (!edid)
+	drm_edid = drm_edid_read_ddc(connector, hdata->ddc_adpt);
+
+	ret = drm_edid_connector_update(connector, drm_edid);
+	if (ret)
+		return 0;
+
+	cec_notifier_set_phys_addr(hdata->notifier, info->source_physical_address);
+
+	if (!drm_edid)
 		goto no_edid;
 
 	hdata->dvi_mode = !info->is_hdmi;
@@ -899,12 +906,9 @@ static int hdmi_get_modes(struct drm_connector *connector)
 			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
 			  info->width_mm / 10, info->height_mm / 10);
 
-	drm_connector_update_edid_property(connector, edid);
-	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
-
-	ret = drm_add_edid_modes(connector, edid);
+	ret = drm_edid_connector_add_modes(connector);
 
-	kfree(edid);
+	drm_edid_free(drm_edid);
 
 	return ret;
 
-- 
2.39.2

