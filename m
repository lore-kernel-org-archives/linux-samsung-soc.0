Received: from mail-m32100.qiye.163.com (mail-m32100.qiye.163.com [220.197.32.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F5626E6EE;
	Wed,  9 Jul 2025 07:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752044573; cv=none; b=DkgHht2MmLyKMLYcGXXpVf7xvrVxuhQmriMZo0srclIUoCjB4nVe/iZ9Ipdl8gYVWVM1lwGLvqkKRjBQHmYQ7l1nm1rI9v8u4226P2z/3xwgbmGaadZo2lEqh8CQ74gkbu+3r8JjZZ2F24vucTAEovygAFzy/yg8yXaj2QPFZvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752044573; c=relaxed/simple;
	bh=QNv1aN6kkQ7cRJS/OhrGATM7/hp+O7ptzslxhOqAIj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Im1BGaflwKuUXctDa+g+OosJSF/qcy43FE5F2Emvqy6APGDHd5wZc6y7xstSxobu91tef+bSJEYXQ9Eu/E/4TXczg8BTOhTBP5TrQ3QpVpmHNpB7DQ8B6Is0arvxCNiVleNmCcPNpZLJXFQrfqtW/b8fTMZ7RFUmbvcMUpIR4Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=QLKfXj96; arc=none smtp.client-ip=220.197.32.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="QLKfXj96"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1b69b7a4b;
	Wed, 9 Jul 2025 15:02:40 +0800 (GMT+08:00)
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
Subject: [PATCH v2 10/12] drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
Date: Wed,  9 Jul 2025 15:01:37 +0800
Message-Id: <20250709070139.3130635-11-damon.ding@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkIeGFZLHkxITxlIS0IdS0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97edfe608e03a3kunm3a7bcd50c83b97
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oio6LRw*NzEwFS8oShVPIiwS
	Qi1PChhVSlVKTE5JS09PTk1JQktOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISEhDNwY+
DKIM-Signature:a=rsa-sha256;
	b=QLKfXj96a9YV1pvZAL5Peb2LeDnC2hsKgu/NFecujwUIsqbIW7HpeyhorgWVNUycNh9+ZiqDORfXY0XVakEdxH/dSrVRIErEIZ9zJF6I1rc6O0k18qwS8MTUxVWcwROHXeLOmE2/IMGNl9jOeK156sRg7lC4ggpuLvTMtGkRW74=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=0zoLuijCCQyhN6Wyc733X8OAqKRjPBd5IuOcU3Dromw=;
	h=date:mime-version:subject:message-id:from;

Apply analogix_dp_find_panel_or_bridge() in order to move the
panel/bridge parsing from Exynos side to the Analogix side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 9e1313fdecad..9c23cde96a7f 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -196,9 +196,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct exynos_dp_device *dp;
-	struct drm_panel *panel;
-	struct drm_bridge *bridge;
-	int ret;
 
 	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
 			  GFP_KERNEL);
@@ -218,32 +215,31 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	if (np) {
 		dp->plat_data.panel = of_drm_find_panel(np);
 
-		of_node_put(np);
 		if (IS_ERR(dp->plat_data.panel))
 			return PTR_ERR(dp->plat_data.panel);
 
 		goto out;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
-	if (ret)
-		return ret;
-
 	/* The remote port can be either a panel or a bridge */
-	dp->plat_data.panel = panel;
-	dp->plat_data.bridge = bridge;
 	dp->plat_data.dev_type = EXYNOS_DP;
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
 	dp->plat_data.get_modes = exynos_dp_get_modes;
+	dp->plat_data.ops = &exynos_dp_ops;
 
 out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	return component_add(&pdev->dev, &exynos_dp_ops);
+	if (np) {
+		of_node_put(np);
+		return component_add(&pdev->dev, &exynos_dp_ops);
+	} else {
+		return analogix_dp_find_panel_or_bridge(dp->adp);
+	}
 }
 
 static void exynos_dp_remove(struct platform_device *pdev)
-- 
2.34.1

