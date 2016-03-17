From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch 1/2] drm/exynos: mic: fix an error code
Date: Thu, 17 Mar 2016 13:32:15 +0300
Message-ID: <20160317103214.GA3100@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:35625 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752731AbcCQKci (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Mar 2016 06:32:38 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return success instead of a negative error code here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is the common problem introduced by do nothing gotos.  The other
issue with do nothing gotos is that they are annoying and don't actually
prevent people from putting a direct return in the middle of functions.

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 9869d70..890c9b1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -457,6 +457,7 @@ static int exynos_mic_probe(struct platform_device *pdev)
 							"samsung,disp-syscon");
 	if (IS_ERR(mic->sysreg)) {
 		DRM_ERROR("mic: Failed to get system register.\n");
+		ret = PTR_ERR(mic->sysreg);
 		goto err;
 	}
 
