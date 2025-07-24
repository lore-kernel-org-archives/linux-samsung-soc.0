Received: from mail-m32121.qiye.163.com (mail-m32121.qiye.163.com [220.197.32.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1D72D29B1;
	Thu, 24 Jul 2025 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753360777; cv=none; b=UlpS8MFmlx5MkgCSJNBM+iGloh2K4Y1/COjGI6av/pJJOZX1nF3CWKlrLbeX+vRXVvQx8804b0zaEcAJDbjeJ4IKypAsXHLmwnyppW0ZzbvV9/eXGs/7BhAu5UrIvxL6sTBKoMVSh8wahtVYYjgsKGWOgbfKonJOMy2r2+U8Kn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753360777; c=relaxed/simple;
	bh=Bc8Dpcjbg42WAE07UJNo2a4cH1Xlm64jzkwIyqufsmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EU/rERquL5gRZ0oDLuW/APiOtUdpJWdFtRMJNBxHU3H9qGWcMkFKp74w1v0BYfKgUlHe/eOdwDkWy1cWEGP32jtyyA3o83uBHB/ZUyHH0pIo8+oOAaqJNn1OUn6uygi+ZYnviLlHZn4jIIsoJBl6JBH43mciMKaoVInN/vayqF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=QaQNRK3Q; arc=none smtp.client-ip=220.197.32.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="QaQNRK3Q"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d1c343f2;
	Thu, 24 Jul 2025 16:03:31 +0800 (GMT+08:00)
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
Subject: [PATCH v3 07/14] drm/bridge: analogix_dp: Remove redundant &analogix_dp_plat_data.skip_connector
Date: Thu, 24 Jul 2025 16:02:57 +0800
Message-Id: <20250724080304.3572457-8-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a983b757bb003a3kunmbbba7af29f23
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9DHlZIGhlLHh0fTktJHUxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QaQNRK3QEGCcr5kiHPuIHkgcxwxZtAhGh7KZXSv29zNte3URKg0wUa9bu8qS6hgxowGmIX2YTVbButpC/J9K2Z3HPT2yA2mYWAZHB7urymGWtCPNZaP+dRgl2zAj/qFwGwE3S2a6au3+M1/bGIaZ3AOXecsrea6VUDG39HzcFvU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=elZsTON64Rbs8eA/23hDRwUKSVNerPscCvmr/a9VXzY=;
	h=date:mime-version:subject:message-id:from;

The &analogix_dp_plat_data.skip_connector related check can be replaced
by &analogix_dp_plat_data.bridge.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

------

Changes in v3:
- Squash the Exynos side commit and the Analogix side commit together.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 | 1 -
 include/drm/bridge/analogix_dp.h                   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 0106e7e0f093..8ce7ceb70be4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1050,7 +1050,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!dp->plat_data->skip_connector) {
+	if (!dp->plat_data->bridge) {
 		connector = &dp->connector;
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 004ab9db5216..d8bea1a00815 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -234,7 +234,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
 	dp->plat_data.get_modes = exynos_dp_get_modes;
-	dp->plat_data.skip_connector = !!bridge;
 
 out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 15cb6b706e9f..202e5eafb2cc 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -30,7 +30,6 @@ struct analogix_dp_plat_data {
 	struct drm_bridge *bridge;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
-	bool skip_connector;
 
 	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
-- 
2.34.1

