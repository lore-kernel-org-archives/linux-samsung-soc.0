Received: from mail-m49247.qiye.163.com (mail-m49247.qiye.163.com [45.254.49.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D412D3EFD;
	Wed,  9 Jul 2025 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061125; cv=none; b=ngBdMySKcEBU3RreF5u4JsWECKI7lXHhg2Nrupb5GF+qRohF1F6VR9J7EQZvSIIWwn/md6DrDBsbv8Euilb5LI0XGsgKu/9aWYqHkBejLibgAyligWrU93+F8/vCf8D/tb6IY8vEJ47KGqk8k4ls1MOwO1+Rkj90mYiIV+wlWSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061125; c=relaxed/simple;
	bh=1IfZl5n2m0tZRI7GC00+4Jmyv+FwiI2Y9ybSvWp/PjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dgwcUi2xqSLe6yYwltjfZYJFhTaiO65hAKubCrDVoDqIDJn7MRukMkgUX8y2TBCTMaHCAGz++GW2rvhq1QcFNP26suUAYDYwVRBOoq63AkQokWR8iZwFAC0fh/rytRNpor0H2FMfS0t9Vv6OTWJw1CwD1FI6Uy6qwgPed/+8nBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EiJnEfrN; arc=none smtp.client-ip=45.254.49.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EiJnEfrN"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1b69b7a28;
	Wed, 9 Jul 2025 15:02:35 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 08/12] drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of drm_simple_encoder_init()
Date: Wed,  9 Jul 2025 15:01:35 +0800
Message-Id: <20250709070139.3130635-9-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709070139.3130635-1-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkpKH1ZJSEweHktCGk5JSE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97edfe4d7c03a3kunm3a7bcd50c83b03
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MFE6KRw5MDExIy9KMxcuIioh
	EUgKCSJVSlVKTE5JS09PTk5DSUpDVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJTkNDNwY+
DKIM-Signature:a=rsa-sha256;
	b=EiJnEfrNyqDPJadLOFzu542SI3c2hgOXtYli4ATo6d1jQrwDk1QQSMgaa+MjS7Yxq4fQcsn3P0HbUPak46Gt2iIiSqehfroIvegI/8zcf3OiZbNcLeMoE4j/BdoG8fu1FmQSIl/ArRYnUtOQcuBRlDcWqt4nxO98Zzb8NjwdDlU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=zPlxZWDQIK3s2FJH/2CXtRJ9gZ/3RtAB+yN2+4NuAvE=;
	h=date:mime-version:subject:message-id:from;

Compared with drm_simple_encoder_init(), drmm_encoder_init() can handle
the cleanup automatically through registering drm_encoder_cleanup() with
drmm_add_action().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index d30f0983a53a..4ed6bf9e5377 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -29,7 +29,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -377,8 +376,7 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
 							     dev->of_node);
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
 
-	ret = drm_simple_encoder_init(drm_dev, encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drmm_encoder_init(drm_dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		DRM_ERROR("failed to initialize encoder with drm\n");
 		return ret;
-- 
2.34.1

