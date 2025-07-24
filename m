Received: from mail-m32121.qiye.163.com (mail-m32121.qiye.163.com [220.197.32.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F8E27467A;
	Thu, 24 Jul 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346356; cv=none; b=H9H7tZHYIVptRQ0GphmsP44XGAkDt4y+09yd1WsY5K3ifSVHk623Lad5/Odu5BZ2AH4HbxgHhnAbjg8ZClUNb8bdnvmSA6hUNB0NqgxfCvzG8L8EsNpeZM3wCCBC1/GqII3iH2pIYBr0DQsf3TmDS30kl93wFATeFktKgWR7b+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346356; c=relaxed/simple;
	bh=dZK92fnK4fvUmBwxA1g0Hoc3a7PnpqbrPZsOnXfDbDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E1/GDUhTBnM4s3sTH9+31fQCJyfrxTt2/pNdlsI1OC435l0+A+AZteFrveR1IwDzzPk+hAN4/WZWdB/lQmoNEiZQVl/AMlU09fp/R4rMuJ0GDIQtE5AAVeoVvCVh1ZaQp0HAy+MXBX1+hPTFZV33JXQnAw0oY7M5Q1e3JpgJuro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=bfxNzPVX; arc=none smtp.client-ip=220.197.32.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="bfxNzPVX"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d1c34455;
	Thu, 24 Jul 2025 16:03:44 +0800 (GMT+08:00)
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
Subject: [PATCH v3 12/14] drm/bridge: analogix_dp: Remove panel disabling and enabling in analogix_dp_set_bridge()
Date: Thu, 24 Jul 2025 16:03:02 +0800
Message-Id: <20250724080304.3572457-13-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a983b75ad0903a3kunmbbba7af2a0b5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklCT1ZNHkwaQ0lLQhlMSxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bfxNzPVXsnPXqDBG0ztRvhRZ9csh114R/jxfBhKJwQ9GIcEDqG+5BINo4s/UUb0rn4xmfPbuwrJiGQFYBinfSGwTwwGcYI4HY1dIrae1Av45cdnI/aUo4ecWQO/YwEsswA8I8sZiq60/nsUpF93HykNY4q7XeAs46zig7TbiQyo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/UpZWUSC6M6zsft66dZBf5Ok4iS/QWzh74y+WkBpLWE=;
	h=date:mime-version:subject:message-id:from;

The &drm_panel_funcs.enable() and &drm_panel_funcs.disable() mainly
help turn on/off the backlight to make the image visible, and the
backlight operations are even needless if drm_panel_of_backlight() or
drm_panel_dp_aux_backlight() is applied, in which case the enabling
and disabling process just add necessary delays.

Therefore, it should make sense to remove panel disabling and move
panel enabling after analogix_dp_set_bridge() finished.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b67087639609..f4807ef337e6 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -840,9 +840,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 {
 	int ret;
 
-	/* Keep the panel disabled while we configure video */
-	drm_panel_disable(dp->plat_data->panel);
-
 	ret = analogix_dp_train_link(dp);
 	if (ret) {
 		dev_err(dp->dev, "unable to do link train, ret=%d\n", ret);
@@ -862,9 +859,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 		return ret;
 	}
 
-	/* Safe to enable the panel now */
-	drm_panel_enable(dp->plat_data->panel);
-
 	/* Check whether panel supports fast training */
 	ret = analogix_dp_fast_link_train_detection(dp);
 	if (ret)
@@ -1242,6 +1236,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	while (timeout_loop < MAX_PLL_LOCK_LOOP) {
 		if (analogix_dp_set_bridge(dp) == 0) {
 			dp->dpms_mode = DRM_MODE_DPMS_ON;
+			drm_panel_enable(dp->plat_data->panel);
 			return;
 		}
 		dev_err(dp->dev, "failed to set bridge, retry: %d\n",
-- 
2.34.1

