Received: from mail-m1973194.qiye.163.com (mail-m1973194.qiye.163.com [220.197.31.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5433F2749F4;
	Thu, 24 Jul 2025 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753345128; cv=none; b=ZsytMBzAqiCvh+lURR1m3uy+bLPj6GVXVQ2FtSS6Ol1Bcijq4JnLGCpSez2Eq5LIjRSZZuJZIjFKWwZlPlLeyoVGzFjU+eOHaWYfiuurm1lhsVUfEAdICBrkwGcoGHdzNeMavcVbcPO4WyZ57PYI3/mkwftpbgE0JNoV5geGd/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753345128; c=relaxed/simple;
	bh=IU3dVT44HTJ1x3IsPqfZXnYKBGmJWldIbLDLo8C0H+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k/8zm7AtvX+FfSmQq94QVCrc95zazKen4idIoBbYoRg2+3ogmhNVVkOGpbOwN1aFT0WX0aQjwZM/XGF7AtM4qkUMVWg1zeKgOgYBbv0LoQDKtPBr8H9ERP6PrbNkFmzWsh+WLfUtJnZ194GcmZ7OVMoq4AqBhuEl9+ESx/Nc9+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=fvrDZiti; arc=none smtp.client-ip=220.197.31.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="fvrDZiti"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d1c343c1;
	Thu, 24 Jul 2025 16:03:24 +0800 (GMT+08:00)
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
Subject: [PATCH v3 04/14] drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
Date: Thu, 24 Jul 2025 16:02:54 +0800
Message-Id: <20250724080304.3572457-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724080304.3572457-1-damon.ding@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983b755e6503a3kunmbbba7af29e4d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk1JHlYdSUwdHR8dHk9IHU9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fvrDZitiqPsnkbshS2zs1sVJ8+w5cmlv8Hwci7xudfoQVT+Uyctobkjw4GnICUaA//hNpV66aGrhTp9usI2keUViGj/rhk6PFMu7tZKIKNZItatdXYS9Mcw+61qQMdMfQtlyd4BrwhRGp6ohKk3yn5xrnLffPK3Stix9ALX24Oc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
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

