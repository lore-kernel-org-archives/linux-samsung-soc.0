From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 08/15] drm/tegra: Add support for panel prepare and unprepare
 routines
Date: Thu, 31 Jul 2014 23:12:07 +0530
Message-ID: <1406828534-10072-9-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9252 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753102AbaGaRpr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:45:47 -0400
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Modify tegra output driver to support the new panel calls:
prepare and unprepare.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/tegra/output.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 446837e..0c67d7e 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -140,7 +140,9 @@ static void tegra_encoder_dpms(struct drm_encoder *encoder, int mode)
 	if (mode != DRM_MODE_DPMS_ON) {
 		drm_panel_disable(panel);
 		tegra_output_disable(output);
+		drm_panel_unprepare(panel);
 	} else {
+		drm_panel_prepare(panel);
 		tegra_output_enable(output);
 		drm_panel_enable(panel);
 	}
-- 
1.7.9.5
