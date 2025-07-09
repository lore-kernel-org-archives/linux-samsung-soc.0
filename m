Received: from mail-m19731110.qiye.163.com (mail-m19731110.qiye.163.com [220.197.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED78826E71D;
	Wed,  9 Jul 2025 07:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752044556; cv=none; b=otPqmg3Z8REmI8TU3Z/7g702pRDfnHx0YXLU90Yx6P/8VUGmMKJ0CnvB9xcV0UwUvcCMwZqehbAobACj3ocF4onXtcTYx9IZ0hTa59b1GZhPMB0IG0y5cRQ88cbZ5eYmNWbe1wpUKHW/obOVhAlMGR6j1+w3rjPvR662WZImp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752044556; c=relaxed/simple;
	bh=IU3dVT44HTJ1x3IsPqfZXnYKBGmJWldIbLDLo8C0H+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VnpM8fro8n+BKOPv1y1cKBAug/QQSKqjX04uA0GcDvzH3NPLDebUCyJVDny7Cgok0uaA8siOQ+citcw4h1LHkZFr80ar58v39SH0cmUWAbIZkFaAZsq2CD1gGCHdkRMayA49smv7h9AGG2L53XcvbjM8Cgww9EmrZezBOhdkde4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=BpoudCOr; arc=none smtp.client-ip=220.197.31.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="BpoudCOr"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1b69b79c4;
	Wed, 9 Jul 2025 15:02:23 +0800 (GMT+08:00)
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
Subject: [PATCH v2 03/12] drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
Date: Wed,  9 Jul 2025 15:01:30 +0800
Message-Id: <20250709070139.3130635-4-damon.ding@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0saGVYeT0lOGEpJTU9NHhpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJMTU
	xVSktLVUtZBg++
X-HM-Tid: 0a97edfe1e1c03a3kunm3a7bcd50c83959
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORA6Aio6ATEwQi8xFRc1IitI
	PzIaFEpVSlVKTE5JS09PTk9OTU9DVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSU1NNwY+
DKIM-Signature:a=rsa-sha256;
	b=BpoudCOrY1RpYIeMSkvrK+vzgtFiQKAu2bDmF0bMIRwmzMWuKmIvWX9GbbvNmuho85MQsK1Ku6TjFuckKJ2VnVTXfWcKrXHOojPF3DfB6zSEGh+dNo3pNpcuzF8ko5XC9JtVFJJ9uk0DkQl1UC07OaLJDMrCMDTR/Vvu4lGJwYg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PewsLHkceWyRvdTSxULk4/P8ldyIOQ9uY/Rr+3pxG9Y=;
	h=date:mime-version:subject:message-id:from;

In order to move the parnel/bridge parsing and attachmenet to the
Analogix side, add component struct drm_bridge *bridge to platform
data struct analogix_dp_plat_data.

The movemenet makes sense because the panel/bridge should logically
be positioned behind the Analogix bridge in the display pipeline.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 include/drm/bridge/analogix_dp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index cf17646c1310..15cb6b706e9f 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -27,6 +27,7 @@ static inline bool is_rockchip(enum analogix_dp_devtype type)
 struct analogix_dp_plat_data {
 	enum analogix_dp_devtype dev_type;
 	struct drm_panel *panel;
+	struct drm_bridge *bridge;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	bool skip_connector;
-- 
2.34.1

